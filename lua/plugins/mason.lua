-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  -- Themes
  { "Mofiqul/vscode.nvim" },
  { "navarasu/onedark.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- Dap nvim
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        "rust",
        "go",
      },
    },
    config = function() require "mason-nvim-dap" end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    dependencies = "nvim-dap",
    config = function(_, opts) require("dap-go").setup() end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
  },
}
