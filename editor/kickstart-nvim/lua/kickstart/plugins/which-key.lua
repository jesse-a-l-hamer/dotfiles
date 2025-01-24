---@module 'which-key'

return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    ---@type wk.Opts
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },
      spec = {
        { "<leader>b", group = "[b]uffer" },
        { "<leader>d", group = "[d]ebug" },
        { "<leader>f", group = "[f]ind" },
        { "<leader>fp", group = "[p]icker" },
        { "<leader>g", group = "[g]it", mode = { "n", "v" } },
        { "<leader>gd", group = "[d]iff", mode = { "n", "v" } },
        { "<leader>gr", group = "[r]eset", mode = { "n", "v" } },
        { "<leader>gs", group = "[s]tage", mode = { "n", "v" } },
        { "<leader>gf", group = "[f]ind", mode = { "n", "v" } },
        { "<leader>l", group = "[l]sp", mode = { "n", "v" } },
        { "<leader>ls", group = "[s]earch", mode = { "n", "v" } },
        { "<leader>lg", group = "[g]oto", mode = { "n", "v" } },
        { "<leader>lr", group = "[r]ename", mode = { "n", "v" } },
        { "<leader>lx", group = "[x] Trouble", mode = { "n", "v" } },
        { "<leader>n", group = "[n]otifications" },
        { "<leader>o", group = "[o]bsidian" },
        { "<leader>s", group = "[s]earch" },
        { "<leader>t", group = "[t]erminal" },
        { "<leader>T", group = "[T]oggles" },
        { "<leader>x", group = "[x] Trouble" },
      },
      win = {
        border = "rounded",
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
