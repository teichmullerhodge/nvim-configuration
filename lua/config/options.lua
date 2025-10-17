-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Behavior
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.o.updatetime = 250


vim.diagnostic.config({
  virtual_text = true, 
  
  signs = {
    priority = 10,  
    text = {
      [vim.diagnostic.severity.ERROR] = '❌',
      [vim.diagnostic.severity.WARN] = '⚠️',
      [vim.diagnostic.severity.INFO] = 'ℹ️',
      [vim.diagnostic.severity.HINT] = '💡',
    },
  },
  float = {
    border = 'rounded',  
    source = 'always',   -- Show the source of the error 
    header = '',         -- Remove default header
    prefix = '',         -- Remove default prefix
  },
})

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

return {}