return {
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
          -- color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          -- color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.search.get,
          cond = require("noice").api.status.search.has,
          -- color = { fg = "#ff9e64" },
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
}
