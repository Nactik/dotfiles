local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "emmet_ls",
    "golangci_lint_ls",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "lua_ls",
    "marksman",
    "rust_analyzer",
    "tailwindcss",
    "terraformls",
    "yamlls",
    "pyright"
})

lsp.nvim_workspace()
lsp.setup()

