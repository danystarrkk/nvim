return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {},
  init = function()
    -- Este pequeño truco hace que cualquier plugin de NvChad que pida 
    -- los íconos viejos, reciba automáticamente los nuevos de mini.icons
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
