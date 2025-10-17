return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons', 
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
      
    sidebar_filetypes = {
        NvimTree = true,
        undotree = {
        text = 'undotree',
        align = 'center', 
        },
        ['neo-tree'] = {event = 'BufWipeout'},
        Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
        },

    },
}

