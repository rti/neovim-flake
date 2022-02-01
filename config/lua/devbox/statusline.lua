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
        { 'diff' },
        -- {
        --   'diff',
        --   colored = true, -- Displays a colored diff status if set to true
        --   diff_color = {
        --     -- Same color values as the general color option can be used here.
        --     -- added    = 'GitSignsAdd',    -- Changes the diff's added color
        --     -- modified = 'GitSignsChange', -- Changes the diff's modified color
        --     -- removed  = 'GitSignsDelete', -- Changes the diff's removed color you
        --     added    = 'DiffAdd',    -- Changes the diff's added color
        --     modified = 'DiffChange', -- Changes the diff's modified color
        --     removed  = 'DiffDelete', -- Changes the diff's removed color you
        --   },
        --   symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
        -- },
        { 'diagnostics', sources = { 'nvim_diagnostic' } }
      },
      lualine_c = {
        { gps.get_location, cond = gps.is_available },
      }
    }
  }
end

return M
