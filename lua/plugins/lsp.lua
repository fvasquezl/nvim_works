-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          filetypes = { "php", "blade" },
          root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
          init_options = {
            ["language_server_phpstan"] = true,
            ["language_server_psalm"] = true,
          },
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {},
  },
}
