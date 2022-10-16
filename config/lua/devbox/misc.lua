local M = {}

local stabilize = require('stabilize')
local notify = require('notify')
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

  notify.setup(
  {
    background_colour = "Normal",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "minimal",
    stages = "static",
    timeout = 5000,
    top_down = true
  })

  vim.cmd[[
  highlight NotifyERRORBorder guifg=#8A1F1F
  highlight link NotifyERRORTitle NotifyERRORBorder
  highlight link NotifyERRORIcon NotifyERRORBorder
  highlight link NotifyERRORBody Normal

  highlight NotifyWARNBorder guifg=#79491D
  highlight link NotifyWARNIcon NotifyWARNBorder
  highlight link NotifyWARNTitle NotifyWARNBorder
  highlight link NotifyWARNBody Normal

  highlight link NotifyINFOBorder Normal
  highlight link NotifyINFOIcon Normal
  highlight link NotifyINFOTitle Normal
  highlight link NotifyINFOBody Normal

  highlight link NotifyDEBUGBorder Normal
  highlight link NotifyDEBUGIcon Normal
  highlight link NotifyDEBUGTitle Normal
  highlight link NotifyDEBUGBody Normal

  highlight link NotifyTRACEIcon Normal
  highlight link NotifyTRACEBorder Normal
  highlight link NotifyTRACETitle Normal
  highlight link NotifyTRACEBody Normal
  ]]

  noice.setup({
    cmdline = {
      enabled = true, -- disable if you use native command line UI
      view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
      icons = {
        ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
        ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
        [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
      },
    },
    messages = {
      -- NOTE: If you enable noice messages UI, noice cmdline UI is enabled
      -- automatically. You cannot enable noice messages UI only.
      -- It is current neovim implementation limitation.  It may be fixed later.
      enabled = true, -- disable if you use native messages UI
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
      opts = { enter = true },
      -- filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = true,
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
    ---@type table<string, NoiceViewOptions>
    views = {
      cmdline_popup = {
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
    }, -- @see the section on views below
    ---@type NoiceRouteConfig[]
    routes = {}, -- @see the section on routes below
    ---@type table<string, NoiceFilter>
    status = {}, --@see the section on statusline components below
    ---@type NoiceFormatOptions
    format = {}, -- @see section on formatting
  })
end

return M
