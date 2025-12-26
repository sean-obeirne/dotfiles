return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "lua", "python", "bash", "go", "vimdoc", "java", "rust" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                -- use_languagetree = true,
            },
--           fold = {
--             enable = true
--           },
            indent = {
                enable = true,
                -- disable = { "python" },
            }
        })
    end,
}










    -- local opts = {noremap = true, silent = true} -- non-mapped only
    -- -- Simplest on_attach function
    -- local on_attach = function(client, bufnr)
    --   -- Key mappings for LSP functions
    --   local buf_set_keymap = vim.api.nvim_buf_set_keymap
    --   buf_set_keymap(bufnr, 'n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --   buf_set_keymap(bufnr, 'n', '<leader>K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --   buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --   buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --   buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- end
    --
    --
    -- -- Configure pyright
    -- require('lspconfig').pyright.setup{
    --   on_attach = on_attach,
    --   filetypes = { "python" },  -- Explicitly set filetypes
    -- }
    --
    -- -- Configure gopls
    -- require'lspconfig'.gopls.setup{
    --   on_attach = on_attach,
    --   filetypes = { "go" },  -- Explicitly set filetypes
    -- }
    --
    -- -- Use treesitter for folding
    -- vim.opt.foldmethod = 'expr'
    -- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    -- vim.opt.foldlevel = 99  -- Open all folds by default
    --
    -- vim.keymap.set('n', 'za', 'zA', { noremap = true, silent = true })
-- }
