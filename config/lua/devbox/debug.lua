local M = {}

local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require("nvim-dap-virtual-text")
local wk = require("which-key")
local jdtls = require('jdtls')

function M.setup()
  -- dap.adapters.node2 = {
  --   type = 'executable',
  --   command = 'node',
  --   -- TODO: find a better path
  --   args = {os.getenv('HOME') .. '/vscode-node-debug2/out/src/nodeDebug.js'},
  -- }

  dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/.local/lib/vscode-firefox-debug/dist/adapter.bundle.js'},
  }

  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Debug (Attach) - Remote";
      hostName = "127.0.0.1";
      port = 8000;
    },
  }

  dap.configurations.typescript = {
    -- {
    --   name = 'Launch node',
    --   type = 'node2',
    --   request = 'launch',
    --   program = '${file}',
    --   cwd = vim.fn.getcwd(),
    --   sourceMaps = true,
    --   protocol = 'inspector',
    --   console = 'integratedTerminal',
    -- },
    -- {
    --   -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    --   name = 'Attach to node',
    --   type = 'node2',
    --   request = 'attach',
    --   processId = require'dap.utils'.pick_process,
    -- },
    {
      name = 'Launch firefox',
      type = 'firefox',
      request = 'launch',
      reAttach = false, -- caused hangs
      url = 'http://localhost:8081/',
      webRoot= "/home/devbox/workspace",
      firefoxExecutable = '/usr/bin/firefox',
    },
    -- {
    --   name= "Attach to firefox",
    --   type= "firefox",
    --   request= "attach",
    --   url= "http://localhost:8081/",
    --   webRoot= "/home/devbox/workspace",
    --   firefoxExecutable = '/usr/bin/firefox'
    -- },
  }

  dap.configurations.javascript = dap.configurations.typescript
  dap.configurations.vue = dap.configurations.typescript

  vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
  vim.fn.sign_define("DapBreakpointCondition", {text = '', texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapStopped', {text='🧲', texthl='', linehl='debugPC', numhl=''})

  -- jdtls.setup_dap({ hotcodereplace = 'auto' })

  wk.register({
    ["<leader>d"] = { name = "+debug" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Debug continue" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Debug step into" },
    ["<leader>dn"] = { "<cmd>lua require'dap'.step_over()<cr>", "Debug step over " },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_out()<cr>", "Debug step out" },
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Debug toggle breakpoint" },
  })

  dap_virtual_text.setup {
      enabled = true,                     -- enable this plugin (the default)
      enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true,            -- show stop reason when stopped for exceptions
      commented = false,                  -- prefix virtual text with comment string
      -- experimental features:
      virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
      all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                          -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  }

  dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },
    sidebar = {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.5, -- Can be float or integer > 1
        },
        { id = "stacks", size = 0.3 },
        { id = "breakpoints", size = 0.1 },
        { id = "watches", size = 0.1 },
        -- { id = "scopes", size = 0.25 },
        -- { id = "breakpoints", size = 0.25 },
        -- { id = "stacks", size = 0.25 },
        -- { id = "watches", size = 00.25 },
      },
      size = 60,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
      elements = { "repl" },
      size = 5,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
  })

  wk.register({
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Debugger toggle UI" },
  })
  -- map('n', '<leader>du', ":lua require('dapui').toggle()<CR>")

  require('telescope').load_extension('dap')
end

return M

