-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    'goolord/alpha-nvim',
    config = function()
              local alpha = require("alpha")
              local dashboard = require("alpha.themes.dashboard")

              math.randomseed(os.time())

              local function pick_color()
                  local colors = {"String", "Identifier", "Keyword", "Number"}
                  return colors[math.random(#colors)]
              end

              local function footer()
                  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
                  local version = vim.version()
                  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

                  return datetime .. "   " .. " plugins" .. nvim_version_info
              end

              local logo = {
                  "",
"__        __   _                                                 ",
"\\ \\      / /__| | ___ ___  _ __ ___   ___                        ",
" \\ \\ /\\ / / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\                       ",
"  \\ V  V /  __/ | (_| (_) | | | | | |  __/                       ",
" _ \\_/\\_/ \\___|_|\\___\\___/|_| |_| |_|\\___|  __           _       ",
"| \\ | | __ _ _ __  _ __ (_)_ __   __ _  | |/ /___   __ _| | __ _ ",
"|  \\| |/ _` | '_ \\| '_ \\| | '_ \\ / _` | | ' // _ \\ / _` | |/ _` |",
"| |\\  | (_| | |_) | |_) | | | | | (_| | | . \\ (_) | (_| | | (_| |",
"|_| \\_|\\__,_| .__/| .__/|_|_| |_|\\__, | |_|\\_\\___/ \\__,_|_|\\__,_|",
"            |_|   |_|            |___/                           ",
              }

              dashboard.section.header.val = logo
              dashboard.section.header.opts.hl = pick_color()

              dashboard.section.buttons.val = {
              --     dashboard.button("<Leader>ff", "  File Explorer"),
              --     dashboard.button("<Leader>fo", "  Find File"),
              --     dashboard.button("<Leader>fw", "  Find Word"),
              --     dashboard.button("<Leader>ps", "  Update plugins"),
              --     dashboard.button("q", "  Quit", ":qa<cr>")
              }

              dashboard.section.footer.val = footer()
              dashboard.section.footer.opts.hl = "Constant"

              alpha.setup(dashboard.opts)

              vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
          end
  }
