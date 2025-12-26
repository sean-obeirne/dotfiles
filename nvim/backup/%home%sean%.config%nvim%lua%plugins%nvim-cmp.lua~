return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<A-Up>'] = cmp.mapping.select_prev_item(),
                ['<A-Down>'] = cmp.mapping.select_next_item(),
                ['<M-Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<A-Left>'] = cmp.mapping.abort(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'path' },
                { name = 'buffer' },
            }),
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline("?", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })
    end
}


-- return {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--         'hrsh7th/cmp-buffer',
--         'hrsh7th/cmp-path',
--         'hrsh7th/cmp-nvim-lsp',
--         'hrsh7th/cmp-cmdline',
--         'L3MON4D3/LuaSnip',
--         'saadparwaiz1/cmp_luasnip',
--         'rafamadriz/friendly-snippets',
--         'hrsh7th/cmp-nvim-lsp-signature-help',
--     },
-- }






--
-- -- nvim-cmp setup
-- local cmp = require'cmp'
--
-- cmp.setup({
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--     { name = 'nvim_lsp_signature_help' },
--     { name = 'path' },
--     { name = 'buffer' },
--   },
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
--   mapping = {
--     ['<A-Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
--     ['<A-Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
--     ['<A-Right>'] = cmp.mapping(cmp.mapping.confirm({select=true}), { 'i', 'c' }),
--     ['<A-Left>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),
--     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--   },
-- })
--
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- cmp.setup.cmdline('?', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' },
--     { name = 'cmdline' }
--   })
-- })
--
-- -- Setup lspconfig with nvim-cmp
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local lspconfig = require('lspconfig')
--
-- -- List of servers to setup
-- local servers = {
--   'clangd',                 -- C/C++
--   'pyright',                -- Python
--   'jdtls',                  -- Java
--   'gopls',                  -- Go
--   'rust_analyzer',          -- Rust
--   'intelephense',           -- PHP
--   'omnisharp',              -- C#
--   'html',                   -- HTML
--   'cssls',                  -- CSS
--   'tailwindcss',            -- Tailwind CSS
--   'angularls',              -- Angular
--   'svelte',                 -- Svelte
--   'bashls',                 -- Bash
--   'powershell_es',          -- PowerShell
--   'elmls',                  -- Elm
--   'purescriptls',           -- PureScript
--   'zls',                    -- Zig
--   'kotlin_language_server', -- Kotlin
--   'julials',                -- Julia
--   'yamlls',                 -- YAML
--   'jsonls',                 -- JSON
--   'lemminx',                -- XML
--   'lua_ls',                 -- Lua
--   'perlnavigator',          -- Perl
--   'cobol_ls',               -- COBOL
--   'terraformls',            -- Terraform
--   'ansiblels',              -- Ansible
--   'dockerls',               -- Docker
--   'sqlls',                  -- SQL
--   'vhdl_ls',                -- VHDL
--   'svlangserver'            -- Verilog/SystemVerilog
-- }
--
--
-- -- Setup each server with capabilities from nvim-cmp
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     capabilities = capabilities,
--   }
-- end

