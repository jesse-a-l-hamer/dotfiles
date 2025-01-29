local colors = require("catppuccin.palettes").get_palette("macchiato")

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
    opts = {
      options = {
        theme = "catppuccin",
        globalstatus = true,
      },
      extensions = {
        "lazy",
        "man",
        "mason",
        "neo-tree",
        "nvim-dap-ui",
      },
      sections = {
        lualine_x = {
          {
            require("noice").api.status.message.get_hl,
            cond = require("noice").api.status.message.has,
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = colors.peach },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = colors.peach },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = colors.peach },
          },
        },
        lualine_y = {
          "encoding",
          "fileformat",
          "filetype",
          "progress",
          "location",
        },
        lualine_z = {
          { "datetime", style = "%H:%M" },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "folke/trouble.nvim" },
    opts = function(_, opts)
      local trouble = require "trouble"
      local symbols = trouble.statusline {
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      }
      table.insert(opts.sections.lualine_c or { "filename" }, {
        symbols.get,
        cond = symbols.has,
      })
    end,
  },
}
