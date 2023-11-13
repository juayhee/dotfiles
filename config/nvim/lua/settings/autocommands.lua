vim.api.nvim_create_augroup('help', {
    clear = true,
})

-- Open help / fugitive splits vertically to the right instead of horizontally
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { "help" },
    command = "wincmd L",
    group = 'help'
})
