local M = {}

local gps = require("nvim-gps")
local lualine = require("lualine")
-- local noice = require("noice")

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
      section_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = ''},
      -- section_separators = {left = ' ', right = ' '},
      component_separators = { left = ' ', right = ' ' }
    },
    sections = {
      lualine_a = { 
        { 
          'mode', 
          separator = { left = '' } 
        } 
      },
      lualine_b = {
        { 'filename', path = 1 },
        { 'diff', colored = true },
        { 'diagnostics', sources = { 'nvim_diagnostic' } }
      },
      lualine_c = {
        -- TODO: gps is deprecated
        { gps.get_location, cond = gps.is_available },
      },
      lualine_x = {
        -- {
        --   noice.api.statusline.mode.get,
        --   cond = require("noice").api.statusline.mode.has,
        -- },
        -- {
        --   noice.api.statusline.command.get,
        --   cond = require("noice").api.statusline.command.has,
        -- },
      },
      lualine_y = {
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_z = { 
        {
          'location',
          'progress',
          separator = { right = '' },
        }
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        { 'filename', path = 1 },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    -- winbar = {
    --   lualine_b = {
    --     { 'filename', path = 1 },
    --   },
    -- },
    -- inactive_winbar = {
    --   lualine_b = {
    --     { 'filename', path = 1 },
    --   },
    -- },
  }
end

return M
