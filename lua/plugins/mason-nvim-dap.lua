-- lua/plugins/mason-nvim-dap.lua
return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    ensure_installed = { "python", "rust", "go" }, -- Adiciona Rust e Go
    handlers = {
      python = function(source_name)
        local dap = require "dap"
        dap.adapters.python = {
          type = "executable",
          command = "/usr/bin/python3",
          args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
          },
        }
      end,
      rust = function(source_name)
        local dap = require "dap"
        dap.adapters.lldb = {
          type = "executable",
          command = "/usr/local/bin/codelldb", -- Substitua pelo caminho onde o codelldb está instalado
          name = "lldb",
        }
        dap.configurations.rust = {
          {
            name = "Debug",
            type = "lldb",
            request = "launch",
            program = function()
              return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.expand "%:t", ":r")
              )
            end,
            cwd = "${workspaceFolder}",
            stopAtEntry = false,
          },
        }
      end,
      go = function(source_name)
        local dap = require "dap"
        dap.adapters.go = {
          type = "server",
          port = 12345,
          executable = {
            command = "dlv",
            args = { "dap" },
          },
        }
        dap.configurations.go = {
          {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}",
          },
        }
      end,
    },
  },
}
