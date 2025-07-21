return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "VimEnter" },
    config = function()
      local todo_comments = require "todo-comments"

      vim.keymap.set("n", "]t", function()
        todo_comments.jump_next()
      end, { desc = "Next todo comment" })

      vim.keymap.set("n", "[t", function()
        todo_comments.jump_prev()
      end, { desc = "Previous todo comment" })

      -- TODO: other stuff
      local todo_opts = {}
      todo_comments.setup(todo_opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
