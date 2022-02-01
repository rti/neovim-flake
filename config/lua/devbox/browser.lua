local M = {}

local wk = require("which-key")

function M.setup()
  vim.cmd[[let g:openbrowser_default_search = 'duckduckgo']]
  wk.register({
    ["gx"] = { "<plug>(openbrowser-smart-search)", "Open in web browser" },
  }, { mode = "n" })
  wk.register({
    ["gx"] = { "<plug>(openbrowser-smart-search)", "Open in web browser" },
  }, { mode = "v" })
end

return M

