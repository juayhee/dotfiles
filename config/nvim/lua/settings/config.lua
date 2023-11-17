--General
vim.cmd('set timeout')
vim.cmd('set timeoutlen=500')
vim.cmd('set termguicolors')

-- Spaces and Tabs
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set smartindent')
vim.cmd('filetype plugin indent on')

-- Visual
vim.cmd('set number')
vim.cmd('set rnu')
vim.cmd('set showcmd')
vim.o.cursorline = true
vim.o.cursorlineopt = 'number' -- Only highlight the line number
vim.o.syntax = false
vim.opt.colorcolumn = '80'
vim.opt.formatoptions:remove("o")
--

-- Search
vim.cmd('set incsearch')
vim.cmd('set ignorecase')
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- Splits
vim.o.splitright = true -- Always split to the right

-- Diagnostics
vim.diagnostic.config({ virtual_text = false })

-- Remove autocommenting
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Diffs
-- vertical: Always open diffs in vertical splits
-- foldcolumn: Do not fold diff buffers
vim.opt.diffopt:append { 'vertical', 'foldcolumn:0' }
