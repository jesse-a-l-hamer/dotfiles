---@module 'snacks.toggle'

-- Toggles for various Vim options
Snacks.toggle.option("background", { off = "light", on = "dark", name = "dark background" }):map "<leader>Tob"
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "conceal" }):map "<leader>Toc"
Snacks.toggle.option("relativenumber", { name = "relative line numbers" }):map "<leader>Ton"
Snacks.toggle.option("spell", { name = "spell checking" }):map "<leader>Tos"
Snacks.toggle.option("wrap", { name = "line wrapping" }):map "<leader>Tow"
