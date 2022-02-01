local M = {}

local wk = require("which-key")

function M.setup()
  vim.g.symbols_outline = {
    auto_preview = false,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
    toggle_preview = "<C-h>",
    },
  }

  wk.register({
    ["<leader>vv"] = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline" },
  })

  vim.cmd[[hi! link FocusedSymbol IncSearch]]
  vim.cmd[[hi! link Pmenu Normal]]
end

return M
