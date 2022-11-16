local M = {}

function M.setup()
  local indent = 2
  vim.opt.autoread = true -- automatically read file on mod
  vim.opt.clipboard = "unnamedplus" -- use the system clipboard
  vim.opt.colorcolumn = "0" -- Column highlighted to align text at
  vim.opt.completeopt = "menu,menuone" -- Completion options
  vim.opt.copyindent = true -- TODO: what it this?
  vim.opt.cursorline = true -- A line highlighting the cursor position
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.gdefault = true -- TODO: what is this?
  vim.opt.guifont = "JetBrainsMono Nerd Font:h10"
  vim.opt.hidden = true -- Enable modified buffers in background
  vim.opt.ignorecase = true -- Ignore case
  vim.opt.joinspaces = false -- No double spaces with join after a dot
  vim.opt.list = true -- Show some invisible characters
  -- vim.opt.listchars = 'tab:▸ ,eol:¬,trail:-,precedes:←,extends:→,space:·,nbsp:·'
  vim.opt.listchars = "tab:▸ ,trail:-,precedes:←,extends:→"
  vim.opt.mouse = "a" -- Mouse support
  vim.opt.number = true -- Absolute line number
  vim.opt.relativenumber = true -- Relative line numbers
  vim.opt.scrolloff = 4 -- Lines of context
  vim.opt.shell = "zsh" -- Use zsh shell
  -- vim.opt.shell = 'fish'                             -- Use zsh shell
  vim.opt.shiftround = true -- Round indent
  vim.opt.shiftwidth = indent -- Size of an indent
  vim.opt.shortmess = "filnxttTF" -- Shorten certain messages
  vim.opt.showcmd = true -- Show (partial) command in last line
  vim.opt.showmode = false -- last line shows insert mode
  vim.opt.sidescrolloff = 8 -- Columns of context
  vim.opt.signcolumn = "yes:2" -- reserve space for 3 signs
  vim.opt.smartcase = true -- Don't ignore case with capitals
  vim.opt.smartindent = true -- Insert indents automatically
  vim.opt.splitbelow = true -- Put new windows below current
  vim.opt.splitright = true -- Put new windows right of current
  vim.opt.swapfile = false -- Use a swapfile for the buffer
  vim.opt.tabstop = indent -- Number of spaces tabs count for
  vim.opt.termguicolors = true -- True color support
  vim.opt.title = true -- Set terminal title
  vim.opt.undofile = true -- TODO: what it this?
  vim.opt.updatetime = 150 -- TODO: what it this?
  vim.opt.viewoptions = "cursor,folds" -- What to save with mkview
  vim.opt.whichwrap = "b,s,h,l" -- TODO: what it this?
  vim.opt.wildignore = "*.d,*.lst,*.map,*.o,*/node_modules/*,*/dist/*"
  vim.opt.wrap = false -- Disable line wrap
  vim.opt.fillchars = "diff: " -- Fill chars
  vim.opt.cmdheight = 0 -- neovim 0.8 cmd line hiding

  vim.g.mapleader = " "
  vim.g.netrw_nogx = 1
  vim.g.camelcasemotion_key = ","
end

return M
