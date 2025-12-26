-- Setup Mason and Mason LSPConfig
require('mason').setup() -- Initialize Mason
require('mason-lspconfig').setup {
  ensure_installed = {
    'clangd',                 -- C/C++
    'pyright',                -- Python
    'jdtls',                  -- Java
    'gopls',                  -- Go
    'rust_analyzer',          -- Rust
    'intelephense',           -- PHP
    'omnisharp',              -- C#
    'html',                   -- HTML
    'cssls',                  -- CSS
    'tailwindcss',            -- Tailwind CSS
    'ts_ls',                  -- JavaScript/TypeScript
    'svelte',                 -- Svelte
    'bashls',                 -- Bash
    'powershell_es',          -- PowerShell
    'elmls',                  -- Elm
    'purescriptls',           -- PureScript
    'zls',                    -- Zig
    'kotlin_language_server', -- Kotlin
    'yamlls',                 -- YAML
    'jsonls',                 -- JSON
    'lemminx',                -- XML
    'lua_ls',                 -- Lua
    'perlnavigator',          -- Perl
    'cobol_ls',               -- COBOL
    'terraformls',            -- Terraform
    'ansiblels',              -- Ansible
    'dockerls',               -- Docker
    'sqls',                  -- SQL
    'vhdl_ls',                -- VHDL
    'svlangserver'            -- Verilog/SystemVerilog
  }
}

-- Simplest on_attach function
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
  local opts = {noremap = true, silent = true} -- non-mapped only

  -- Key mappings for LSP functions
  local buf_set_keymap = vim.api.nvim_buf_set_keymap
  buf_set_keymap(bufnr, 'n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,  -- Adjust spacing between the virtual text and the line content
        prefix = '⚠',  -- Change the prefix symbol to something you prefer
        format = function(diagnostic)
            -- Adjust the message to fit within the window width
            local message = diagnostic.message
            local max_width = vim.fn.winwidth(0) - 10  -- Subtract a buffer to avoid touching the window edge
            if #message > max_width then
                message = message:sub(1, max_width) .. '...'
            end
            return message
        end,
    },
})

function ShowDiagnosticUnderCursor()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = '',
    }
    vim.diagnostic.open_float(nil, opts)
end

-- Setup LSP servers automatically through Mason LSPConfig
-- local lspconfig = require('lspconfig') 
-- require('mason-lspconfig').setup_handlers {
--   function (server_name)
--     lspconfig[server_name].setup {
--       on_attach = on_attach,
--       -- capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--     }
--   end,
-- }

vim.env.PYTHONPATH = "/home/sean/code/pylibs:" .. "./" .. (vim.env.PYTHONPATH or "")


vim.g.floaterm_width = 0.999
vim.g.floaterm_height = 0.999
vim.g.floaterm_borderchars = '─│─│╭╮╯╰' -- Optional: customize border appearance



vim.api.nvim_set_hl(0, 'ConflictMarkerBegin', { bg = '#914c54', fg = 'white'})
vim.api.nvim_set_hl(0, 'ConflictMarkerSplit', { bg = '#414868', fg = 'white'})
vim.api.nvim_set_hl(0, 'ConflictMarkerEnd', { bg = '#449dab', fg = 'white'})



-- Define custom highlight groups for conflict markers

-- Create a namespace for the conflict markers
local ns_id = vim.api.nvim_create_namespace('ConflictMarkers')

-- Create autocommands to highlight lines starting with conflict markers
vim.api.nvim_create_autocmd({'BufReadPost', 'BufWritePost', 'ColorScheme'}, {
  group = vim.api.nvim_create_augroup('ConflictMarkers', { clear = true }),
  pattern = '*',
  callback = function(args)
    local bufnr = args.buf or vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    for i, line in ipairs(lines) do
      if line:match('^<<<<') then
        vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
          hl_group = 'ConflictMarkerBegin',
          end_row = i,
          end_col = 0,
          hl_eol = true
        })
      elseif line:match('^====') then
        vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
          hl_group = 'ConflictMarkerSplit',
          end_row = i,
          end_col = 0,
          hl_eol = true
        })
      elseif line:match('^>>>>') then
        vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
          hl_group = 'ConflictMarkerEnd',
          end_row = i,
          end_col = 0,
          hl_eol = true
        })
      end
    end
  end,
})

