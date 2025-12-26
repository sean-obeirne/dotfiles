return {

    { "folke/which-key.nvim", event = "VeryLazy" },

    { "neovim/nvim-lspconfig", event = "BufReadPre" },

    { "williamboman/mason.nvim", cmd = "Mason", config = function()
        require("mason").setup()
    end },

    { "williamboman/mason-lspconfig.nvim", event = "BufReadPre" },

    { "nvim-treesitter/nvim-treesitter", event = { "BufRead", "BufNewFile" }, config = function()
    end },

    { "hrsh7th/nvim-cmp" },

    { "folke/noice.nvim" },

    { "github/copilot.vim", event = "InsertEnter" },

    { "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup()
        end,
    },

    { "karb94/neoscroll.nvim",
        opts = {}
    },

    -- { "xiyaowong/nvim-transparent", event = "VimEnter" },

    { "sean-obeirne/snr", cmd = "SnR", config = function()
        require("snr").init()
    end },

    { "lukas-reineke/indent-blankline.nvim", event = "BufReadPre",
        config = function()
            require("ibl").setup()
        end },

    -- { "CopilotC-Nvim/CopilotChat.nvim" },

    { "nvim-telescope/telescope.nvim", cmd = "Telescope" },
    { "nvim-telescope/telescope-file-browser.nvim", after = "telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", after = "telescope.nvim" },
    { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim", config = function()
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            }
        }
        require("telescope").load_extension("ui-select")
    end },

    { "danymat/neogen", cmd = "Neogen", config = true },

    { "ahmedkhalf/project.nvim", event = "VimEnter" },

    { "toppair/peek.nvim", ft = "markdown", config = function()
        require("plugins.vscode-peek").setup()
    end },

    { "lewis6991/gitsigns.nvim", config = function()
        require("gitsigns").setup()
    end },

    { "renerocksai/telekasten.nvim", cmd = "Telekasten", config = function()
        require('telekasten').setup({ home = vim.fn.expand("~/zettelkasten") })
    end },

    { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown", dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, opts = {} },
}










-- return {
--
--     {   "folke/which-key.nvim"                          },
--
--     {   "neovim/nvim-lspconfig"                         },
--
--     {   "williamboman/mason.nvim",
--         config = function()
--             require("mason").setup()
--         end,                                            },
--
--     {   "williamboman/mason-lspconfig.nvim"             },
--
--     {   "nvim-treesitter/nvim-treesitter",
--         event = "VimEnter",
--         config = function()
--             require("plugins.nvim-treesitter").setup()
--             -- vim.cmd("TSBufEnable highlight")
--         end,                                            },
--
--     {   "hrsh7th/nvim-cmp"                              },
--
--     {   "github/copilot.vim"                            },
--
--     {   "CopilotC-Nvim/CopilotChat.nvim"                },
--
--     {   "xiyaowong/nvim-transparent"                    },
--
--     {   "sean-obeirne/snr",
--         cmd = "SnR",
--         config = function()
--             require("snr").init()
--         end,                                            },
--
--     {   "lukas-reineke/indent-blankline.nvim"           },
--
--     {   "nvim-telescope/telescope.nvim"                 },
--     {   "nvim-telescope/telescope-file-browser.nvim"    },
--     {   "nvim-telescope/telescope-fzf-native.nvim"      },
--     {   "nvim-telescope/telescope-symbols.nvim"         },
--
--     {   "danymat/neogen",
--         config = true                                   },
--
--     {   "ahmedkhalf/project.nvim"                       },
--
--     {
--         "nvimdev/dashboard-nvim",
--         event = "VimEnter",
--         config = function()
--             require("plugins.dashboard").setup()
--         end,
--         dependencies = { "nvim-tree/nvim-web-devicons" },
--     },
--
--     {
--         "toppair/peek.nvim",
--         config = function()
--             require("plugins.peek").setup()
--         end,                                            },
--
--
--     {   "lewis6991/gitsigns.nvim"                       },
--
--     {   "nvim-lualine/lualine.nvim",
--         config = function()
--             require('lualine').setup( {
--                 options = {
--                     theme = {
--                         normal = { a = { fg = '#ffffff', bg = '#000000' }, b = {fg = '#ffffff', bg = '#000000'}, c = {fg = '#ffffff', bg = '#000000'} },
--                         insert = { a = { fg = '#000000', bg = '#ffffff' }, b = {fg = '#ffffff', bg = '#000000'}, c = {fg = '#ffffff', bg = '#000000'} },
--                         visual = { a = { fg = '#000000', bg = '#afafff' }, b = {fg = '#ffffff', bg = '#000000'}, c = {fg = '#ffffff', bg = '#000000'} },
--                         replace = { a = { fg = '#000000', bg = '#ffafaf' }, b = {fg = '#ffffff', bg = '#000000'}, c = {fg = '#ffffff', bg = '#000000'} },
--                         inactive = { a = { fg = '#ffffff', bg = '#000000' }, b = {fg = '#ffffff', bg = '#000000'}, c = {fg = '#ffffff', bg = '#000000'} },
--                     }
--                 }
--             } )
--         end                                             },
--
--     {   "renerocksai/telekasten.nvim",
--         config = function()
--             require('telekasten').setup({
--                 home = vim.fn.expand("~/zettelkasten"),
--             })
--         end                                             },
--
--     {   "mikavilpas/yazi.nvim"                          },
--
--     {
--     'MeanderingProgrammer/render-markdown.nvim',
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
--     ---@module 'render-markdown'
--     ---@type render.md.UserConfig
--     opts = {},                                          }
-- }
