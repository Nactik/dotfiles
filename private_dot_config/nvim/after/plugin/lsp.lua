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
      "yamlls",
      "pylsp"
    },
}


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
  -- float = {
  --   scope = 'c',
  --   border = {'╔','═','╗','║','╝','═','╚','║'},
  --   source = true
  -- }
})

vim.lsp.enable('gopls')
