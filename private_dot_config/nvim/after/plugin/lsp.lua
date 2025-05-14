-- lsp.preset('recommended')
--
-- lsp.ensure_installed({
--     "bashls",
--     "clangd",
--     "cmake",
--     "cssls",
--     "dockerls",
--     "docker_compose_language_service",
--     "emmet_ls",
--     "html",
--     "jsonls",
--     "jdtls",
--     "ts_ls",
--     "lua_ls",
--     "marksman",
--     "rust_analyzer",
--     "tailwindcss",
--     "terraformls",
--     "yamlls"
-- })
--
-- lsp.nvim_workspace()
-- lsp.setup()
--
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = {
      "bashls",
      "clangd",
      "cmake",
      "cssls",
      "dockerls",
      "docker_compose_language_service",
      "emmet_ls",
      "html",
      "jsonls",
      "jdtls",
      "ts_ls",
      "lua_ls",
      "marksman",
      "rust_analyzer",
      "tailwindcss",
      "terraformls",
      "yamlls"
    },
}


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  -- float = {
  --   scope = 'c',
  --   border = {'╔','═','╗','║','╝','═','╚','║'},
  --   source = true
  -- }
})
