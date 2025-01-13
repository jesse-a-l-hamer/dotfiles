return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  opts = {
    flavour = "macchiato",
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
  },
}
