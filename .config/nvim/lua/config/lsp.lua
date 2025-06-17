-- lua/config/lsp.lua

local lspconfig = require('lspconfig')
-- TODO
-- リッチな補完
-- 後で入れる
-- local capabilities = require('cmp_nvim_lsp').default_capabilities() -- nvim-cmpを使っている場合

-- キーマッピングなど、LSPサーバー共通の設定
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end

-- ruff-lsp のセットアップ
lspconfig.ruff.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  -- 必要に応じてruff-lspの初期化オプションをここに書く
  -- init_options = { ... }
})

-- (補足) Pythonの補完用LSP (pyright) も併用するのが一般的です
-- lspconfig.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
