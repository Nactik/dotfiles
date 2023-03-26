local indent_blankline = require("indent_blankline")

indent_blankline.setup({
    use_treesitter = true,
    buftype_exclude = { "terminal", "nofile" },
    show_first_indent_level = false,
    char = "▏",
    context_char = "▏",
    show_current_context = false,
})
