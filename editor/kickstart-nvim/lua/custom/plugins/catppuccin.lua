return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  opts = {
    background = {
      light = "latte",
      dark = "macchiato",
    },
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      blink_cmp = true,
      colorful_winsep = {
        enabled = true,
        color = "maroon",
      },
      diffview = true,
      fidget = true,
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = "maroon",
      },
      noice = true,
      snacks = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      return {
        -- globals
        CursorLineNr = { fg = colors.maroon },
        FloatBorder = { fg = colors.maroon },
        Title = { fg = colors.maroon },
      }
    end,
  },
}
