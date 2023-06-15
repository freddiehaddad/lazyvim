return {
  {
    "freddiehaddad/peanut",
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
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "peanut",
    },
  },
}
