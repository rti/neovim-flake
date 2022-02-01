local M = {}

local wk = require("which-key")

function M.setup()
  -- set to light to prevent flicker on light terminals
  vim.opt.background = 'light'
  vim.opt.termguicolors = true
  vim.cmd('colorscheme zenbones')

  -- dim inactive
  vim.cmd[[hi! link NormalNC CursorLine]]

  vim.cmd[[hi! link NormalFloat Normal]]
  vim.cmd[[hi! link FloatBorder NormalFloat]]
  -- apparently only used in floats, the "real" is done by treesitter!?
  vim.cmd[[hi! link typescriptParens NormalFloat]]

  vim.cmd[[hi! link Folded TSComment]]

  vim.cmd[[hi! link NvimTreeExecFile NvimTreeSpecialFile]]
  -- vim.cmd[[hi! NvimTreeExecFile gui=bold]]

  vim.cmd[[hi! link NvimTreeNormalNC NormalNC]]
  vim.cmd[[hi! link NvimTreeNormal Normal]]
  vim.cmd[[hi! link NvimTreeSignColumn Normal]]
  vim.cmd[[hi! link NvimTreeCursorLine CursorLine]]

  vim.cmd[[hi! link TelescopeNormal NormalFloat]]
  vim.cmd[[hi! link TelescopePrompt NormalFloat]]
  vim.cmd[[hi! link TelescopePromptPrefix NormalFloat]]
  vim.cmd[[hi! link TelescopeBorder FloatBorder]]
  vim.cmd[[hi! link TelescopeSelection CursorLine]]


  vim.cmd[[hi! link DapUIType Normal]]
  vim.cmd[[hi! link DapUIScope Normal]]
  vim.cmd[[hi! link DapUIValue Normal]]
  vim.cmd[[hi! link DapUISource Normal]]
  vim.cmd[[hi! link DapUIThread Normal]]
  vim.cmd[[hi! link DapUIVariable TSKeyword]]
  vim.cmd[[hi! link DapUIFrameName TSKeyword]]
  vim.cmd[[hi! link DapUIDecoration Normal]]
  vim.cmd[[hi! link DapUILineNumber Normal]]
  vim.cmd[[hi! link DapUIFloatBorder Normal]]
  vim.cmd[[hi! link DapUIWatchesEmpty Normal]]
  vim.cmd[[hi! link DapUIWatchesError Normal]]
  vim.cmd[[hi! link DapUIWatchesValue Normal]]
  vim.cmd[[hi! link DapUIModifiedValue Normal]]
  vim.cmd[[hi! link DapUIStoppedThread Normal]]
  vim.cmd[[hi! link DapUIBreakpointsInfo TSKeyword]]
  vim.cmd[[hi! link DapUIBreakpointsLine Normal]]
  vim.cmd[[hi! link DapUIBreakpointsPath Normal]]
  vim.cmd[[hi! link DapUIBreakpointsCurrentLine Normal]]

  vim.cmd[[hi! link debugPC CursorLine]]

  wk.register({
    ["<leader>c"] = { name = "+config" },
    ["<leader>cd"] = { "<cmd>set background=dark<cr>", "Background dark" },
    ["<leader>cl"] = { "<cmd>set background=light<cr>", "Background light" },
  })

  -- colorizer color code strings e.g. #ab2edd
  require'colorizer'.setup()
end

return M
