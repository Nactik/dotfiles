local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.format({ 
            bufnr = bufnr,
            filter = function(client)
                return client.name == "null_ls"
            end
        })
        end,
    })
  end
end

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.black.with({
            command = "black",
            extra_args = { "--line-length", "79" },
            filetypes = { "python" }
        }),
        formatting.isort.with({
            command = "isort",
            extra_args = {
              "--lines-between-types",
              "1",
              "--lines-after-imports",
              "2",
              "--line-length",
              "79",
              "--multi-line",
              "3",
              "--trailing-comma"
            },
            filetypes = { "python" }
        }),
        formatting.gofmt,
        formatting.jq,
        formatting.markdownlint,
        formatting.prettier.with({
            command = "prettier",
            extra_args = { "--print-with", "100" },
            filetypes = { "typescript", "typescriptreact" },
        }),
        formatting.rustfmt.with({
            extra_args = function(params)
                local Path = require("plenary.path")
                local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

                if cargo_toml:exists() and cargo_toml:is_file() then
                    for _, line in ipairs(cargo_toml:readlines()) do
                        local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                        if edition then
                            return { "--edition=" .. edition }
                        end
                    end
                end
                -- default edition when we don't find `Cargo.toml` or the `edition` in it.
                return { "--edition=2021" }
            end,
        }),
        formatting.terraform_fmt,
        formatting.yamlfmt,

        diagnostics.golangci_lint,
        diagnostics.flake8.with({
            command = "flake8",
            extra_args = { "--max-line-length=79", "--ignore=E203,W503" },
            filetypes = { "python" }
        }),
        diagnostics.eslint,
        diagnostics.jsonlint,
        diagnostics.markdownlint,
        diagnostics.luacheck,
        diagnostics.tsc,
        diagnostics.php,
    },
    on_attach = on_attach,
})