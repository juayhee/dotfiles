vim.g.mapleader = ' '

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Press enter again to clear search highlights
vim.keymap.set('n', '<esc>', '<cmd>noh<cr><esc>')

-- Re-centre cursor after jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- System clipboard actions
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>p', '\"+p')

-- Quickfix list opening
vim.keymap.set('n', '<leader>q', '<cmd>copen<cr>', { desc = 'Open quickfix list' })

-- Diagnostics
vim.keymap.set('n', '<leader>go', vim.diagnostic.open_float,
              { desc = 'Open diagnostic in floating window' })
vim.keymap.set('n', '<leader>gj', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>gk', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })

-- Tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>',
              { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabc<cr>',
              { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>te', '<cmd>tabedit %<cr>',
              { desc = 'Open current buffer in new tab' })
