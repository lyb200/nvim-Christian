local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local icons = require "user.icons"

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local edite_string = ":e ~/.config/nvim/init.lua <CR>"
if vim.fn.has "win32" == 1 then
  edite_string = ":e $HOME/AppData/Local/nvim/init.lua<CR>"
end

dashboard.section.buttons.val = {
  dashboard.button("f", icons.documents.Files .. "   Find file", ":Telescope find_files <CR>"),
  -- dashboard.button("e", icons.ui.NewFile .. "   New file", ":enew <BAR> startinsert <CR>"),
  dashboard.button("e", icons.ui.NewFile .. "   New file", ":enew<CR>"),
  dashboard.button(
    "p",
    icons.git.Repo .. "   Find project",
    ":lua require('telescope').extensions.projects.projects()<CR>"
  ),
  dashboard.button("r", icons.ui.History .. "   Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", icons.ui.List .. "   Find text", ":Telescope live_grep <CR>"),
  -- dashboard.button("s", icons.ui.SignIn .. "   Find Session", ":Telescope sessions save_current=false <CR>"),
  dashboard.button("c", icons.ui.Gear .. "   Config", edite_string),
  dashboard.button("q", icons.diagnostics.Error .. "   Quit", ":qa<CR>"),
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  -- return "chrisatmachine.com"
  local version = vim.version()
  local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
  local datetime = os.date "%Y/%m/%d %H:%M:%S"

  return "\n\nNeovim " .. print_version .. " " .. datetime
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
