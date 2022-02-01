-- https://github.com/nanotee/nvim-lua-guide
-- TODO: checkhealth reports conflicting keymaps from surround and Commentary

-- ****************************************************************************
-- OPTIONS
-- ****************************************************************************
local indent = 2
vim.opt.autoread = true                            -- automatically read file on mod
vim.opt.clipboard = 'unnamedplus'                  -- use the system clipboard
vim.opt.colorcolumn = '0'                          -- Column highlighted to align text at
vim.opt.completeopt = 'menu,menuone'               -- Completion options
vim.opt.copyindent = true                          -- TODO: what it this?
vim.opt.cursorline = true                          -- A line highlighting the cursor position
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.gdefault = true                            -- TODO: what is this?
vim.opt.guifont = "JetBrainsMono Nerd Font:h10"
vim.opt.hidden = true                              -- Enable modified buffers in background
vim.opt.ignorecase = true                          -- Ignore case
vim.opt.joinspaces = false                         -- No double spaces with join after a dot
vim.opt.list = true                                -- Show some invisible characters
-- vim.opt.listchars = 'tab:▸ ,eol:¬,trail:-,precedes:←,extends:→,space:·,nbsp:·'
vim.opt.listchars = 'tab:▸ ,trail:-,precedes:←,extends:→'
vim.opt.mouse = 'a'                                -- Mouse support
vim.opt.number = true                              -- Absolute line number
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.scrolloff = 4                              -- Lines of context
vim.opt.shell = 'zsh'                              -- Use zsh shell
-- vim.opt.shell = 'fish'                             -- Use zsh shell
vim.opt.shiftround = true                          -- Round indent
vim.opt.shiftwidth = indent                        -- Size of an indent
vim.opt.shortmess = 'filnxttTF'                    -- Shorten certain messages
vim.opt.showcmd = true                             -- Show (partial) command in last line
vim.opt.showmode = false                           -- last line shows insert mode
vim.opt.sidescrolloff = 8                          -- Columns of context
vim.opt.signcolumn = 'yes:2'                       -- reserve space for 3 signs
vim.opt.smartcase = true                           -- Don't ignore case with capitals
vim.opt.smartindent = true                         -- Insert indents automatically
vim.opt.splitbelow = true                          -- Put new windows below current
vim.opt.splitright = true                          -- Put new windows right of current
vim.opt.swapfile = false                           -- Use a swapfile for the buffer
vim.opt.tabstop = indent                           -- Number of spaces tabs count for
vim.opt.termguicolors = true                       -- True color support
vim.opt.title = true                               -- Set terminal title
vim.opt.undofile = true                            -- TODO: what it this?
vim.opt.updatetime = 150                           -- TODO: what it this?
vim.opt.viewoptions = 'cursor,folds'               -- What to save with mkview
vim.opt.whichwrap = 'b,s,h,l'                      -- TODO: what it this?
vim.opt.wildignore = '*.d,*.lst,*.map,*.o,*/node_modules/*,*/dist/*'
vim.opt.wrap = false                               -- Disable line wrap

vim.cmd[[let &titlestring = "%t %m" . " — " . expand('%:p:h') . " — NeoVIM"]]

-- TODO: required for nvim-cmp command preview window to work properly?

-- ****************************************************************************
-- SETTINGS
-- ****************************************************************************
vim.g.mapleader = ' '
vim.g.netrw_nogx = 1
vim.g.camelcasemotion_key = ','

-- ****************************************************************************
-- HELPERS
-- ****************************************************************************
-- autoread
-- trigger `autoread` when files changes on disk, needs :set autoread
-- vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
-- notification after file change
vim.cmd([[autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]])

-- save and restore view
vim.cmd('autocmd QuitPre  * silent! mkview')
vim.cmd('autocmd BufLeave * silent! mkview')
vim.cmd('autocmd BufRead  * silent! loadview')

-- write with sudo
-- vim.cmd('command! WW w !sudo tee % >/dev/null')

-- ****************************************************************************
-- MAPS
-- ****************************************************************************

-- leads to terminal hang when running in a docker terminal, better disable it
vim.cmd[[map <C-z> <NOP>]]

local wk = require("which-key")

wk.register({
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

-- ****************************************************************************
-- ABBREVS
-- ****************************************************************************
vim.cmd[[iabbrev @@ mail@rtti.de]]
vim.cmd[[iabbrev waht what]]

-- ****************************************************************************
-- SUBMODULES
-- ****************************************************************************
require('devbox/common').setup()
require('devbox/autosave').setup()
require('devbox/bdelete').setup()
require('devbox/browser').setup()
require('devbox/terminal').setup()
require('devbox/treesitter').setup()
require('devbox/lsp').setup()
require('devbox/completion').setup()
require('devbox/format').setup()
require('devbox/telescope').setup()
require('devbox/filetree').setup()
require('devbox/symbols-outline').setup()
require('devbox/statusline').setup()
require('devbox/rest').setup()
require('devbox/git').setup()
require('devbox/color').setup()
require('devbox/zen-mode').setup()
require('devbox/debug').setup()
require('devbox/misc').setup()
require('devbox/whichkey').setup()
require('devbox/dressing').setup()
require('devbox/dashboard').setup()

