local M = {}

local wk = require("which-key")

function M.setup()
  require'nvim-web-devicons'.setup {
    default = true;
  }

  -- ABBREVS
  vim.cmd[[iabbrev @@ mail@rtti.de]]
  vim.cmd[[iabbrev waht what]]

  -- terminal title
  vim.cmd[[let &titlestring = "%t %m" . " — " . expand('%:p:h') . " — NeoVIM"]]

  -- save and restore view
  vim.cmd('autocmd QuitPre  * silent! mkview')
  vim.cmd('autocmd BufLeave * silent! mkview')
  vim.cmd('autocmd BufRead  * silent! loadview')

  wk.register({
    ["<leader>r"] = { name = "+run" },
    ["<leader>rl"] = { "<Plug>(Luadev-RunLine)<cr>", "Run lua line" },
    ["<leader>rr"] = { "<Plug>(Luadev-Run)<cr>", "Run lua" },
    -- TODO run selection?
    -- TODO own file
    -- TODO mapping to start :Luadev
    -- TODO what is a small step for vimkind?

    ["<M-h>"] = { "<C-w>h", "Switch to window on the left" },
    ["<M-l>"] = { "<C-w>l", "Switch to window on the right" },
    ["<M-k>"] = { "<C-w>k", "Switch to window on the top" },
    ["<M-j>"] = { "<C-w>j", "Switch to window on the bottom" },

    ["<C-w>s"] = { ":split<cr>", "Split window horizontally" },

    ["K"] = { "i<CR><ESC>", "Split line at cursor" },
    ["Q"] = { "<NOP>", "Ex mode NOP" },

    ["]l"] = { ":lnext<cr>", "Next location list item" },
    ["[l"] = { ":lprevious<cr>", "Previous location list item" },
    ["]q"] = { ":cnext<cr>", "Next quickfix list item" },
    ["[q"] = { ":cprevious<cr>", "Previous quickfix list item" },
    ["]b"] = { ":bnext<cr>", "Next buffer" },
    ["[b"] = { ":bprevious<cr>", "Previous buffer" },

    -- tabs
    ["]t"] = { ":tabnext<cr>", "Next tab" },
    ["[t"] = { ":tabprevious<cr>", "Previous tab" },
    ["<C-w>t"] = { ":tabnew<cr>", "Create new tab" },

    -- save and quit with leader
    ["<leader>w"] = { ":w<cr>", "Write buffer" },
    ["<leader>W"] = { ":w<cr>", "Write all buffers" },
    ["<leader>q"] = { ":q<cr>", "Close window" },
    ["<leader>Q"] = { ":qa<cr>", "Close vim" },

    -- format, clear tailing spaces
    ["<leader>fw"] = { ":%s/ \\+$//|nohlsearch<CR>", "Format remove tailing whitespaces" },

    -- close all other windows
    ["<leader>o"] = { ":only<cr>", "Make this the only window" },
  })

  -- highlight yank
  -- TODO: use lua autogroup api
  vim.cmd [[
    augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
    augroup END
  ]]

  -- C-z leads to terminal hang when running in a docker terminal, disable it
  -- vim.cmd[[map <C-z> <NOP>]]

  -- autoread
  -- TODO: review, how does it relate to our no time check patch?
  -- trigger `autoread` when files changes on disk, needs :set autoread
  -- vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
  -- notification after file change
  -- vim.cmd([[autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]])

  -- write with sudo
  -- vim.cmd('command! WW w !sudo tee % >/dev/null')
end

return M
