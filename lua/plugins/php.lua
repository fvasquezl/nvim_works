-- ~/.config/nvim/lua/plugins/php.lua
return {
  -- Asegurar que las herramientas necesarias estén instaladas con Mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "phpcs", -- Linter
        "php-cs-fixer", -- Formateador
        "intelephense", -- LSP
        "tailwindcss-language-server", -- TailwindCSS LSP
        "php-debug-adapter", -- Depurador
      })
    end,
  },

  -- Configuración del depurador (DAP) para PHP
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
    end,
  },

  -- Configuración de formateadores con conform.nvim
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        php = { "pint", "php_cs_fixer" }, -- Usa Pint y PHP-CS-Fixer
      })

      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
        pint = {
          command = "pint",
          args = { "$FILENAME" },
          stdin = false,
        },
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = { "fix", "$FILENAME", "--config", ".php-cs-fixer.php" },
          stdin = false,
          env = {
            PHP_CS_FIXER_IGNORE_ENV = "1", -- Ignorar la restricción de versión
          },
        },
      })
    end,
  },

  -- Configuración de linters con nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        php = { "phpcs" }, -- Usa PHPCS como linter
      })
    end,
  },
}
