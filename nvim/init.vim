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

Plug 'neovim/nvim-lspconfig'
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

lua<<EOF
vim.g.mapleader = ";"

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
EOF

