-- ~/.config/nvim/lua/plugins/php.lua
return {
  -- Asegurar que las herramientas necesarias estén instaladas con Mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "phpcs", -- Linter
        "php-cs-fixer", -- Formateador
        -- "intelephense", -- LSP
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
        php = { "pint" },
      })

      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
        pint = {
          command = "./vendor/bin/pint", -- Ruta al binario de Laravel Pint
          args = { "$FILENAME" },
          stdin = false,
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

  -- Configuración de null-ls.nvim para Laravel Pint
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          -- Laravel Pint para proyectos Laravel
          null_ls.builtins.formatting.pint.with({
            command = "./vendor/bin/pint", -- Ruta relativa al root del proyecto
            extra_args = {},
          }),
        },
        root_dir = require("null-ls.utils").root_pattern("composer.json"),
      }
    end,
  },

  -- Configuración de formatter.nvim
  {
    "mhartington/formatter.nvim",
    opts = {
      filetype = {
        php = {
          function()
            return {
              exe = "./vendor/bin/pint", -- Ruta al binario de Laravel Pint
              args = {}, -- Argumentos adicionales
              stdin = true, -- Usa stdin para pasar el archivo
              cwd = vim.fn.getcwd(), -- Usa el directorio actual como root
            }
          end,
        },
      },
    },
  },
}
