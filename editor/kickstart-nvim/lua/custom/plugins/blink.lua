return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    dependencies = {
      "justinsgithub/wezterm-types",
    },
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "wezterm-types", mods = { "wezterm" } },
      },
    },
  },
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      "Kaiser-Yang/blink-cmp-dictionary",
      {
        "Kaiser-Yang/blink-cmp-git",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },

    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = "cargo build --release",
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = "default" },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        -- use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },
      completion = {
        menu = {
          border = "rounded",
          draw = { -- use mini.icons
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
        -- ghost_text = { enabled = true },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        -- dynamically pick providers by treesitter node/filetype
        default = {
          "lazydev",
          "lsp",
          "path",
          "snippets",
          "git",
          "dictionary",
          "buffer",
          "emoji",
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          emoji = {
            name = "Emoji",
            module = "blink-emoji",
            score_offset = 15,
            opts = { insert = true },
          },
          dictionary = {
            module = "blink-cmp-dictionary",
            name = "Dict",
            min_keyword_length = 3,
          },
          git = {
            -- Because we use filetype to decide whether or not to show the items,
            -- we can make the score higher
            score_offset = 100,
            module = "blink-cmp-git",
            name = "Git",
            -- enabled this source at the beginning to make it possible to pre-cache
            -- at very beginning
            enabled = true,
            -- only show this source when filetype is gitcommit or markdown
            should_show_items = function()
              return vim.o.filetype == "gitcommit" or vim.o.filetype == "markdown"
            end,
            --- @module 'blink-cmp-git'
            --- @type blink-cmp-git.Options
            opts = {
              commit = {
                -- You may want to customize when it should be enabled
                -- The default will enable this when `cwd` is in a git repository
                -- enable = function() end
                -- You may want to change the triggers
                -- triggers = { ':' },
              },
              git_centers = {
                git_hub = {
                  -- Those below have the same fields with `commit`
                  -- issues = {
                  -- },
                  -- pull_request = {
                  -- },
                  -- mention = {
                  -- }
                },
              },
            },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
