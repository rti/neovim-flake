local M = {}

local lspconfig = require("lspconfig")
local root_pattern = require("lspconfig/util").root_pattern
local null_ls = require("null-ls")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local jdtls = require("jdtls")
local lightbulb = require("nvim-lightbulb")
local wk = require("which-key")
local border = require("devbox/border").border

-- override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  opts.focusable = false
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local function on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspDecl lua vim.lsp.buf.declaration()")
  vim.cmd("command! LspImpl lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspSig lua vim.lsp.buf.signature_help()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev({float=nil})")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next({float=nil})")
  vim.cmd("command! LspFormat lua vim.lsp.buf.format({async=true})")
  vim.cmd("command! LspFormatRange lua vim.lsp.buf.range_formatting()")

  wk.register({
    ["gd"] = { "<cmd>LspDef<cr>", "LSP jump to definition" },
    ["gD"] = { "<cmd>LspDecl<cr>", "LSP jump to declaration" },
    ["gI"] = { "<cmd>LspImpl<cr>", "LSP jump to implementation" },
    ["gt"] = { "<cmd>LspTypeDef<cr>", "LSP jump to type definition" },
    ["<C-h>"] = { "<cmd>LspHover<cr>", "LSP hover information" },
    ["gr"] = { "<cmd>LspRefs<cr>", "LSP jump to references" },
    ["<C-s>"] = { "<cmd>LspSig<cr>", "LSP signature information" },
    ["<leader>rn"] = { "<cmd>LspRename<cr>", "LSP rename" },
    ["<leader>ca"] = { "<cmd>CodeActionMenu<cr>", "LSP code action menu" },
    -- ["<leader>ca"] = { "<cmd>LspCodeAction<cr>", "LSP code action menu" },
    ["[d"] = { "<cmd>LspDiagPrev<cr>", "Previous diagnostics message" },
    ["]d"] = { "<cmd>LspDiagNext<cr>", "Next diagnostics message" },
    ["<leader>fl"] = { "<cmd>LspFormat<cr>", "LSP format buffer" },
    ["<leader>fr"] = { "<cmd>LspFormatRange<cr>", "LSP format range" },
  }, { noremap = true, silent = true, buffer = bufnr })

  wk.register({
    ["<C-s>"] = { "<cmd>LspSig<cr>", "LSP signature information" },
  }, { noremap = true, silent = true, buffer = bufnr, mode = "i" })

  -- diagnostics list handled by telescope
  -- vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  -- vim.cmd("command! LspDiagLocList lua vim.diagnostic.setloclist()")

  -- TODO: workspace folders
  -- mapbuf('n', '<leader>Wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  -- mapbuf('n', '<leader>Wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  -- mapbuf('n', '<leader>Wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

  vim.api.nvim_create_autocmd({ "CursorHold" }, {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = border,
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", {})
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = 0,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = 0,
      callback = vim.lsp.buf.clear_references,
    })
  end

  vim.diagnostic.config({
    virtual_text = {
      -- source = "always",  -- Or "if_many"
      prefix = "■", -- Could be '●', '▎', 'x'
      spacing = 4,
      severity = vim.diagnostic.severity.ERROR,
    },
    float = {
      -- source = "always",  -- Or "if_many"
    },
    underline = true,
    signs = true,
    update_in_insert = true,
    severity_sort = true,
  })
end

local function make_config()
  local capabilities = cmp_nvim_lsp.default_capabilities()

  return {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

local function setup_lspconfig_servers()
  local servers = {
    "bashls",
    "dockerls",
    "tsserver",
    "jsonls",
    "html",
    "cssls",
    "tailwindcss",
    "vuels",
    "graphql",
    "rnix",
    "sumneko_lua",
    "vimls",
    "yamlls",
  }

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "sumneko_lua" then
      config.cmd = { "lua-language-server" }
      config.settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    -- elseif server == "vuels" then
    --   config.filetypes = { "vue", "typescript", "javascript" }
    elseif server == "tsserver" then
      config.cmd = { "typescript-language-server", "--stdio" }
    elseif server == "cssls" then
      config.cmd = { "css-languageserver", "--stdio" }
    elseif server == "html" then
      config.cmd = { "html-languageserver", "--stdio" }
    elseif server == "jsonls" then
      config.cmd = { "vscode-json-languageserver", "--stdio" }
      config.commands = {
        -- use range format for full document formating as well
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
          end,
        },
      }
    elseif server == "graphql" then
      config.cmd = { "graphql-lsp", "server", "-m", "stream" }
      config.filetypes = { "graphql", "typescript", "javascript" }
      config.root_dir = root_pattern(".git", ".graphqlrc*", ".graphql.config.*")
    end

    lspconfig[server].setup(config)
  end
end

local function setup_null_ls()
  null_ls.setup({
    on_attach = on_attach,
    sources = {
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.eslint_d,

      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.completion.spell,
    },
  })
end

function M.init_java_lsp()
  -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
  local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

  local config = make_config()

  config.on_attach = on_attach

  -- The command that starts the language server
  config.cmd = {
    "jdt-language-server",
    -- TODO put this into $HOME/.cache/jdtls ?
    "-data",
    "/tmp/jdtls/workspaces/" .. workspace_dir,
  }

  config.init_options = {
    bundles = { os.getenv("JAVA_DEBUG_JAR"), },
  }

  jdtls.start_or_attach(config)
end

local function setup_jdtls()
  vim.cmd([[
    augroup ft_java_jdtls_lsp
        autocmd! * <buffer>
        autocmd filetype java lua require('devbox/lsp').init_java_lsp()
    augroup END
  ]])
end

local function setup_lspsigns()
  for type, icon in pairs({
    Error = " ", -- xf659
    Warn = " ", -- xf529
    Info = " ", -- xf7fc
    Hint = " ", -- xf835
  }) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

function M.update_lightbulb()
  lightbulb.update_lightbulb({
    ignore = {},
    sign = {
      enabled = true,
      priority = 10,
    },
    float = {
      enabled = false,
      text = "",
      win_opts = {},
    },
    virtual_text = {
      enabled = false,
    },
    status_text = {
      enabled = false,
    },
  })
end

local function setup_lightbulb()
  vim.cmd([[
    autocmd CursorHold,CursorHoldI * lua require('devbox/lsp').update_lightbulb()
  ]])
  vim.fn.sign_define("LightBulbSign", { text = "", texthl = "", linehl = "", numhl = "" })
end

function M.setup()
  setup_lspconfig_servers()
  setup_null_ls()
  setup_jdtls()
  setup_lspsigns()
  setup_lightbulb()
end

return M
