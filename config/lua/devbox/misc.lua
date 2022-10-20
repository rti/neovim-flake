local M = {}

local stabilize = require('stabilize')
local noice = require('noice')

function M.setup_autohide_cursorline()
  -- TODO exclude nvimtree - we want the cursorline to stay there
  --vim.api.nvim_exec([[
  --augroup noclc_active_window_buffer_cursorline
  --  autocmd!
  --  autocmd WinEnter * setlocal cursorline
  --  autocmd BufEnter * setlocal cursorline
  --  autocmd WinLeave * setlocal nocursorline
  --  autocmd BufLeave * setlocal nocursorline
  --augroup END
  --]], false)
end

function M.setup()
  stabilize.setup({
    force = true, -- stabilize window even when current cursor position
    -- will be hidden behind new window
    forcemark = nil, -- set context mark to register on force event which
    -- can be jumped to with '<forcemark>
    ignore = { -- do not manage windows matching these file/buftypes
      filetype = { "help", "list", "Trouble" },
      buftype = { "terminal", "quickfix", "loclist" },
    },
    nested = nil, -- comma-separated list of autocmds that wil trigger
    -- the plugins window restore function
  })

  M.setup_autohide_cursorline()

  noice.setup({
    cmdline = {
      enabled = true, -- disable if you use native command line UI
      view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      view_search = "cmdline_popup_search", -- view for rendering the cmdline for search
      opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
      icons = {
        ["/"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
        ["?"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
        [":"] = { icon = " ", hl_group = "NoiceCmdlineIcon", firstc = false },
      },
    },
    messages = {
      -- NOTE: If you enable noice messages UI, noice cmdline UI is enabled
      -- automatically. You cannot enable noice messages UI only.
      -- It is current neovim implementation limitation.  It may be fixed later.
      enabled = true, -- disable if you use native messages UI
      view = "notify", -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "notify", -- view for warnings
      view_history = "split", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    popupmenu = {
      enabled = false, -- disable if you use something like cmp-cmdline
      ---@type 'nui'|'cmp'
      backend = "cmp", -- backend to use to show regular cmdline completions
      -- You can specify options for nui under `config.views.popupmenu`
    },
    history = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = { event = { "msg_show", "notify" }, ["not"] = { kind = { "search_count", "echo" } } },
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = true,
      view = "mini",
    },
    lsp_progress = {
      enabled = false,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      --- @type NoiceFormat|string
      format = "lsp_progress",
      --- @type NoiceFormat|string
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- frequency to update lsp progress message
      view = "mini",
    },
    hacks = {
      -- due to https://github.com/neovim/neovim/issues/20416
      -- messages are resent during a redraw. Noice detects this in most cases, but
      -- some plugins (mostly vim plugns), can still cause loops.
      -- When a loop is detected, Noice exits.
      -- Enable this option to simply skip duplicate messages instead.
      skip_duplicate_messages = false,
    },
    throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
    debug = false,
    views = {
      cmdline_popup = {
        position = { row = "3%", col = "50%" },
        border = {
          style = {
            {"🭽", "FloatBorder"},
            {"▔", "FloatBorder"},
            {"🭾", "FloatBorder"},
            {"▕", "FloatBorder"},
            {"🭿", "FloatBorder"},
            {"▁", "FloatBorder"},
            {"🭼", "FloatBorder"},
            {"▏", "FloatBorder"},
          },
          -- padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },

      mini = {
        timeout = 7500,
      },
    },

    routes = {

      -- skip search virtual text
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },

      -- as much as possible to mini view
      {
        view = "mini",
        filter = {
          any = {
            { event = "msg_show", kind = { "", "echo", "echomsg" } },
            { event = "msg_showmode", kind = { "", "echo" } },
            { event = "notify" },
            { event = "lsp" },
            { event = "noice", kind = { "stats", "debug" }, },
            -- { info = true }, -- TODO? is this the correct type? (eg for nvim tree removed success)
            { warning = true },
            { error = true },
            -- {},
          },
        },
      },
      -- {
      --   view = "mini",
      --   filter = {
      --     any = {
      --       {},
      --     },
      --   },
      --   opts = { skip = true },
      -- },
    },
    status = {}, --@see the section on statusline components below
    format = {}, -- @see section on formatting
  })
end

return M
