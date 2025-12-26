return {
    "folke/noice.nvim", event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("noice").setup({
            cmdline = {
                view = "cmdline_popup",
            },
            messages = {
                enabled = false,
            },
            notify = {
                enabled = false,
            },
        })
    end,
}
