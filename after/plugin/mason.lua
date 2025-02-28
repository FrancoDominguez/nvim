require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "java_language_server", "pyright", "jdtls"}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

-- =========================================================
-- Java Config

lspconfig.jdtls.setup {
  capabilities = capabilities,
  cmd = { 'jdtls' },
  root_dir = lspconfig.util.root_pattern('.git', 'pom.xml', 'build.gradle'),
  settings = {
    java = {}
  }
}

-- =========================================================
-- Lua Config

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      telemetry = {
        enable = false
      },
    },
  },
  on_init = function(client)
    local join = vim.fs.joinpath
    local path = client.workspace_folders[1].name

    -- Don't do anything if there is project local config
    if vim.uv.fs_stat(join(path, '.luarc.json')) 
      or vim.uv.fs_stat(join(path, '.luarc.jsonc'))
      then
        return
      end

      -- Apply neovim specific settings
      local runtime_path = vim.split(package.path, ';')
      table.insert(runtime_path, join('lua', '?.lua'))
      table.insert(runtime_path, join('lua', '?', 'init.lua'))

      local nvim_settings = {
        runtime = {
          -- Tell the language server which version of Lua you're using
          version = 'LuaJIT',
          path = runtime_path
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'}
        },
        workspace = {
          checkThirdParty = false,
          library = {
            -- Make the server aware of Neovim runtime files
            vim.env.VIMRUNTIME,
            vim.fn.stdpath('config'),
          },
        },
      }

      client.config.settings.Lua = vim.tbl_deep_extend(
      'force',
      client.config.settings.Lua,
      nvim_settings
      )
    end,
  })

