-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Dismiss active search HL" })

-- Easy write/quit shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", { desc = "Write all buffers" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit Neovim" })

-- Easier terminal mode escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Show diagnostics under cursor
vim.keymap.set("n", "<leader>ld", function()
  vim.diagnostic.open_float { scope = "cursor" }
end, { desc = "Show diagnostics at cursor" })
vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Show diagnostics in line" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

-- Keybinds to make window resizing easier.
vim.keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
