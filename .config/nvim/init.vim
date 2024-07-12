set runtimepath+=/usr/share/vim/vimfiles
source ~/.config/nvim/lua/plugins.lua
source ~/.config/nvim/256_noir.vim
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3
let g:netrw_preview = 2
let g:netrw_rmdir_cmd = "rm -rf"
let g:netrw_localrmdir = "rm -rf"

set tabstop=4
set softtabstop=4
set shiftwidth=4

set modifiable
set wrap
set clipboard+=unnamedplus
colorscheme catppuccin-mocha

