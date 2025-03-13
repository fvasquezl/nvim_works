-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Añade los parsers que quieres instalar
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "php",
        "blade",
        "html",
        "css",
        "javascript",
        "json",
        "sql",
        "scss",
        "http",
      })

      -- Configura el filetype para Blade
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade", -- Asocia archivos .blade.php con el tipo "blade"
        },
      })
    end,
  },
}
