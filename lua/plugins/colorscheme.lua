return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = false,
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = true, -- Force no italic
      no_bold = true, -- Force no bold
      no_underline = true, -- Force no underline
      integrations = {
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
      },
      color_overrides = {
        mocha = {
          rosewater = "#f9dfd2",
          flamingo = "#f6cfbb",
          pink = "#f3bfa5",
          mauve = "#f0af8e",
          red = "#f26e5a",
          maroon = "#f48371",
          peach = "#ffbe7b",
          yellow = "#eed971",
          green = "#8aa893",
          teal = "#a7beae",
          sky = "#9dc5e2",
          sapphire = "#76aed6",
          blue = "#4e97ca",
          lavender = "#99cfff",
          text = "#f0f2f4",
          subtext1 = "#e2e6e9",
          subtext0 = "#d3d9de",
          overlay2 = "#586874",
          overlay1 = "#4d5b66",
          overlay0 = "#424e57",
          surface2 = "#374149",
          surface1 = "#2c343a",
          surface0 = "#21272c",
          base = "#161a1d",
          mantle = "#0b0d0f",
          crust = "#000000",
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
