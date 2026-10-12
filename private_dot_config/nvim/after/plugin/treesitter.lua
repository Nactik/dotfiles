-- require('nvim-treesitter.configs').setup({
--   -- A list of parser names, or "all" (the four listed parsers should always be installed)
--   ensure_installed = { "c", "lua", "vim", "javascript", "go", "html", "python", "terraform", "typescript", "hcl", "bash", "markdown", "rust", "yaml","java", "php", "markdown", "helm", "gotmpl" },
--
--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   sync_install = false,
--
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = true,
--
--   highlight = {
--     -- `false` will disable the whole extension
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
-- })
--
-- vim.filetype.add({
--   extension = {
--     gotmpl = 'gotmpl',
--   },
--   pattern = {
--     [".*/templates/.*%.tpl"] = "helm",
--     [".*/templates/.*%.ya?ml"] = "helm",
--     ["helmfile.*%.ya?ml"] = "helm",
--   },
-- })


local treesitter = require("nvim-treesitter")
local required_ts = {
  'c',
  'lua',
  'vim',
  'bash',
  'javascript',
  'go',
  'gotmpl',
  'gomod',
  'helm',
  'html',
  'python',
  'hcl',
  'terraform',
  'typescript',
  'markdown',
  'rust',
  'yaml',
  'json',
  'dockerfile',
  'make',
  'tsx'
}

treesitter.install(required_ts):wait(300000)

vim.api.nvim_create_autocmd('FileType', {
  -- pattern = required_ts,
  callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if not lang then return end
      if not pcall(vim.treesitter.start, args.buf, lang) then return end

      -- syntax highlighting, provided by Neovihttps://ewallet.innovorder.fr/1817/login
      -- vim.treesitter.start()
      -- folds, provided by Neovim
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo.foldmethod = 'expr'
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
