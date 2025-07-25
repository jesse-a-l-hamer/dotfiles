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
    "<leader>c",
    function()
      Snacks.bufdelete()
    end,
    desc = "[c]lose buffer",
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
      local explorer_pickers = Snacks.picker.get { source = "explorer" }
      for _, v in pairs(explorer_pickers) do
        if v:is_focused() then
          v:close()
        else
          v:focus()
        end
      end
      if #explorer_pickers == 0 then
        Snacks.picker.explorer()
      end
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
