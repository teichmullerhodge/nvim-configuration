-- Keymaps configuration
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Window division
map("n", "<A-z>", "<cmd>vsplit<CR>", { desc = "Split vertically" })
map("n", "<A-x>", "<cmd>split<CR>", { desc = "Split horizontally" })


-- Navigation between splits

map("n", "<A-Up>", "<C-w><Up>", { desc = "Move to split above" })
map("n", "<A-Down>", "<C-w><Down>", { desc = "Move to split below" })
map("n", "<A-Left>", "<C-w><Left>", { desc = "Move to split left" })
map("n", "<A-Right>", "<C-w><Right>", { desc = "Move to split right" })

-- Goto line with Alt+q
map("n", "<A-q>", ":", { desc = "Go to specific line" })

-- Move lines up and down with Alt+2 and Alt+5
map("n", "<A-k5>", ":move -2<CR>", { desc = "Move line up" })
map("n", "<A-k2>", ":move +1<CR>", { desc = "Move line down" })

-- Close buffer with Alt+w
map("n", "<A-w>", function()
    local buffers = vim.fn.getbufinfo({buflisted = 1})
    if #buffers == 1 then
        -- If it's the last buffer, close Neovim
        vim.cmd('BufferClose')
        vim.cmd('q')
    else

        -- If it's not the last buffer, use normal BufferClose
        vim.cmd('BufferClose')
    end
end, { desc = "Close buffer (tab)" })

-- Alt + f (find in telescope)

map("n", "<A-f>", "<cmd>Telescope live_grep<CR>", { desc = "Search files (Telescope)" })

-- Alt + c (find files in telescope)
map("n", "<A-c>", "<cmd>Telescope find_files<CR>", { desc = "Search files (Telescope)" })

-- Toolbar Lazy
map("n", "<A-v>", "<cmd>Lazy<CR>", { desc = "Open lazy" })

-- Toogle nvim-tree 
map("n", "<A-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer (Nvim-Tree)" })

-- Alt + Home (goto first line)
map("n", "<A-Home>", "gg", { desc = "Go to first line" })
-- Alt + End (goto last line)
map("n", "<A-End>", "G", { desc = "Go to last line" })

-- Ctrl + s (save file)
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Alt + 1 and Alt + 3 to switch between tabs
map("n", "<A-k3>", "<cmd>BufferNext<CR>", { desc = "Go to next tab" })
map("n", "<A-k1>", "<cmd>BufferPrevious<CR>", { desc = "Go to previous tab" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, desc = "LSP keymaps" }
    map('n', '<A-a>', vim.lsp.buf.hover, opts)      -- Show definition (hover)
    map('n', '<A-d>', vim.lsp.buf.definition, opts) -- Go to definition
    map('n', '<A-s>', '<cmd>normal! <C-o><CR>', opts) -- Go back to last point in jump list
  end,
})

-- Prevents capslock issues.
vim.cmd("command! -bang Q q<bang>")


return {}