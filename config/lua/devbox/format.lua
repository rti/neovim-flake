local M = {}

local wk = require("which-key")

function M.setup()
  wk.register({
    ["<leader>F"] = { name = "+format" },
    ["<leader>fn"] = { "<cmd>Neoformat<cr>", "Format with Neoformat" },
  })
end

return M
