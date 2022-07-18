set number
set relativenumber
set autoindent
set tabstop=4


call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {

  ensure_installed = { "c", "python", "java", "cpp" },

  auto_install = true,
  
  highlight = {
    enable = true,              
},
}
EOF
