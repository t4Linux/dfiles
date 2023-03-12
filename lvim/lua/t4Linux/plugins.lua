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
{
  "mrjones2014/nvim-ts-rainbow",
},
  {
  "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
      end,
},
{
  "nvim-treesitter/palyground",
},
}
