require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "javascript", "go", "html", "python", "terraform", "typescript", "hcl", "bash", "markdown", "rust", "yaml","java", "php", "markdown" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { 'jsx', 'cpp' },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  },

})
