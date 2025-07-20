---@module 'lazy'
---@module 'snacks'
return { ---@type LazyKeysSpec[]
  {
    "<leader>N",
    desc = "Neovim [N]ews",
    function()
      Snacks.win {
        file = "/opt/nvim-linux64/share/nvim/runtime/doc/news.txt",
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      }
    end,
  },
  {
    "<leader>C",
    function()
      Snacks.picker.colorschemes()
    end,
    desc = "[C]olorschemes",
  },
  {
    "<leader>D",
    function()
      Snacks.dashboard(require "plugins.snacks.dashboard")
    end,
    desc = "[D]ashboard",
  },
  {
    "<leader>,",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Find Buffers",
  },
  {
    "<leader>/",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "<leader>:",
    function()
      Snacks.picker.command_history()
    end,
    desc = "Command History",
  },
  {
    "<leader><space>",
    function()
      Snacks.picker.files()
    end,
    desc = "Find Files",
  },
  {
    "<leader>e",
    function()
      Snacks.picker.explorer()
    end,
    desc = "[e]xplorer",
  },
  {
    "<leader>r",
    function()
      Snacks.picker.resume()
    end,
    desc = "[r]esume find/search",
  },
}
