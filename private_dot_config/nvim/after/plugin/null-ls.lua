local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
        diagnostics.golangci_lint.with({filetypes = {"go"}}),
        diagnostics.flake8.with({
           dynamic_command = function()
               return "flake8"
           end,
           extra_args = { "--max-line-length=79", "--ignore=E203,W503" },
           filetypes = { "python" }
        }),
        diagnostics.eslint.with({filetypes = {"typescript", "typescriptreact"}}),
        diagnostics.jsonlint.with({filetypes = {"json"}}),
        diagnostics.markdownlint.with({filetypes = {"yaml"}}),
        diagnostics.tsc,
        diagnostics.php.with({filetypes = {"php"}}),

        formatting.black.with({
            dynamic_command = function()
                return "black"
            end,
            extra_args = { "--line-length", "79" },
            filetypes = { "python" }
        }),
        formatting.isort.with({
            dynamic_command = function()
                return "isort"
            end,
            args = {
              "$FILENAME",
              "--stdout",
              "--profile",
              "black",
              "--line-length",
              "79",
            },
            filetypes = { "python" }
        }),
        formatting.gofmt.with({filetypes = {"go"}}),
        formatting.jq.with({filetypes = {"json"}}),
        formatting.markdownlint.with({filetypes = {"markdown"}}),
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
        formatting.terraform_fmt.with({filetypes = {"terraform", "hcl"}}),
        formatting.yamlfmt.with({filetypes = {"yaml"}}),

    }

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
                return client.name == "null-ls"
            end
        })
        end,
    })
  end
end

null_ls.setup({
    sources = sources,
    on_attach = on_attach,
    debug = false
})
