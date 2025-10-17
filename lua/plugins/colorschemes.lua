return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        show_end_of_buffer = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          mason = true,
        }
      })

      vim.cmd([[colorscheme catppuccin]])

    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 10,
    config = function()
      require("tokyonight").setup({
        style = "storm", 
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
        }
      })
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 10,
    config = function()
      require("gruvbox").setup({
        transparent_mode = false,
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        }
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 10,
    config = function()
      require("rose-pine").setup({
        variant = "main", 
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
      })
    end,
  },
}