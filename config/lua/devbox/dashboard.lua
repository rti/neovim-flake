local M = {}

-- local home = os.getenv('HOME')
local db = require('dashboard')

function M.setup()
  db.custom_center = {
    {desc = "New File", icon = " ", action = "DashboardNewFile", shortcut = ""},
    {desc = "Recent Files", icon = " ", action = "Telescope oldfiles", shortcut = ""},
    {desc = "Find Files", icon = " ", action = "Telescope find_files", shortcut = ""},
    {desc = "Exit", icon = " ", action = "exit", shortcut = ""}
  }

  db.custom_header = {
    '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  }

  db.custom_footer = {'Neovim is open source and freely distributable'}
end

return M
