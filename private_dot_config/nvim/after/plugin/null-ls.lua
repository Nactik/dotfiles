local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
diagnostics.eslint = require("none-ls.diagnostics.eslint")
diagnostics.flake8 = require("none-ls.diagnostics.flake8")
diagnostics.ruff = require("none-ls.diagnostics.ruff")
formatting.ruff = require("none-ls.formatting.ruff")
formatting.jq = require("none-ls.formatting.jq")
formatting.rustfmt = require("none-ls.formatting.rustfmt")

local sources = {
        diagnostics.golangci_lint.with({filetypes = {"go"}}),
        -- Typescript Stuff --
        diagnostics.eslint.with {
            condition = function(utils)
              return not utils.has_file '.pnp.cjs'
            end,
            filetypes = { "typescript"}
        },
        -- Yarn PnP
        diagnostics.eslint.with {
          command = 'yarn',
          args = { 'eslint', '--fix','--stdin-filename', '$FILENAME' },
          condition = function(utils)
            return utils.has_file '.pnp.cjs'
          end,
          filetypes = { "typescript","typescriptreact", "typescript.tsx", "javascript.tsx" }
        },

        formatting.prettier.with {
            condition = function(utils)
              return not utils.has_file '.pnp.cjs'
            end,
            filetypes = { "typescript","typescriptreact" }
        },
        -- Yarn PnP
        formatting.prettier.with {
          command = 'yarn',
          args = { 'prettier', '-w', '--stdin-filepath', '$FILENAME' },
          condition = function(utils)
            return utils.has_file '.pnp.cjs'
          end,
          filetypes = { "typescript","typescriptreact" }
        },


        -- diagnostics.jsonlint.with({filetypes = {"json"}}),
        diagnostics.markdownlint.with({filetypes = {"yaml"}}),

        -- Python stuff
        -- Ruff
        formatting.ruff.with({
            condition = function(utils)
              return utils.has_file 'ruff.toml'
            end,
            command = 'ruff',
            args = { "check","--select","I","--fix", "&&","ruff","format","-n", "--stdin-filename", "$FILENAME", "-"},
            filetypes = { "python" }
        }),

        diagnostics.ruff.with({
            condition = function(utils)
              return utils.has_file 'ruff.toml'
            end,
            command = 'ruff',
            args = {"check", "-n", "--stdin-filename", "--fix", "$FILENAME", "-"},
            filetypes = { "python" }
        }),

        -- Classic heka stuff
        formatting.black.with({
            condition = function(utils)
              return not utils.has_file 'ruff.toml'
            end,
            dynamic_command = function()
                return "black"
            end,
            extra_args = { "--line-length", "79" },
            filetypes = { "python" }
        }),

        formatting.isort.with({
            condition = function(utils)
              return not utils.has_file 'ruff.toml'
            end,
            dynamic_command = function()
                return "isort"
            end,
            args = {
              "--stdout",
              "--filename",
              "$FILENAME",
              "-",
              "--profile",
              "black",
              "--line-length",
              "79",
            },
            filetypes = { "python" }
        }),

        diagnostics.flake8.with({
           condition = function(utils)
             return not utils.has_file 'ruff.toml'
           end,
           dynamic_command = function()
               return "flake8"
           end,
           extra_args = { "--max-line-length=79", "--ignore=E203,W503" },
           filetypes = { "python" }
        }),


        -- Random
        formatting.gofmt.with({filetypes = {"go"}}),
        formatting.jq.with({filetypes = {"json"}}),
        formatting.markdownlint.with({filetypes = {"markdown"}}),
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
    debug = true
})

vim.lsp.enable("null-ls")
