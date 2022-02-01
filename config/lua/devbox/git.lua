local M = {}

local wk = require("which-key")

function M.setup()

  wk.register({
    ['<leader>gs'] = { ':vertical Git|exe "norm \\<C-w>L"<CR>', "Git status" },
    ['<leader>gl'] = { ':vertical Git log --oneline --graph --all<CR>', "Git log" },
    ['<leader>gL'] = { ':Gclog<CR>', "Git clog" },
    ['<leader>gb'] = { ':Git blame<CR>', "Git blame file" },
    ['<leader>gp'] = { ':Git push<CR>', "Git push" },
    ['<leader>gP'] = { ':Git push -f<CR>', "Git force push" },
    ['<leader>gf'] = { ':diffget //2<CR>', "Diff get left" },
    ['<leader>gj'] = { ':diffget //3<CR>', "Diff get right" },
  })

  require('gitsigns').setup({
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },

    numhl = false,
    linehl = false,
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    diff_opts = { internal = true, },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      -- Actions
      map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>tb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,

  })
end

return M
