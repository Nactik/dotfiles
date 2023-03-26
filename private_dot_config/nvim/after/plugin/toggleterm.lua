local toggleterm = require("toggleterm")

toggleterm.setup({
   -- size can be a number or function which is passed the current terminal
  size = 50,
  open_mapping = [[<leader>t]],
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

