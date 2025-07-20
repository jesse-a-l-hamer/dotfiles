vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
    end

    map("<leader>lrs", ":IncRename ", "[s]ymbol", { "n", "x" })
    map("<leader>la", vim.lsp.buf.code_action, "code [a]ction", { "n", "x" })

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

-- diagnostics configuration

-- Change diagnostic symbols in the sign column (gutter)
local diagnostic_signs = {}
if vim.g.have_nerd_font then
  local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
  for type, icon in pairs(signs) do
    diagnostic_signs[vim.diagnostic.severity[type]] = icon
  end
  vim.diagnostic.config { signs = { text = diagnostic_signs } }
end

vim.diagnostic.config {
  virtual_text = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = { text = diagnostic_signs }
}

-- configure custom capabilities for all LSPs
---@type table<string, lsp.ClientCapabilities>
local custom_capabilities = {}

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(custom_capabilities, true),
})

-- enable lsps
for _, lsp_config_file in ipairs(vim.api.nvim_get_runtime_file("after/lsp/*.lua", true)) do
  local lsp_name = vim.fs.basename(lsp_config_file):sub(1, -(#".lua" + 1))
  vim.lsp.enable(lsp_name)
end

-- enable markview-rendered hover

-- per-LSP hover overrides
---@type table<string, hover.opts>
local custom_hover_opts = {
  default = {
    border_hl = "BlinkCmpDocBorder",
  },
  ["^basedpyright"] = { name = " BasedPyright" },
  ["^bashls"] = { name = "󱆃 BashLS" },
  ["^beancount"] = { name = " BeancountLS" },
  ["^jinja_lsp"] = { name = " JinjaLSP" },
  ["^lua_ls"] = { name = " LuaLS" },
  ["^markdown_oxide"] = { name = "  MarkdownOxide" },
  ["^marksman"] = { name = "  Marksman" },
  ["^pylsp"] = { name = " PyLSP" },
  ["^ruff"] = { name = " Ruff" },
  ["^taplo"] = { name = " Taplo" },
  ["^texlab"] = { name = " Lab" },
  ["^tinymist"] = { name = "󰙩 Tinymist" },
  ["^vale_ls"] = { name = " ValeLS" },
  ["^yamlls"] = { name = "YamlLS" },
}

require("util.lsp_hover").setup(custom_hover_opts)
