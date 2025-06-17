-- lua/config/null-ls.lua

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- ruffをフォーマッターとして登録
    null_ls.builtins.formatting.ruff,

    -- ruffをコード修正(fix)ツールとしても登録
    -- こちらは、--fix オプション付きで実行される
    null_ls.builtins.code_actions.ruff,
  },

  -- 保存時に自動でフォーマット/Fixを実行する設定
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
  debug = true,
})
