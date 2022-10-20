local M = {}

local wk = require("which-key")

function M.setup()
  require'nvim-tree'.setup {
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd          = true,
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor       = true,
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
      -- enables the feature
      enable      = true,
    },

    open_on_setup       = false,

    actions = {
      open_file = {
        window_picker = {
          exclude = {
            filetype = {
              "notify",
              "packer",
              "qf",
              "vista",
              "noice",
            },
            buftype = {
              'terminal',
            }
          }
        }
      }
    },

    renderer = {
      group_empty = true,
    },

    view = {
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 34,

      mappings = {
        custom_only = true,
        list = {
          { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
          { key = "<C-e>",                        action = "edit_in_place" },
          { key = {"O"},                          action = "edit_no_picker" },
          { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
          { key = "<C-v>",                        action = "vsplit" },
          { key = "<C-x>",                        action = "split" },
          -- { key = "<C-t>",                        action = "tabnew" },
          { key = "<",                            action = "prev_sibling" },
          { key = ">",                            action = "next_sibling" },
          { key = "P",                            action = "parent_node" },
          { key = "<BS>",                         action = "close_node" },
          { key = "<Tab>",                        action = "preview" },
          { key = "K",                            action = "first_sibling" },
          { key = "J",                            action = "last_sibling" },
          { key = "I",                            action = "toggle_git_ignored" },
          { key = "H",                            action = "toggle_dotfiles" },
          { key = "R",                            action = "refresh" },
          { key = "a",                            action = "create" },
          { key = "d",                            action = "remove" },
          { key = "D",                            action = "trash" },
          { key = "r",                            action = "rename" },
          { key = "<C-r>",                        action = "full_rename" },
          { key = "x",                            action = "cut" },
          { key = "c",                            action = "copy" },
          { key = "p",                            action = "paste" },
          { key = "y",                            action = "copy_name" },
          { key = "Y",                            action = "copy_path" },
          { key = "gy",                           action = "copy_absolute_path" },
          { key = "[c",                           action = "prev_git_item" },
          { key = "]c",                           action = "next_git_item" },
          { key = "-",                            action = "dir_up" },
          { key = "s",                            action = "system_open" },
          { key = "q",                            action = "close" },
          { key = "g?",                           action = "toggle_help" },
          { key = "W",                            action = "collapse_all" },
          { key = "S",                            action = "search_node" },
          { key = "<C-k>",                        action = "toggle_file_info" },
          { key = ".",                            action = "run_file_command" }
        },
      }
    },

    filters = {
      custom = { 
        "\\.git$", -- do not show the git folder (:Gstatus would open it)
      }
    },

    git = {
      -- do not hide .gitignore files
      -- ignore = false,
    },

    diagnostics = {
      enable = true,
      icons = {
        error = ' ', -- xf659
        warning = ' ', -- xf529
        info = ' ', -- xf7fc
        hint = ' ', -- xf835
      }
    },

  }

  vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])

  wk.register({
    ["<leader>n"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
    ["<leader>N"] = { "<cmd>NvimTreeRefresh<cr>", "Force reload NvimTree" },
  })

end

return M
