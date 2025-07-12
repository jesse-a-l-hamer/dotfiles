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

-- Change diagnostic symbols in the sign column (gutter)
if vim.g.have_nerd_font then
  local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
  local diagnostic_signs = {}
  for type, icon in pairs(signs) do
    diagnostic_signs[vim.diagnostic.severity[type]] = icon
  end
  vim.diagnostic.config { signs = { text = diagnostic_signs } }
end

-- configure custom capabilities for all LSPs
local capabilities = {}

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
})

-- enable lsps
for _, lsp_config_file in ipairs(vim.api.nvim_get_runtime_file("after/lsp/*.lua", true)) do
  local lsp_name = vim.fs.basename(lsp_config_file):sub(1, -(#".lua" + 1))
  vim.lsp.enable(lsp_name)
end
