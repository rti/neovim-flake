
local M = {}

function M.setup()
  -- Defines a read-write directory for treesitters in nvim's cache dir
  -- local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
  -- vim.fn.mkdir(parser_install_dir, "p")
  -- vim.opt.runtimepath:append(parser_install_dir)

  require('nvim-treesitter.configs').setup({
    -- ensure_installed = "c",
    -- ensure_installed = "all", -- currently installed by nix
    -- sync_install = false, -- only applied to `ensure_installed`
    -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
    -- parser_install_dir = parser_install_dir,

    highlight = {
      enable = true,
      disable = { "bash" }, -- bash currently broken
      additional_vim_regex_highlighting = false,
    },

    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
      enable = true,
      config = {
        http = '# %s',
      }
    },

    -- https://github.com/p00f/nvim-ts-rainbow
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int

      -- table of hex strings
      colors = { '#A8334C', '#3B8992', '#944927', '#286486', '#88507D', '#4F6C31', },

      -- table of colour name strings
      termcolors = { 'Red', 'Green', 'Yellow', 'Blue', 'Magenta', 'Cyan', 'White', }
    },

    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["aC"] = "@class.outer",
          ["iC"] = "@class.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["ae"] = "@block.outer",
          ["ie"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["is"] = "@statement.inner",
          ["as"] = "@statement.outer",
          ["am"] = "@call.outer",
          ["im"] = "@call.inner",
        },
      },
    },

    -- https://github.com/windwp/nvim-ts-autotag
    autotag = {
      enable = true,
    }
  })

end

return M
