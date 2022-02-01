local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = false}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.mapbuf(buf, mode, lhs, rhs, opts)
  local options = {noremap = true, silent = false}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

function M.mapcurbuf(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = false}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

return M
