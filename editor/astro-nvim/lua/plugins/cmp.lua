return {
  "hrch7th/nvim-cmp",
  dependencies = {
    "justinsgithub/wezterm-types",
  },
  opts = function(_, opts)
    local cmp = require "cmp"

    opts.sources = cmp.config.sources {
      { name = "wezterm", priority = 750 },
    }
  end,
}
