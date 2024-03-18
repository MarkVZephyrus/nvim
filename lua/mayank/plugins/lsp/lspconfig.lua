return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig')['clangd'].setup {
      capabilities = capabilities
    }
  end,
}
