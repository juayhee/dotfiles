return {
    'nvim-pack/nvim-spectre',
    config = function()
        local spectre = require('spectre')
        spectre.setup()
        vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").toggle()<cr>', { desc = 'Toggle Spectre' })
    end
}
