return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = {
        "ruff_organize_imports",
        "ruff_format",
      },
      markdown = {
        "prettierd",
        "prettier",
        stop_after_first_use = true,
      },
    },
  },
}
