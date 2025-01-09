return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = function(_, opts)
      if not opts.scope then
        opts.scope = {}
      end
      opts.scope.show_start = true
      opts.scope.show_end = true
      opts.scope.highlight = vim.tbl_get(vim.g, 'rainbow_delimiters', 'highlight')
        or {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        }
    end,

    config = function(plugin, opts)
      require(plugin.main).setup(opts)

      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
