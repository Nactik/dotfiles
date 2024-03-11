require('ts_context_commentstring').setup {
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
    css = '// %s',
    html = '<!-- %s -->',
    yaml = '# %s',
  },
}
