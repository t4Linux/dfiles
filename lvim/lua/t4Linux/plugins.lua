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
{    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
{
    "f-person/git-blame.nvim",
    event = "VeryLazy"
},
  {
"nvim-treesitter/nvim-treesitter"
  },
  {
"nvim-treesitter/playground"
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
