local M = {}

-- TODO: merged in master already
local stabilize = require('stabilize')

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

  -- auto equal resize splits on vim resize
  vim.api.nvim_create_autocmd({ "VimResized", "CursorHoldI" }, {
    callback = function ()
      vim.cmd("wincmd =")
    end,
  })

  -- auto resize splits on split or window close
  vim.o.equalalways = true;
end

return M
