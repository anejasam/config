set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

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

"nvim-tree
lua<<EOF
require("nvim-tree").setup({

})
EOF
