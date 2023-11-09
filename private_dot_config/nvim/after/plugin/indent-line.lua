local indent_blankline = require("ibl")

indent_blankline.setup({
    enabled = false,
    indent = {
      char = "▏",
    },
    exclude = {
      buftypes = { "terminal", "nofile" },
    },
    -- show_first_indent_level = false,
    -- show_current_context = false,
})
