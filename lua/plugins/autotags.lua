return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- La estructura nueva que pide el plugin 1.0.0+
    opts = {
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
    },
  },
}
