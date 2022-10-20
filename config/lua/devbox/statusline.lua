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
        -- TODO: gps is deprecated
        { gps.get_location, cond = gps.is_available },
      },
      lualine_x = {
        -- {
        --   require("noice").api.statusline.message.get_hl,
        --   cond = require("noice").api.statusline.message.has,
        -- },
        {
          require("noice").api.statusline.command.get,
          cond = require("noice").api.statusline.command.has,
          -- color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          -- color = { fg = "#ff9e64" },
        },
        -- {
        --   require("noice").api.statusline.search.get,
        --   cond = require("noice").api.statusline.search.has,
        --   -- color = { fg = "#ff9e64" },
        -- },
        'encoding',
        'fileformat',
        'filetype',
      },
    }
  }
end

return M
