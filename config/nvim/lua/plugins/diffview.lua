return {
    "sindrets/diffview.nvim",
    config = function()
        require('diffview').setup()
        vim.keymap.set('n', '<leader>d', function()
                vim.cmd('DiffviewOpen')
            end,
            { desc = 'Open diffview' })
    end
}
