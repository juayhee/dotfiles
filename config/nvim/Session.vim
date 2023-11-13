let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/dotfiles/config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/dev/dotfiles/config/nvim/lua/test.lua
badd +22 lua/settings/keymaps.lua
badd +16 ~/dev/dotfiles/config/nvim/lua/plugins/harpoon.lua
badd +1 ~/dev/dotfiles/config/nvim/lua/plugins/marks.lua
badd +27 ~/dev/dotfiles/config/nvim/lua/plugins/telescope.lua
badd +22 ~/dev/dotfiles/config/nvim/lua/settings/config.lua
badd +3 lua/plugins/focus.lua
badd +19 lua/plugins/nvim-treesitter.lua
badd +9 ~/dev/dotfiles/config/nvim/lua/plugins/annotate.lua
badd +4 lua/plugins/mini.lua
badd +5 ~/dev/dotfiles/config/nvim/lua/custom/custom.lua
badd +21 lua/plugins/nvim-cmp.lua
badd +5 ~/dev/dotfiles/config/nvim/lua/plugins/bookmarks.lua
badd +1 lua/plugins/which-key.lua
badd +2 health://
badd +9 ~/dev/dotfiles/config/nvim/lua/plugins/oil.lua
badd +5 ~/dev/dotfiles/config/nvim/lua/plugins/zen-mode.lua
badd +1 ~/dev/dotfiles/config/nvim/lua/plugins/neoscroll.lua
badd +44 ~/dev/dotfiles/config/nvim/lua/plugins/nvim-lspconfig.lua
badd +1 ~/.local/share/nvim/lazy/kanagawa.nvim/README.md
badd +1 ~/.local/share/nvim/lazy/kanagawa.nvim/colors/kanagawa-dragon.vim
badd +113 ~/.local/share/nvim/lazy/kanagawa.nvim/lua/kanagawa/colors.lua
badd +52 ~/.local/share/nvim/lazy/kanagawa.nvim/lua/kanagawa/init.lua
badd +1 ~/.local/share/nvim/lazy/kanagawa.nvim/colors/kanagawa.vim
badd +9 ~/dev/dotfiles/config/nvim/lua/plugins/lualine.lua
badd +5 oil:///home/juayhee/.local/share/nvim/lazy/lualine.nvim/
badd +1 oil:///home/juayhee/.local/share/nvim/lazy/lualine.nvim/lua/
badd +3 oil:///home/juayhee/.local/share/nvim/lazy/lualine.nvim/lua/lualine/
badd +1 Lualine\ Notices
badd +1 lua/plugins/nvim-bqf.lua
badd +6 lua/plugins/zk-nvim.lua
badd +35721 ~/.local/state/nvim/lsp.log
badd +300 ~/.local/share/nvim/lazy/kanagawa.nvim/lua/kanagawa/themes.lua
badd +16 ~/dev/dotfiles/config/nvim/lua/plugins/indent-blankline.lua
badd +1 ~/dev/dotfiles/config/nvim/lua/settings/init.lua
badd +1 oil:///home/juayhee/dev/dotfiles/config/nvim/
argglobal
%argdel
$argadd oil:///home/juayhee/dev/dotfiles/config/nvim/
edit ~/dev/dotfiles/config/nvim/lua/plugins/indent-blankline.lua
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter$foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 15 - ((14 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 056|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
