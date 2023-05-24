return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- BASH
        "bash-language-server",
        "shellcheck",

        -- Go
        "gopls",
        "goimports",

        -- Markdown
        "marksman",
        "markdownlint",

        -- Python
        "autopep8",
        "pyright",

        -- Terraform
        "terraform-ls",
        "tflint",

        -- YAML
        "yamlfmt",
        "yaml-language-server",
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        -- BASH
        nls.builtins.formatting.shfmt,

        -- Go
        nls.builtins.formatting.goimports,

        -- Markdown
        nls.builtins.diagnostics.markdownlint,

        -- Python
        nls.builtins.formatting.autopep8,

        -- Terraform
        nls.builtins.formatting.terraform_fmt,

        -- YAML
        nls.builtins.formatting.yamlfmt,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
      },
    },
  },
}
