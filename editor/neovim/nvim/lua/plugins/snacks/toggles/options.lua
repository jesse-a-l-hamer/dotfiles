---@module 'snacks.toggle'

-- Toggles for various Vim options
Snacks.toggle.option("background", { off = "light", on = "dark", name = "dark [b]ackground" }):map "<leader>Tob"
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "[c]onceal" }):map "<leader>Toc"
Snacks.toggle.option("relativenumber", { name = "relative line [n]umbers" }):map "<leader>Ton"
Snacks.toggle.option("spell", { name = "[s]pell checking" }):map "<leader>Tos"
Snacks.toggle.option("wrap", { name = "line [w]rapping" }):map "<leader>Tow"
