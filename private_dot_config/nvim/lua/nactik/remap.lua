vim.g.mapleader = " "
-- VSCode like remap to move lines

vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")

-- Used to keep cursor in middle when searching pattern
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Switch window easier
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Toggle NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Copilot
vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
-- vim.keymap.set("i", "<C-a>", ":copilot#Accept('')<CR>")
vim.g.copilot_no_tab_map = true

