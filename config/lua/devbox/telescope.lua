local M = {}

local wk = require("which-key")

local telescope = require('telescope')
local telescope_actions = require('telescope.actions')
local telescope_sorters = require('telescope.sorters')
local telescope_previewers = require('telescope.previewers')
local telescope_builtin = require('telescope.builtin')

local defaults = {
  vimgrep_arguments = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    "--hidden",
  },
  prompt_prefix = "   ",
  selection_caret = " ",
  entry_prefix = "  ",
  initial_mode = "insert",
  selection_strategy = "reset",
  sorting_strategy = "ascending",
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.55,
      results_width = 0.8,
    },
    vertical = {
      mirror = false,
    },
    width = 0.87,
    height = 0.80,
    preview_cutoff = 120,
  },
  file_sorter = telescope_sorters.get_fuzzy_file,
  file_ignore_patterns = {'%.d','%.lst','%.map','%.o','^node_modules$', '^dist$', '^\\.git$', '%.min.js' },
  generic_sorter = telescope_sorters.get_generic_fuzzy_sorter,
  path_display = { "truncate" },
  winblend = 0,
  border = {},
  -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
  borderchars = { '▔', '▕', '▁', '▏', '🭽', '🭾', '🭿', '🭼'},
  color_devicons = true,
  use_less = true,
  set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  file_previewer = telescope_previewers.vim_buffer_cat.new,
  grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
  qflist_previewer = telescope_previewers.vim_buffer_qflist.new,
  -- Developer configurations: Not meant for general override
  -- buffer_previewer_maker = telescope_previewers.buffer_previewer_maker,

  mappings = {
    i = {
      ["<c-j>"] = telescope_actions.select_default + telescope_actions.center,
      ["<esc>"] = telescope_actions.close,
      -- ["jk"] = telescope_actions.close,
      ["<c-n>"] = telescope_actions.cycle_history_next,
      ["<c-p>"] = telescope_actions.cycle_history_prev,
      ["<tap>"] = false,
    },
    n = {
      ["<esc>"] = telescope_actions.close,
      -- ["jk"] = telescope_actions.close,
      ["<tap>"] = false,
    },
  },
}

function M.project_files()
  local opts = {} -- define here if you want to define something
  local ok = pcall(telescope_builtin.git_files, opts)
  if not ok then telescope_builtin.find_files(opts) end
end

function M.live_grep()
  local opts = {
    glob_pattern = "!.git"
  }
  telescope_builtin.live_grep(opts)
end

function M.setup()
  telescope.setup({
    defaults = defaults,
    extensions = { }
  })

  wk.register({
    ["<leader>f"] = { name = "+telescope" },
    ['<leader>ff'] = { ':lua require("devbox/telescope").project_files()<CR>', "Telescope project files" },
    ['<leader>fb'] = { ':Telescope oldfiles cwd_only=true<CR>', "Telescope MRU files" },
    ['<leader>fB'] = { ':Telescope buffers<CR>', "Telescope buffers" },
    -- ['<leader>fg'] = { ':Telescope live_grep<CR>', "Telescope grep" },
    ['<leader>fg'] = { ':lua require("devbox/telescope").live_grep()<CR>', "Telescope grep" },
    ['<leader>fs'] = { ':Telescope lsp_document_symbols<CR>', "Telescope LSP document symbols" },
    ['<leader>fr'] = { ':Telescope lsp_references<CR>', "Telescope LSP references" },
    ['<leader>fd'] = { ':Telescope diagnostics<CR>', "Telescope diagnostics" },
    ['<leader>fm'] = { ':Telescope marks<CR>', "Telescope marks" },
    ['<leader>f"'] = { ':Telescope registers<CR>', "Telescope registers" },
    ['<leader>fh'] = { ':Telescope help_tags<CR>', "Telescope help tags" },
    ['<leader>fH'] = { ':Telescope man_pages<CR>', "Telescope man pages" },
    ['<leader>f='] = { ':Telescope spell_suggest<CR>', "Telescope spell suggestions" },
    ['<leader>fc'] = { ':Telescope commands<CR>', "Telescope commands" },
    ['<leader>fC'] = { ':Telescope command_history<CR>', "Telescope command history" },
    ['<leader>fO'] = { ':Telescope vim_options<CR>', "Telescope vim options" },
    -- ['<leader>fb'] = { ':Telescope buffers<CR>', "Telescope buffers" },
    -- ['<leader>fR'] = { ':Telescope oldfiles<CR>', "Telescope old files" },
    -- ['<leader>fG'] = { ':Telescope current_buffer_fuzzy_find<CR>', "Telescope current buffer fuzzy find" },
    -- ['<leader>fb'] = { ':Telescope buffers<CR>', "Telescope buffers" },
  })
end

return M
