return {
  {
    "freddiehaddad/feline.nvim",
    dependencies = { "lewis6991/gitsigns.nvim", "folke/noice.nvim" },
    config = function()
      local feline = require("feline")
      local separators = require("feline.defaults").statusline.separators.default_value
      local vi_mode = require("feline.providers.vi_mode")

      local icons = require("lazyvim.config").icons
      local colors = require("peanut.palettes").get_palette()

      local theme = {
        fg = colors.text,
        bg = colors.crust,
        black = colors.crust,
        skyblue = colors.sky,
        cyan = colors.teal,
        green = colors.green,
        oceanblue = colors.blue,
        magenta = colors.mauve,
        orange = colors.peach,
        red = colors.red,
        violet = colors.lavender,
        white = colors.text,
        yellow = colors.yellow,
      }

      local git_diff = function(type)
        ---@diagnostic disable-next-line: undefined-field
        local gsd = vim.b.gitsigns_status_dict
        if gsd and gsd[type] and gsd[type] > 0 then
          return tostring(gsd[type])
        end
        return nil
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
        hl = { fg = colors.blue, bg = colors.base },
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
        hl = { fg = colors.text, bg = colors.surface1 },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.base, bg = colors.surface1 },
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
        hl = { fg = colors.base, bg = colors.green },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.surface1, bg = colors.green },
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
        hl = { fg = colors.mantle, bg = colors.yellow },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.green, bg = colors.yellow },
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
        hl = { fg = colors.base, bg = colors.red },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.yellow, bg = colors.red },
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
        hl = { fg = colors.text, bg = colors.surface1 },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.red, bg = colors.surface1 },
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
        hl = { fg = colors.base, bg = colors.red },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.surface1, bg = colors.red },
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
        hl = { fg = colors.base, bg = colors.yellow },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.red, bg = colors.yellow },
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
        hl = { fg = colors.base, bg = colors.sky },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.yellow, bg = colors.sky },
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
        hl = { fg = colors.base, bg = colors.teal },
        left_sep = {
          always_visible = true,
          str = separators.right_filled,
          hl = { fg = colors.sky, bg = colors.teal },
        },
      })

      table.insert(components.active[1], {
        provider = {
          name = "file_info",
          opts = { type = "full-path" },
        },
        hl = { fg = colors.text, bg = colors.surface0 },
        left_sep = {
          always_visible = true,
          str = separators.right_filled .. " ",
          hl = { fg = colors.teal, bg = colors.surface0 },
        },
      })

      -- right
      table.insert(components.active[2], {
        provider = function()
          local mode = require("noice").api.status.mode.get()
          if mode then
            return " " .. mode .. " "
          else
            return ""
          end
        end,
        hl = { fg = colors.text, bg = colors.surface1 },
        left_sep = {
          always_visible = true,
          str = separators.slant_right_2,
          hl = { fg = colors.surface0, bg = colors.surface1 },
        },
      })

      table.insert(components.active[2], {
        provider = function()
          return " " .. vi_mode.get_vim_mode() .. " "
        end,
        hl = function()
          return { fg = colors.surface1, bg = vi_mode.get_mode_color() }
        end,
        left_sep = {
          str = separators.slant_right_2,
          hl = function()
            return { fg = colors.surface1, bg = vi_mode.get_mode_color() }
          end,
        },
      })

      table.insert(components.active[2], {
        provider = {
          name = "position",
          opts = { padding = true },
        },
        hl = { fg = colors.peach, bg = colors.surface1 },
        left_sep = {
          str = separators.slant_right_2 .. " ",
          hl = function()
            return { fg = vi_mode.get_mode_color(), bg = colors.surface1 }
          end,
        },
        right_sep = {
          str = " ",
          hl = { fg = colors.peach, bg = colors.surface1 },
        },
      })

      table.insert(components.active[2], {
        provider = {
          name = "scroll_bar",
          opts = { reverse = true },
        },
        hl = { fg = colors.peach, bg = colors.surface1 },
      })

      feline.setup({ components = components })
      feline.use_theme(theme)
    end,
  },
}
