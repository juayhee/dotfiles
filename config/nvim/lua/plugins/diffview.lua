return {
    "sindrets/diffview.nvim",
    config = function()
        require('diffview').setup()
        vim.keymap.set('n', '<leader>d', function()
            local filetype = vim.api.nvim_get_option_value("filetype", {})
            if (filetype == 'DiffviewFiles') then
                vim.cmd('tabc') -- Close the diffview tab
            else
                vim.cmd('DiffviewOpen')
            end
        end, { desc = 'Open diffview' })
    end
}
