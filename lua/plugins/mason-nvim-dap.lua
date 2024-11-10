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
          command = "/usr/local/bin/codelldb", -- Ajuste conforme necessário
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
          port = "${port}", -- Altere para usar a variável ${port}
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}", "--log" }, -- Habilitar logs
          },
        }
        dap.configurations.go = {
          {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}", -- Ou "${workspaceFolder}/cmd" se necessário
          },
        }
      end,
    },
  },
}
