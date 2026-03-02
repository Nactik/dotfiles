local toggleterm = require("toggleterm")
local Terminal  = require('toggleterm.terminal').Terminal

toggleterm.setup({
   -- size can be a number or function which is passed the current terminal
  size = 50,
  open_mapping = [[<C-\>]],
  hide_number = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factors = 2,
  start_in_insert = true,
  insert_mappings = false,
  persist_size = true,
  direction = "float",
  close_on_exit = false,
  shell = vim.o.shell,
  float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
          background = "Normal",
      }
  }
})


local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  size  = 50,
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      background = "Normal",
    }
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-^>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
