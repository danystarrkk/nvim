return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Desarrollo Web
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "tailwindcss-language-server",
        "vtsls",
        "eslint_d",
        "intelephense",

        -- Python y Docker
        "pyright",
        "black",
        "dockerfile-language-server",
        "docker-compose-language-service",

        -- Terminal y Scripts
        "bash-language-server",
        "shellcheck",

        -- Markdown
        "marksman",
        "markdownlint",
        "prettier",
      },
    },
  },
}
