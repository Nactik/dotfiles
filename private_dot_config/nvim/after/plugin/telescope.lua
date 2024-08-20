local builtin = require('telescope.builtin')

-- Basic Telescope stuff
vim.keymap.set('n', '<leader>sf', builtin.find_files, { })
vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
vim.keymap.set('n', '<leader>sm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>ss', builtin.grep_string, {})

-- Git Stuff
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gS', builtin.git_stash, {})

vim.keymap.set('n', '<leader>sT', ":TodoTelescope<CR>")
