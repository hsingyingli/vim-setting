lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "fish",
    "json",
    "html",
    "scss",
    "python",
    "cpp",
    "c",
    "markdown",
  },
}

EOF
