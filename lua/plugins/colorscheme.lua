return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
    opts = {
      style = "deep",
      transparent = true,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
