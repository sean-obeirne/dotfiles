-- local tn_bg = '#24283b'
-- local tn_bg_dark = '#1f2335'
-- local tn_bg_highlight = '#292e42'
-- local tn_blue = '#7aa2f7'
-- local tn_blue0 = '#3d59a1'
-- local tn_blue1 = '#2ac3de'
-- local tn_blue2 = '#0db9d7'
-- local tn_blue5 = '#89ddff'
-- local tn_blue6 = '#b4f9f8'
-- local tn_blue7 = '#394b70'
-- local tn_comment = '#565f89'
-- local tn_cyan = '#7dcfff'
-- local tn_dark3 = '#545c7e'
-- local tn_dark5 = '#737aa2'
-- local tn_fg = '#c0caf5'
-- local tn_fg_dark = '#a9b1d6'
-- local tn_fg_gutter = '#3b4261'
-- local tn_green = '#9ece6a'
-- local tn_green1 = '#73daca'
-- local tn_green2 = '#41a6b5'
-- local tn_magenta = '#bb9af7'
-- local tn_magenta2 = '#ff007c'
-- local tn_orange = '#ff9e64'
-- local tn_purple = '#9d7cd8'
-- local tn_red = '#f7768e'
-- local tn_red1 = '#db4b4b'
-- local tn_teal = '#1abc9c'
-- local tn_terminal_black = '#414868'
-- local tn_yellow = '#e0af68'
-- local tn_git_add = '#449dab'
-- local tn_git_change = '#6183bb'
-- local tn_git_delete = '#914c54'

local tn_bg = '#202020'
local tn_bg_dark = '#181818'
local tn_bg_highlight = '#2b2b2b'
local tn_blue = '#7098d4'
local tn_blue0 = '#526fa0'
local tn_blue1 = '#64c1c8'
local tn_blue2 = '#5fb4c7'
local tn_blue5 = '#8fd7ff'
local tn_blue6 = '#c0f4ee'
local tn_blue7 = '#404b65'
local tn_comment = '#6c707c'
local tn_cyan = '#80d3e0'
local tn_dark3 = '#5d6177'
local tn_dark5 = '#787b9a'
local tn_fg = '#dcdde0'
local tn_fg_dark = '#b9bfd0'
local tn_fg_gutter = '#404659'
local tn_green = '#a4c980'
local tn_green1 = '#82cbb5'
local tn_green2 = '#5fb0aa'
local tn_magenta = '#c6a0e0'
local tn_magenta2 = '#f471a6'
local tn_orange = '#f4a261'
local tn_purple = '#b89cc9'
local tn_red = '#f28b82'
local tn_red1 = '#e05858'
local tn_teal = '#4bb5a8'
local tn_terminal_black = '#464c60'
local tn_yellow = '#f2c37f'
local tn_git_add = '#61b8a7'
local tn_git_change = '#748ec4'
local tn_git_delete = '#a94b50'


return {
    "nvimdev/dashboard-nvim",
    config = function()

        local db = require('dashboard')
        vim.cmd('highlight DashboardHeader guifg=' .. tn_purple .. ' guibg=NONE')
        vim.cmd('highlight DashboardFooter guifg=' .. tn_green .. ' guibg=NONE')
        vim.cmd('highlight DashboardDesc guifg=' .. tn_blue6 .. ' guibg=NONE')
        vim.cmd('highlight DashboardKey guifg=' .. tn_comment .. ' guibg=NONE')
        vim.cmd('highlight DashboardIcon guifg=' .. tn_orange .. ' guibg=NONE')
        vim.cmd('highlight DashboardShortCut guifg=' .. tn_red1 .. ' guibg=NONE')

        local datetime = os.date("%A, %B %d %Y")

        local theme = 'doom'

        if theme == 'doom' then
            db.setup {
                theme = 'doom', --  theme is doom and hyper default is hyper
                disable_move = true,    --  default is false disable move keymap for hyper
                shortcut_type = 'number',   --  shorcut type 'letter' or 'number'
                shuffle_letter = false,  --  default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
                -- change_to_vcs_root -- default is false,for open file in hyper mru. it will change to the root of vcs
                -- config = {},    --  config used for theme
                config = {

                    header = {
                    [[                                                                                                                                             ]],
                    [[                                                                                                                                             ]],
                    [[                                                                                                                                             ]],
                    [[ ▄     ▄               █             ▀▀█                               ▄     ▄                   █                ▀▀█                      █ ]],
                    [[ █  █  █  ▄▄▄    ▄ ▄▄  █   ▄  ▄▄▄▄     █     ▄▄▄    ▄▄▄    ▄▄▄         █  █  █  ▄▄▄   ▄ ▄▄    ▄▄▄█   ▄▄▄    ▄ ▄▄    █     ▄▄▄   ▄ ▄▄    ▄▄▄█ ]],
                    [[ ▀ █▀█ █ █▀ ▀█   █▀  ▀ █ ▄▀   █▀ ▀█    █    ▀   █  █▀  ▀  █▀  █        ▀ █▀█ █ █▀ ▀█  █▀  █  █▀ ▀█  █▀  █   █▀  ▀   █    ▀   █  █▀  █  █▀ ▀█ ]],
                    [[  ██ ██▀ █   █   █     █▀█    █   █    █    ▄▀▀▀█  █      █▀▀▀▀         ██ ██▀ █   █  █   █  █   █  █▀▀▀▀   █       █    ▄▀▀▀█  █   █  █   █ ]],
                    [[  █   █  ▀█▄█▀   █     █  ▀▄  ██▄█▀    ▀▄▄  ▀▄▄▀█  ▀█▄▄▀  ▀█▄▄▀         █   █  ▀█▄█▀  █   █  ▀█▄██  ▀█▄▄▀   █       ▀▄▄  ▀▄▄▀█  █   █  ▀█▄██ ]],
                    [[                              █                                                                                                              ]],
                    [[                              ▀                                                                                                              ]],
                    [[                                                                                                                                             ]],
                    [[                                                                   ]] .. datetime .. [[                                                                    ]],
                    [[                                                                                                                                             ]],
                    [[                                                                                                                                             ]],
                    },


                center = {
                    {
                        icon = '󱓷  ',
                        desc = 'Projects                       ',
                        key = 'p',
                        action = 'Telescope projects'
                    },
                    {
                        icon = '  ',
                        desc = 'Zettelkasten                   ',
                        key = 'k',
                        action = 'edit ' .. vim.fn.expand('~/zettelkasten/hub.md')
                    },
                    {
                        icon ='󱛉  ',
                        desc = 'Cheat Sheets                   ',
                        key = 's',
                        action = 'Telescope file_browser path=/home/sean/.findables/'
                    },
                    {
                        icon = '  ',
                        desc = 'Find File                      ',
                        key = 'f',
                        action = 'Telescope find_files',
                    },
                    {
                        icon = '  ',
                        desc = 'File Browser                   ',
                        key = 'b',
                        action = 'Telescope file_browser',
                    },
                    {
                        icon = '󰈞  ',
                        desc = 'Grep Word                      ',
                        key = 'g',
                        action = 'Telescope live_grep',
                    },
                    {
                        icon = '  ',
                        desc = 'New File                       ',
                        key = 'n',
                        action = 'enew',
                    },
                    -- {
                    --   icon = '  ',
                    --   desc = 'Recently Used Files            ',
                    --   key = 'r',
                    --   action = 'Telescope oldfiles',
                    -- },
                    {
                        icon = '  ',
                        desc = 'NeoVim Configuration           ',
                        key = 'l',
                        action = 'cd ' .. vim.fn.expand('~/.config/nvim/lua') .. ' | Telescope file_browser',
                    },
                    {
                        icon = '  ',
                        desc = 'Configuration                  ',
                        key = 'c',
                        action = 'edit ' .. vim.fn.expand('~/.config/nvim/lua/plugins/dashboard.lua'),
                    },
                    {
                        icon = '  ',
                        desc = 'Quit                           ',
                        key = 'q',
                        action = ':q',
                    },
                },
                    footer = { '', '', '"Give me six hours to chop down a tree and I will spend the first four sharpening the axe." – Abraham Lincoln' }
                },
                -- hide = {
                --   statusline = false,   -- hide statusline default is true
                --   tabline = true,       -- hide the tabline
                --   winbar = true,        -- hide winbar
                -- },
                -- preview = {
                --   command,        -- preview command
                --   file_path,      -- preview file path
                --   file_heightm,   -- preview file height
                --   file_width,     -- preview file width
                -- },
            }
        elseif theme == 'hyper' then
            db.setup {
                theme = 'hyper', --  theme is doom and hyper default is hyper
                disable_move = true,    --  default is false disable move keymap for hyper
                shortcut_type = 'number',   --  shorcut type 'letter' or 'number'
                shuffle_letter = false,  --  default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
                -- change_to_vcs_root = true, -- default is false,for open file in hyper mru. it will change to the root of vcs
                config = {
                    header = {
                        [[                                                                                                                                                       ]],
                        [[       ____   U _____ u    _      _   _   _   ____         _   _      _       ____     ____   __   __      ____      _         _        ____ U _____ u ]],
                        [[      / __"| u\| ___"|/U  /"\  u | \ |"| |"| / __"| u     |'| |'| U  /"\  u U|  _"\ uU|  _"\ u\ \ / /    U|  _"\ u  |"|    U  /"\  u U /"___|\| ___"|/ ]],
                        [[     <\___ \/  |  _|"   \/ _ \/ <|  \| |>|_|<\___ \/     /| |_| |\ \/ _ \/  \| |_) |/\| |_) |/ \ V /     \| |_) |/U | | u   \/ _ \/  \| | u   |  _|"   ]],
                        [[      u___) |  | |___   / ___ \ U| |\  |u    u___) |     U|  _  |u / ___ \   |  __/   |  __/  U_|"|_u     |  __/   \| |/__  / ___ \   | |/__  | |___   ]],
                        [[      |____/>> |_____| /_/   \_\ |_| \_|     |____/>>     |_| |_| /_/   \_\  |_|      |_|       |_|       |_|       |_____|/_/   \_\   \____| |_____|  ]],
                        [[       )(  (__)<<   >>  \\    >> ||   \\,-.   )(  (__)    //   \\  \\    >>  ||>>_    ||>>_ .-,//|(_      ||>>_     //  \\  \\    >>  _// \\  <<   >>  ]],
                        [[      (__)    (__) (__)(__)  (__)(_")  (_/   (__)        (_") ("_)(__)  (__)(__)__)  (__)__) \_) (__)    (__)__)   (_")("_)(__)  (__)(__)(__)(__) (__) ]],
                        [[                                                                                                                                                       ]],
                        [[                                                               ]] .. datetime .. [[                                                                    ]],
                        [[                                                                                                                                                       ]],
                    },
                    shortcut = {
                        -- action can be a function type
                        { desc = 'Find File', group = 'DashboardShortCut', key = 'f', action = 'Telescope find_files' },
                        { desc = 'Recent Files', group = 'DashboardShortCut', key = 'r', action = 'Telescope oldfiles' },
                        { desc = 'Config', group = 'DashboardShortCut', key = 'c', action = 'edit' .. vim.fn.expand('~/.config/nvim/lua/plugins/dashboard.lua') },
                        { desc = 'Quit', group = 'DashboardShortCut', key = 'q', action = 'q' },
                    },
                    packages = { enable = false }, -- show how many plugins neovim loaded
                    -- limit how many projects list, action when you press key or enter it will run this action.
                    -- action can be a functino type, e.g.
                    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
                    -- project = { enable = true, limit = 8, icon = '  ――――――――――――――――――― projects ―――――――――――――――――――――――', label = '', action = 'Telescope find_files cwd=' },
                    project = {
                        enable = false,
                        limit = 8,
                        icon = '  ――――――――――――――――――― projects ―――――――――――――――――――――――',
                        label = '',
                        -- action = 'Telescope find_files cwd=',
                        action = function(path) vim.cmd('Telescope find_files cwd=' .. path) end,
                    },
                    mru = { limit = 3, icon = '  ――――――――――――――――――― recents ――――――――――――――――――――――――', label = '', cwd_only = false },
                    footer = { '"Give me six hours to chop down a tree and I will spend the first four sharpening the axe." – Abraham Lincoln' }
                },
                -- hide = {
                --   statusline = false,   -- hide statusline default is true
                --   tabline = true,       -- hide the tabline
                --   winbar = true,        -- hide winbar
                -- },
                -- preview = {
                --   command       -- preview command
                --   file_path     -- preview file path
                --   file_height   -- preview file height
                --   file_width    -- preview file width
                -- },
            }
        end
    end,
}

