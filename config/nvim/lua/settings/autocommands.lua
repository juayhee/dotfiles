vim.api.nvim_create_augroup('help', {
    clear = true,
})

-- Open help / fugitive splits vertically to the right instead of horizontally
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { "help" },
    command = "wincmd L",
    group = 'help'
})


local diff = vim.api.nvim_create_augroup('diff', {
    clear = true,
})

-- Open help / fugitive splits vertically to the right instead of horizontally
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    callback = function()
        local is_diff = vim.api.nvim_get_option_value('diff', {})
        if is_diff then
            vim.keymap.set('n', 'dp', '<cmd>diffput<cr>', { desc = 'diffput' })
            vim.keymap.set('n', 'dg', '<cmd>diffget<cr>', { desc = 'diffget' })
        end
    end,
    group = 'diff'
})
