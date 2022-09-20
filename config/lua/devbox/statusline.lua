local M = {}

local gps = require("nvim-gps")
local lualine = require("lualine")

function M.setup()
  gps.setup()

  lualine.setup {
    options = {
      extensions = {
        'quickfix',
        'fugitive',
        'toggleterm',
        'symbols-outline',
        'nvim-tree'
      },
      icons_enabled = true,
      theme = 'auto',
      -- section_separators = {left = '', right = ''},
      -- section_separators = { left = '', right = ''},
      section_separators = {left = '', right = ''},
      component_separators = {left = '', right = ''}
    },
    sections = {
      lualine_b = {
        { 'filename', path = 1 },
        { 'diff', colored = true },
        { 'diagnostics', sources = { 'nvim_diagnostic' } }
      },
      lualine_c = {
        { gps.get_location, cond = gps.is_available },
      }
    }
  }
end

return M
