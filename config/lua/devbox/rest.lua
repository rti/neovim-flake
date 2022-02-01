local M = {}

local wk = require("which-key")

function M.init_mapping()
  wk.register({
    ["<leader>rr"] = { "<cmd>lua require('rest-nvim').run()<cr>", "Run rest request" },
  }, { buffer = 0 })
end

function M.setup()
  require("rest-nvim").setup({
    result_split_horizontal = false,
    skip_ssl_verification = false,
    highlight = {
      enabled = true,
      timeout = 150,
    },
    result = {
      show_url = true,
      show_http_info = true,
      show_headers = true,
    },
    jump_to_request = false,
  })

  vim.cmd[[
    augroup ft_http_setup_mapping
        autocmd! filetype <buffer>
        autocmd filetype http lua require('devbox/rest').init_mapping()
    augroup END
  ]]
end

return M
