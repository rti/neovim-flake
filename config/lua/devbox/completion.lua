local M = {}

local cmp = require('cmp')
local cmp_types = require('cmp.types')
local cmp_buffer = require('cmp_buffer')
local autopairs = require('nvim-autopairs')
local border = require('devbox/border').border

-- https://github.com/jhchabran/nvim-config/blob/main/lua/jh/plugins.lua#L147
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local tabforward = function(fallback)
  if cmp.visible() then
    -- cmp.select_next_item()
  elseif vim.fn["vsnip#available"]() == 1 then
    feedkey("<Plug>(vsnip-expand-or-jump)", "")
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local tabbackwards = function(fallback)
  if not cmp.visible() and vim.fn["vsnip#jumpable"](-1) == 1 then
    feedkey("<Plug>(vsnip-jump-prev)", "")
  end
end

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

function M.setup()
  autopairs.setup({
    disable_filetype = { "TelescopePrompt" },
  })

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

      ['<C-Space>'] = cmp.config.disable,
      ['<C-y>'] = cmp.config.disable,

      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ['<ESC>'] = cmp.mapping({
        -- i = cmp.mapping.abort(), -- no extra handling, just leave insert mode
        -- c = cmp.mapping.close(), -- no extra handling, just leave command line mode
      }),

      ['<CR>'] = cmp.mapping({
        i = cmp.mapping.confirm({ select = false }),
        c = cmp.mapping.confirm({ select = false }),
      }),

      -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua
      ['<DOWN>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<UP>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),

      ['<Tab>'] = cmp.mapping({
        i = tabforward,
        s = tabforward,
        c = function(fallback)
          if not cmp.visible() then
            cmp.complete()
          end
        end
      }),

      ['<S-Tab>'] = cmp.mapping({
        i = tabbackwards,
        s = tabbackwards,
        c = function(fallback)
          -- nop
        end
      }),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = "nvim_lsp_signature_help" },
      { name = 'vsnip' },
      { name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      },
      { name = 'path' },
    }, {name="buffer"}),

    sorting = {
      comparators = {
        function(...) return cmp_buffer:compare_locality(...) end,
        -- The rest of your comparators...
      }
    },

    window = {
      completion = { border = border, },
      documentation = { border = border, },
    },

    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          nvim_lsp = "[lsp]",
          nvim_lsp_signature_help = "[lspsig]",
          buffer = "[buffer]",
          vsnip = "[vsnip]",
          path = "[path]",
        })[entry.source.name]
        return vim_item
      end
    },

    view = {
      entries = "custom" -- can be "custom", "wildmenu" or "native"
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({'/', '?'}, {
    sources = {
      { name = 'buffer' }
    },
    view = {
      -- entries = { name = 'wildmenu', separator = '|' }
      entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),

    view = {
      entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
  })

  -- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

  -- https://github.com/hrsh7th/vim-vsnip#3-create-your-own-snippet
  vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/vsnip/'

  vim.cmd[[imap <expr> <C-n> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-n>']]
  vim.cmd[[smap <expr> <C-n> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-n>']]
  vim.cmd[[imap <expr> <C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>']]
  vim.cmd[[smap <expr> <C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>']]

  vim.cmd[[
    " gray
    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#4F5E68
    " blue
    highlight! CmpItemAbbrMatch guibg=NONE guifg=#1D5573
    highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
    " light blue
    highlight! CmpItemKindVariable guibg=NONE guifg=#3F5A22
    highlight! link CmpItemKindInterface CmpItemKindVariable
    highlight! link CmpItemKindText CmpItemKindVariable
    " pink
    highlight! CmpItemKindFunction guibg=NONE guifg=#7B3B70
    highlight! link CmpItemKindMethod CmpItemKindFunction
    " front
    highlight! CmpItemKindKeyword guibg=NONE guifg=#803D1C
    highlight! link CmpItemKindProperty CmpItemKindKeyword
    highlight! link CmpItemKindUnit CmpItemKindKeyword
  ]]
end

return M
