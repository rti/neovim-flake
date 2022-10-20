local M = {}

local noice = require('noice')
local border = require('devbox/border').border

function M.setup()
  noice.setup({
    cmdline = {
      enabled = true, -- disable if you use native command line UI
      view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        cmdline = { pattern = "^:", icon = " " },
        search_down = { kind = "search", pattern = "^/", icon = " " },
        search_up = { kind = "search", pattern = "^%?", icon = " " },
        filter = { pattern = "^:%s*!", icon = "❱ ", opts = { buf_options = { filetype = "sh" } } },
        lua = { pattern = "^:%s*lua%s+", icon = " ", opts = { buf_options = { filetype = "lua" } } },
        -- lua = false, -- to disable a format, set to `false`
      },
      -- view_search = "cmdline_popup_search", -- view for rendering the cmdline for search
      -- opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
      -- icons = {
      --   ["/"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch", firstc = false },
      --   ["?"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch", firstc = false },
      --   [":"] = { icon = " ", hl_group = "NoiceCmdlineIcon", firstc = false },
      -- },
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
          style = border,
          -- padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
      cmdline_popup_search = {
        position = { row = "3%", col = "50%" },
        border = {
          style = border,
          -- padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
      mini = {
        border = {
          style = border,
          -- padding = { 2, 2 },
        },
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
        timeout = 7500,
        reverse = false,
      },
    },

    routes = {
      -- skip search virtual text
      -- {
      --   filter = {
      --     event = "msg_show",
      --     kind = "search_count",
      --   },
      --   opts = { skip = true },
      -- },
    },
    status = {}, --@see the section on statusline components below
    format = {}, -- @see section on formatting
  })
end

return M
