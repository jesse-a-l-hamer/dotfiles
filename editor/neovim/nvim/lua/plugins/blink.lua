-- Use this function to check if the cursor is inside a comment block
local function inside_comment_block()
  if vim.api.nvim_get_mode().mode ~= "i" then
    return false
  end
  local node_under_cursor = vim.treesitter.get_node()
  local parser = vim.treesitter.get_parser(nil, nil, { error = false })
  local query = vim.treesitter.query.get(vim.bo.filetype, "highlights")
  if not parser or not node_under_cursor or not query then
    return false
  end
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1
  for id, node, _ in query:iter_captures(node_under_cursor, 0, row, row + 1) do
    if query.captures[id]:find "comment" then
      local start_row, start_col, end_row, end_col = node:range()
      if start_row <= row and row <= end_row then
        if start_row == row and end_row == row then
          if start_col <= col and col <= end_col then
            return true
          end
        elseif start_row == row then
          if start_col <= col then
            return true
          end
        elseif end_row == row then
          if col <= end_col then
            return true
          end
        else
          return true
        end
      end
    end
  end
  return false
end

local default_sources = function()
  -- put those which will be shown always
  local result = {
    "lazydev",
    "lsp",
    "path",
    "snippets",
    "git",
    "buffer",
    "emoji",
    "cmdline",
    "omni",
  }
  if
    -- turn on dictionary in markdown or text file
    vim.tbl_contains({ "markdown", "typst", "latex", "text" }, vim.bo.filetype)
    -- or turn on dictionary if cursor is in the comment block
    or inside_comment_block()
  then
    table.insert(result, "dictionary")
  end
  return result
end

return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
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
      "xzbdmw/colorful-menu.nvim",
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
          draw = {
            columns = {
              { "kind_icon" },
              { "label", gap = 1 },
              { "source_name" },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
            treesitter = { "lsp" },
          },
        },
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = {
          window = {
            border = "rounded",
          },
          auto_show = true,
        },
        ghost_text = { enabled = true, show_with_selection = true },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        -- dynamically pick providers by treesitter node/filetype
        default = default_sources(),
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
            opts = {
              insert = true, -- Insert emoji (default) or complete its name
              ---@type string|table|fun():table
              trigger = function()
                return { ":" }
              end,
            },
            should_show_items = function()
              return vim.tbl_contains(
                -- Enable emoji completion only for git commits and markdown.
                -- By default, enabled for all file-types.
                { "gitcommit", "markdown" },
                vim.o.filetype
              )
            end,
          },
          dictionary = {
            module = "blink-cmp-dictionary",
            name = "Dict",
            min_keyword_length = 3,
            max_items = 20,
            opts = {
              ---@module 'blink-cmp-dictionary'
              ---@type blink-cmp-dictionary.Options

              dictionary_files = { "/usr/share/dict/words" },
            },
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
