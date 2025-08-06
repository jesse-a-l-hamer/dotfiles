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
    "references",
    "ecolog",
    "sshconfig",
    "fonts",
    "dap",
  }
  local success, node = pcall(vim.treesitter.get_node)
  if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
    return { "buffer", "dictionary", "emoji" }
  end
  return result
end

vim.g.lsp_client_info = {
  ["^basedpyright"] = { name = "  BasedPyright" },
  ["^bashls"] = { name = "󱆃 BashLS" },
  ["^beancount"] = { name = "  BeancountLS" },
  ["^jinja_lsp"] = { name = "  JinjaLSP" },
  ["^lua_ls"] = { name = "  LuaLS" },
  ["^markdown_oxide"] = { name = "  MarkdownOxide" },
  ["^marksman"] = { name = "  Marksman" },
  ["^pylsp"] = { name = "  PyLSP" },
  ["^ruff"] = { name = "  Ruff" },
  ["^taplo"] = { name = "  Taplo" },
  ["^texlab"] = { name = "  Lab" },
  ["^tinymist"] = { name = " Tinymist" },
  ["^vale_ls"] = { name = "  ValeLS" },
  ["^yamlls"] = { name = " YamlLS" },
}

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
      "archie-judd/blink-cmp-words",
      {
        "Kaiser-Yang/blink-cmp-git",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
      "xzbdmw/colorful-menu.nvim",
      "jmbuhr/cmp-pandoc-references",
      "bydlw98/blink-cmp-sshconfig",
      "amarakon/nvim-cmp-fonts",
      "rcarriga/cmp-dap",
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
      keymap = { preset = "default" },
      appearance = {
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
            treesitter = { "lsp", "dap" },
          },
        },
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
            min_width = 30,
          },
          draw = function(data)
            ---|fS

            ---@type integer
            local buf = data.window.buf
            ---@type integer
            local src_buf = vim.api.nvim_get_current_buf()

            ---@type string[]
            local lines = {}

            if data.item and data.item.documentation then
              lines = vim.split(data.item.documentation.value or "", "\n", { trimempty = true })
            end

            ---@type string[]
            local details = vim.split(data.item.detail or "", "\n", { trimempty = true })

            if #details > 0 then
              table.insert(details, 1, string.format("```%s", vim.bo[src_buf].ft or ""))
              table.insert(details, "```")

              if #lines > 0 then
                details = vim.list_extend(details, {
                  "",
                  "Detail: ",
                  "--------",
                  "",
                })
              end
            end

            local visible_lines = vim.list_extend(details, lines)
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, visible_lines)

            if vim.g.__reg_doc ~= true then
              vim.treesitter.language.register("markdown", "blink-cmp-documentation")
              vim.g.__reg_doc = true
            end

            local footer = nil
            if data.item.source_id == "lsp" then
              footer = {
                { "╼ ", "BlinkCmpDocBorder" },
                { "  LSP/Docs", "BlinkCmpDocBorder" },
                { " ╾", "BlinkCmpDocBorder" },
              }
              local lsp_client_info = vim.g.lsp_client_info
              for k, v in pairs(lsp_client_info) do
                if string.match(data.item.client_name, k) then
                  footer[2][1] = v.name
                end
              end
            end

            if package.loaded["markview"] then
              local win = data.window:get_win()

              if win then
                vim.wo[win].conceallevel = 3
                if footer then
                  vim.api.nvim_win_set_config(
                    win,
                    vim.tbl_deep_extend("force", vim.api.nvim_win_get_config(win), {
                      footer = footer,
                      footer_pos = "right",

                    })
                  )
                end
                vim.bo[buf].ft = "markdown"
                require("markview").render(buf, { enable = true, hybrid_mode = false })
                vim.bo[buf].ft = "blink-cmp-documentation"
              end

              vim.defer_fn(function()
                win = data.window:get_win()

                if win then
                  vim.wo[win].signcolumn = "no"
                  vim.wo[win].conceallevel = 3
                  if footer then
                    vim.api.nvim_win_set_config(
                      win,
                      vim.tbl_deep_extend("force", vim.api.nvim_win_get_config(win), {
                        footer = footer,
                        footer_pos = "right",
                      })
                    )
                  end
                end

                vim.bo[buf].ft = "markdown"
                require("markview").render(buf, { enable = true, hybrid_mode = false })
                vim.bo[buf].ft = "blink-cmp-documentation"
              end, 25)
            end

            ---|fE
          end,
        },
        ghost_text = { enabled = true, show_with_selection = true },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      -- NOTE: custom docs drawing for signature help not yet supported (2025-07-23)
      signature = {
        enabled = true,
        window = {
          border = "rounded",
          show_documentation = true,
        },
      },
      cmdline = {
        enabled = true,
        keymap = { preset = "inherit" },
      },
      sources = {
        -- dynamically pick providers by treesitter node/filetype
        default = default_sources,
        per_filetype = {
          markdown = {
            inherit_defaults = true,
            "dictionary",
            "thesaurus",
          },
          typst = {
            inherit_defaults = true,
            "dictionary",
            "thesaurus",
          },
          latex = {
            inherit_defaults = true,
            "dictionary",
            "thesaurus",
          },
          text = {
            inherit_defaults = true,
            "dictionary",
            "thesaurus",
          },
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
            module = "blink-cmp-words.dictionary",
            name = "Dictionary",
            max_items = 10,
            opts = {
              score_offset = 0,
            },
          },
          thesaurus = {
            module = "blink-cmp-words.thesaurus",
            name = "Thesaurus",
            max_items = 5,
            opts = {
              score_offset = 0,
            },
          },
          git = {
            score_offset = 100,
            module = "blink-cmp-git",
            name = "Git",
            enabled = true,
            should_show_items = function()
              return vim.o.filetype == "gitcommit" or vim.o.filetype == "markdown"
            end,
            --- @module 'blink-cmp-git'
            --- @type blink-cmp-git.Options
            opts = {},
          },
          references = {
            name = "References",
            module = "cmp-pandoc-references.blink",
          },
          ecolog = {
            name = "ecolog",
            module = "ecolog.integrations.cmp.blink_cmp",
          },
          sshconfig = {
            name = "SshConfig",
            module = "blink-cmp-sshconfig",
          },
          fonts = {
            name = "fonts",
            module = "blink.compat.source",
            score_offset = -3,
            enabled = function()
              return vim.o.filetype == "conf" or vim.o.filetype == "config"
            end,
            opts = {
              cmp_name = "Fonts",
            },
          },
          dap = {
            name = "dap",
            module = "blink.compat.source",
            enabled = function()
              return (vim.bo.buftype ~= "prompt" or require("cmp_dap").is_dap_buffer())
                and (vim.tbl_contains({ "dap-repl", "dapui_watches", "dapui_hover" }, vim.o.filetype))
            end,
            opts = {
              cmp_name = "DAP",
            },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
