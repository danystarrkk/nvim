return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup {
      keymaps = {
        accept_suggestion = "<C-l>",
        accept_word = "<A-a>",
        clear_suggestion = "<C-e>",
      },
      ignore_filetypes = { "Avante" },
      color = {
        suggestion_color = "#8b949e",
        cterm = 244,
      },
      disable_inline_completion = false,
      disable_keymaps = false,
    }
  end,
}
