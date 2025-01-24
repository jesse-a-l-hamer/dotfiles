---@module 'snacks'
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    keys = {
      {
        "<leader>ft",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "[t]odo",
      },
      {
        "<leader>fT",
        function()
          Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } }
        end,
        desc = "[T]odo/Fix/Fixme",
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
