-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "go",
      "rust",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "kotlin",
      "prisma",
    },
  },
}
