return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufNewFile', 'BufReadPre' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'nvim-telescope/telescope.nvim' -- Telescope LSP keymaps must be registered first
    },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config
        local builtin = require('telescope.builtin')

        -- Add autocompletion capabilities to lspconfig's existing caps
        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- Load installed servers from Mason
        require('mason').setup();
        require('mason-lspconfig').setup({
            automatic_installation = true
        })
        lspconfig.lua_ls.setup{}
        lspconfig.clangd.setup{}
        lspconfig.rust_analyzer.setup{}
        lspconfig.pylsp.setup{}

        -- LSP related keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                -- Keymaps in LSP-attached buffer
                local opts = { buffer = event.buf } -- Identifies the attached buffer
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, opts)
                vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, opts)
                vim.keymap.set('n', '<leader>gr', builtin.lsp_references, opts)
                vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>gS', builtin.lsp_dynamic_workspace_symbols, opts)
                vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, opts)
                vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, opts)
                vim.keymap.set('n', '<leader>gx', function()
                    builtin.diagnostics { bufnr = 0 }
                end, opts)
            end,
        })
    end
}
