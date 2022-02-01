local M = {}

local map = require('devbox/util').map
local cmd = vim.cmd

function M.setup()
  cmd('au TermOpen * setlocal nolist nonumber norelativenumber signcolumn=no')
  -- map('n', '<leader>T', '<cmd>:terminal<CR>')

  -- <ESC> and jk in terminal enter normal mode
  map('t', '<ESC>', '<C-\\><C-N>')
  map('t', '<M-h>', '<C-\\><C-N><C-W>h')
  map('t', '<M-j>', '<C-\\><C-N><C-W>j')
  map('t', '<M-k>', '<C-\\><C-N><C-W>k')
  map('t', '<M-l>', '<C-\\><C-N><C-W>l')
  -- map('t', 'jk', '<C-\\><C-N>')

  -- TODO: why is this required?
  -- ensure CTRL-P is not doing anything else
  -- map('t', '<C-p>', '<UP>')
  -- ensure CTRL-N is not doing anything else
  -- map('t', '<C-n>', '<DOWN>')

  require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size = 15,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = 'horizontal',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
  }

  -- TODO create gitlog terminal

  -- map('n', '<leader>t', ':lua require("FTerm").toggle()<CR>')
  -- map('n', '<esc>', ':lua require("FTerm").toggle()<CR>')
  -- map('t', '<esc>', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>')

  vim.cmd [[
    augroup nvim_terminal | au!
      " entering terminal buffer for the first time
      autocmd TermEnter term://* nmap <buffer> <esc> :ToggleTerm<CR>
      " switching to terminal window/buffer
      "autocmd BufEnter term://* nmap <esc> :lua require("FTerm").toggle()<CR>
    augroup end
  ]]
end

return M

