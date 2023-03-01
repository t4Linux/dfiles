lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"nvim-lua/plenary.nvim"},
  {
  "windwp/nvim-spectre",
  event = "BufRead",
  config = function()
    require("spectre").setup()
  end,
},
  {
  "sindrets/diffview.nvim",
  event = "BufRead",
},
}
lvim.builtin.treesitter.rainbow.enable = true

