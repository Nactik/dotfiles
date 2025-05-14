require('blink.cmp').setup {

    keymap = {
      preset = 'default',
      ['<CR>'] = {'accept', 'fallback'},
      ['esc'] = {'hide'}
    },
    -- cmdline = {
    --   keymap = {
    --     ['<Tab>'] = { 'accept' },
    --     ['<CR>'] = { 'accept_and_enter', 'fallback' },
    --   },
    --   -- (optionally) automatically show the menu
    --   completion = { menu = { auto_show = true } }
    -- },
   
    sources = {
      -- providers = {
      --   cmdline = {
      --     min_keyword_length = function(ctx)
      --       -- when typing a command, only show when the keyword is 3 characters or longer
      --       if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
      --       return 0
      --     end
      --   }
      -- }
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      menu = { border = 'rounded', draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } }, }
    },
      documentation = { window = { border = 'rounded' }, auto_show = true },
    },
    signature = { window = { border = 'rounded' } },
}

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})
