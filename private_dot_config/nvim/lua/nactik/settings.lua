vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.numberwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 999

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.opt.clipboard = 'unnamedplus'

vim.opt.termguicolors = true

-- Split options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Font options
vim.opt.guifont = "Hack Nerd Mono:17"

-- lualine on top of the screen
vim.opt.laststatus = 3

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})


