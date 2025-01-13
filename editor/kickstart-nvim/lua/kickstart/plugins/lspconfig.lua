-- LSP Plugins
return {
  { "Bilal2453/luvit-meta", lazy = true },
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "sahgen/blink.cmp",
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0, -- required for catppuccin compatibility
            },
          },
        },
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
          end

          map("gld", require("telescope.builtin").lsp_definitions, "[d]efinition")
          map("<leader>sr", require("telescope.builtin").lsp_references, "[r]eferences")
          map("gli", require("telescope.builtin").lsp_implementations, "[i]mplementation")
          map("glt", require("telescope.builtin").lsp_type_definitions, "[t]ype")
          map("<leader>sD", require("telescope.builtin").lsp_document_symbols, "[D]ocument symbols")
          map("<leader>sW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace symbols")
          map("<leader>lr", ":IncRename ", "[r]ename")
          map("<leader>la", vim.lsp.buf.code_action, "code [a]ction", { "n", "x" })
          map("glD", vim.lsp.buf.declaration, "[D]eclaration")
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
              end,
            })
          end
        end,
      })

      -- Change diagnostic symbols in the sign column (gutter)
      if vim.g.have_nerd_font then
        local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
        local diagnostic_signs = {}
        for type, icon in pairs(signs) do
          diagnostic_signs[vim.diagnostic.severity[type]] = icon
        end
        vim.diagnostic.config { signs = { text = diagnostic_signs } }
      end

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Enable the following language servers
      -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportAny = false,
                  reportMissingTypeStubs = "information",
                },
              },
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
          },
        },
        ruff = {
          trace = "messages",
          init_options = {
            settings = {
              logLevel = "debug",
              linelength = 88,
              lint = {
                select = {
                  "E", -- pycodestyle
                  "F", -- Pyflakes
                  "UP", -- pyupgrade
                  "B", -- flake8-bugbear
                  "SIM", -- flake8-simplify
                  "I", -- isort
                },
              },
            },
          },
        },
      }

      -- record any LSPs which should not be managed by Mason
      -- (e.g., because they are installed elsewhere on the system)
      local non_mason_lsps = {
        "basedpyright",
        "ruff",
      }

      require("mason").setup {
        ui = {
          border = "rounded",
        },
      }

      -- Ensure the servers and tools above are installed
      local ensure_installed = vim.tbl_filter(function(value)
        return not vim.list_contains(non_mason_lsps, value)
      end, vim.tbl_keys(servers or {}))

      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
      })
      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      require("mason-lspconfig").setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            -- server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
