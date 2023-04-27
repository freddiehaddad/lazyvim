return {
  {
    "freddiehaddad/base16-nvim",
    priority = 1000,
    config = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- configure base16-nvim here to stop LazyVim from setting
      -- its own colorscheme.
      colorscheme = function()
        local opts = {
          hot_reload = {
            enabled = true,
          },
        }
        require("base16-nvim").setup(opts)
      end,
    },
  },
}
