local M = {}

function M.setup()
  vim.g.dashboard_session_directory = '~/.config/nvim/sessions'
  vim.g.dashboard_default_executive ='telescope'
  vim.g.dashboard_custom_header = {
    "                      _",
    "                     /#\\",
    "                    /###\\     /\\",
    "                   /  ###\\   /##\\  /\\",
    "                  /      #\\ /####\\/##\\",
    "                 /  /      /   # /  ##\\             _       /\\",
    "               // //  /\\  /    _/  /  #\\ _         /#\\    _/##\\    /\\",
    "              // /   /  \\     /   /    #\\ \\      _/###\\_ /   ##\\__/ _\\",
    "             /  \\   / .. \\   / /   _   { \\ \\   _/       / //    /    \\\\",
    "     /\\     /    /\\  ...  \\_/   / / \\   } \\ | /  /\\  \\ /  _    /  /    \\ /\\",
    "  _ /  \\  /// / .\\  ..%:.  /... /\\ . \\ {:  \\\\   /. \\     / \\  /   ___   /  \\",
    " /.\\ .\\.\\// \\/... \\.::::..... _/..\\ ..\\:|:. .  / .. \\\\  /.. \\    /...\\ /  \\ \\",
    "/...\\.../..:.\\. ..:::::::..:..... . ...\\{:... / %... \\\\/..%. \\  /./:..\\__   \\",
    " .:..\\:..:::....:::;;;;;;::::::::.:::::.\\}.....::%.:. \\ .:::. \\/.%:::.:..\\",
    "::::...:::;;:::::;;;;;;;;;;;;;;:::::;;::{:::::::;;;:..  .:;:... ::;;::::..",
    ";;;;:::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;];;;;;;;;;;::::::;;;;:.::;;;;;;;;:..",
    "9263                                 https://www.asciiart.eu/nature/mountains",
  }

  vim.g.dashboard_custom_section = {
      -- a = {description = {"  Recent Files              leader f r"}, command = "Telescope oldfiles"},
      -- b = {description = {"  Find Files                leader f f"}, command = "Telescope find_files"},
      -- c = {description = {"  Find Words                leader f g"}, command = "Telescope live_grep"},
      -- e = {description = {"  Bookmarks                 leader f m"}, command = "Telescope marks"},
      -- d = {description = {"  New File                  leader e n"}, command = "DashboardNewFile"},
      -- -- f = {description = {"  Load Last Session         leader l  "}, command = "SessionLoad"},
      -- g = {description = {"  Update Plugins            leader u  "}, command = "PlugUpdate"},
      -- h = {description = {"  Settings                  leader c e"}, command = "edit $MYVIMRC"},
      -- -- i = {description = {"  Exit                      leader q  "}, command = "exit"}
      a = {description = {"  New File"}, command = "DashboardNewFile"},
      b = {description = {"  Find Files"}, command = "Telescope find_files"},
      c = {description = {"  Exit"}, command = "exit"}
  }

  vim.cmd [[
    augroup dashboard_au
      autocmd! * <buffer>
      autocmd User dashboardReady let &l:stl = 'Dashboard'
      " is this set?
      " autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
      "autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
    augroup END
  ]]


  -- g.dashboard_custom_footer = {'type  :help<Enter>  or  <F1>  for on-line help'}
  vim.g.dashboard_custom_footer = {'Neovim is open source and freely distributable'}
end

return M
