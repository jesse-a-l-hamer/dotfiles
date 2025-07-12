local transparent_background = true
local accent_color = "maroon"
local dark_flavor = "macchiato"

---@module 'catppuccin'
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  ---@type CatppuccinOptions
  opts = {
    background = {
      light = "latte",
      dark = dark_flavor,
    },
    dim_inactive = {
      enabled = not transparent_background,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      blink_cmp = true,
      colorful_winsep = {
        enabled = true,
        color = accent_color,
      },
      diffview = true,
      flash = true,
      lsp_trouble = true,
      markview = true,
      mini = {
        enabled = true,
        indentscope_color = accent_color,
      },
      native_lsp = { enabled = false },
      noice = true,
      nvim_surround = true,
      render_markdown = false,
      snacks = { enabled = true, indent_scope_color = accent_color },
      telescope = { enabled = false },
      which_key = true,
    },
    -- term_colors = true,
    transparent_background = transparent_background,
    custom_highlights = function(colors)
      return {
        -- globals
        CursorLineNr = { fg = colors[accent_color] },
        FloatBorder = { fg = colors[accent_color] },
        Title = { fg = colors[accent_color] },
      }
    end,
  },
}
