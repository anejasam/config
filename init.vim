set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

nmap <C-f> :NvimTreeToggle<CR>

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'windwp/nvim-autopairs'

Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

Plug 'Mofiqul/dracula.nvim'
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
    sort_by = 'extension',
    view = {
        adaptive_size = true,
        
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "d", action = "cd"},
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
                icons = {
                    edge = "│ ",
                    item = "├─",
                    corner = "╰─",
                    none = " ",
                },
        },
    
        icons = {
            show = {
                folder_arrow = false,    
            },
        git_placement = "after",
        },
    },
    
})
EOF

lua<<EOF
require("nvim-autopairs").setup ({})
require'toggleterm'.setup {
    open_mapping = [[<c-t>]],
    direction = 'float',
} 
EOF

