return {
  {
    "freddiehaddad/feline.nvim",
    dependencies = { "freddiehaddad/base16-nvim", "lewis6991/gitsigns.nvim" },
    config = function()
      local feline = require("feline")
      local separators = require("feline.defaults").statusline.separators.default_value
      local vi_mode = require("feline.providers.vi_mode")

      local icons = require("lazyvim.config").icons

      local git_diff = function(type)
        ---@diagnostic disable-next-line: undefined-field
        local gsd = vim.b.gitsigns_status_dict
        if gsd and gsd[type] and gsd[type] > 0 then
          return tostring(gsd[type])
        end
        return nil
      end

      local update_theme = function()
        local theme = {
          fg = "#" .. vim.g.base16_gui05,
          bg = "#" .. vim.g.base16_gui00,
          base00 = "#" .. vim.g.base16_gui00, -- black
          base01 = "#" .. vim.g.base16_gui01,
          base02 = "#" .. vim.g.base16_gui02,
          base03 = "#" .. vim.g.base16_gui03,
          base04 = "#" .. vim.g.base16_gui04,
          base05 = "#" .. vim.g.base16_gui05, -- white
          base06 = "#" .. vim.g.base16_gui06,
          base07 = "#" .. vim.g.base16_gui07, -- bright white
          base08 = "#" .. vim.g.base16_gui08, -- red
          base09 = "#" .. vim.g.base16_gui09,
          base0A = "#" .. vim.g.base16_gui0A, -- yellow
          base0B = "#" .. vim.g.base16_gui0B, -- green
          base0C = "#" .. vim.g.base16_gui0C, -- cyan
          base0D = "#" .. vim.g.base16_gui0D, -- blue
          base0E = "#" .. vim.g.base16_gui0E, -- magenta
          base0F = "#" .. vim.g.base16_gui0F,
          black = "#" .. vim.g.base16_gui00,
          skyblue = "#" .. vim.g.base16_gui0D,
          cyan = "#" .. vim.g.base16_gui0C,
          green = "#" .. vim.g.base16_gui0B,
          oceanblue = "#" .. vim.g.base16_gui0D,
          magenta = "#" .. vim.g.base16_gui0E,
          orange = "#" .. vim.g.base16_gui0A,
          red = "#" .. vim.g.base16_gui08,
          violet = "#" .. vim.g.base16_gui0E,
          white = "#" .. vim.g.base16_gui05,
          yellow = "#" .. vim.g.base16_gui0A,
        }

        feline.use_theme(theme)
      end

      local components = {
        active = {
          {}, -- left
          {}, -- right
        },
      }

      -- left
      table.insert(components.active[1], {
        provider = function()
          if require("lazy.status").has_updates() then
            return " " .. require("lazy.status").updates() .. " "
          end
          return "  "
        end,
        hl = { fg = "base0A", bg = "base00" },
      })

      table.insert(components.active[1], {
        provider = function()
          local git = require("feline.providers.git")
          local branch, icon = git.git_branch()
          if #branch > 0 then
            return " " .. icon .. branch .. " "
          end
          return ""
        end,
        hl = { fg = "base04", bg = "base02" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base00", bg = "base02" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local status = git_diff("added")
          if status then
            return " " .. icons.git.added .. status .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base0B" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base02", bg = "base0B" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local status = git_diff("changed")
          if status then
            return " " .. icons.git.modified .. status .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base0A" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base0B", bg = "base0A" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local status = git_diff("removed")
          if status then
            return " " .. icons.git.removed .. status .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base08" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base0A", bg = "base08" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local lsp = require("feline.providers.lsp")
          if lsp.is_lsp_attached() then
            return " " .. lsp.lsp_client_names() .. " "
          end
          return ""
        end,
        hl = { fg = "base04", bg = "base02" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base08", bg = "base02" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
          if count > 0 then
            return " " .. icons.diagnostics.Error .. count .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base08" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base02", bg = "base08" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))
          if count > 0 then
            return " " .. icons.diagnostics.Warn .. count .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base0A" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base08", bg = "base0A" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }))
          if count > 0 then
            return " " .. icons.diagnostics.Info .. count .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base0D" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base0A", bg = "base0D" },
        },
      })

      table.insert(components.active[1], {
        provider = function()
          local count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }))
          if count > 0 then
            return " " .. icons.diagnostics.Hint .. count .. " "
          end
          return ""
        end,
        hl = { fg = "base00", bg = "base0E" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = "base0D", bg = "base0E" },
        },
      })

      table.insert(components.active[1], {
        provider = {
          name = "file_info",
          opts = { type = "full-path" },
        },
        hl = { fg = "base04", bg = "base01" },
        left_sep = {
          always_visible = true,
          str = separators.right_filled .. " ",
          hl = { fg = "base0E", bg = "base01" },
        },
      })

      -- right
      table.insert(components.active[2], {
        provider = function()
          return " " .. vi_mode.get_vim_mode() .. " "
        end,
        hl = function()
          return { fg = "base00", bg = vi_mode.get_mode_color() }
        end,
        left_sep = {
          str = separators.slant_right_2,
          hl = function()
            return { fg = "base01", bg = vi_mode.get_mode_color() }
          end,
        },
      })

      table.insert(components.active[2], {
        provider = {
          name = "position",
          opts = { padding = true },
        },
        hl = { fg = "base00", bg = "base0A" },
        left_sep = {
          str = separators.slant_right_2 .. " ",
          hl = function()
            return { fg = vi_mode.get_mode_color(), bg = "base0A" }
          end,
        },
        right_sep = {
          str = " ",
          hl = { fg = "base00", bg = "base0A" },
        },
      })

      table.insert(components.active[2], {
        provider = {
          name = "scroll_bar",
          opts = { reverse = true },
        },
        hl = { fg = "base09", bg = "base0A" },
      })

      feline.setup({ components = components })
      update_theme()

      require("base16-nvim").listen(update_theme)
    end,
  },
}
