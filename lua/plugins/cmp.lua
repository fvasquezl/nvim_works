-- ~/.config/nvim/lua/plugins/cmp.lua
-- Install: coding.nvim-cmp
-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "roobert/tailwindcss-colorizer-cmp.nvim", -- Agrega colores de TailwindCSS
    },
    opts = {
      formatting = {
        format = function(entry, vim_item)
          -- Usa el formateador de colores si está disponible
          local tailwind_colorizer = require("tailwindcss-colorizer-cmp")
          return tailwind_colorizer.formatter(entry, vim_item)
        end,
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "jwalton512/vim-blade",
  },
}
