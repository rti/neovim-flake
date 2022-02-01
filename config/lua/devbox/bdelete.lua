local M = {}

local wk = require("which-key")

function M.setup()
  wk.register({
    ["<leader>b"] = { name = "+buffer" },
    ["<leader>bd"] = { "<cmd>Bdelete<cr>", "Unload buffer" },
    ["<leader>bD"] = { "<cmd>Bdelete!<cr>", "Force unload buffer" },
  })
end

return M
