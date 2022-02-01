local M = {}

local wk = require("which-key")

function M.setup()
  require'nvim-web-devicons'.setup {
    default = true;
  }

  wk.register({
    ["<leader>r"] = { name = "+run" },
    ["<leader>rl"] = { "<Plug>(Luadev-RunLine)<cr>", "Run lua line" },
    ["<leader>rr"] = { "<Plug>(Luadev-Run)<cr>", "Run lua" },
    -- TODO run selection?
    -- TODO own file
    -- TODO mapping to start :Luadev
    -- TODO what is a small step for vimkind?
    ["<leader>k"] = { "<Cmd>Cheatsheet<cr>", "Show CheatSheet" },
  })

  vim.cmd [[
    augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
    augroup END
  ]]
end

return M
