-- ~/.config/nvim/lua/plugins/colorizer.lua
return {
  {
    "catgoose/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true, -- Soporte para TailwindCSS
        rgb_fn = true,   -- Habilita funciones RGB
        css = true,      -- Habilita CSS
        mode = "background", -- Resalta el fondo
      },
    },
  },
}
