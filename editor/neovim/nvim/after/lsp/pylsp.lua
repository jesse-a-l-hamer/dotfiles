---@brief
---
--- https://github.com/python-lsp/python-lsp-server
---
--- A Python 3.6+ implementation of the Language Server Protocol.
---
--- See the [project's README](https://github.com/python-lsp/python-lsp-server) for installation instructions.
---
--- Configuration options are documented [here](https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md).
--- In order to configure an option, it must be translated to a nested Lua table and included in the `settings` argument to the `config('pylsp', {})` function.
--- For example, in order to set the `pylsp.plugins.pycodestyle.ignore` option:
--- ```lua
--- vim.lsp.config('pylsp', {
---   settings = {
---     pylsp = {
---       plugins = {
---         pycodestyle = {
---           ignore = {'W391'},
---           maxLineLength = 100
---         }
---       }
---     }
---   }
--- })
--- ```
---
--- Note: This is a community fork of `pyls`.
return { ---@type vim.lsp.Config
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {
    plugins = {
      autopep8 = { enabled = false },
      flake8 = { enabled = false },
      jedi_completion = { enabled = false },
      jedi_definition = { enabled = false },
      jedi_hover = { enabled = false },
      jedi_references = { enabled = false },
      jedi_signature_help = { enabled = false },
      jedi_symbols = { enabled = false },
      mccabe = { enabled = false },
      preload = { enabled = false },
      pycodestyle = { enabled = false },
      pydocstyle = { enabled = false },
      pyflakes = { enabled = false },
      pylint = { enabled = false },
      rope_autoimport = {
        enabled = true,
        completions = { enabled = false },
        code_actions = { enabled = true },
      },
      rope_completion = { enabled = false },
      yapf = { enabled = false },
    },
  },
}
