-- ## THEME
lvim.colorscheme = "lunaperche"
lvim.transparent_window = true

-- ## GENERAL SETTINGs
vim.opt.relativenumber = true
vim.opt.spell = true

-- ## KEYBINDIGS
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- show hidden files when running a find command in telescope
lvim.builtin.telescope.pickers = { find_files = {find_command = { "rg", "--files", "--follow", "--hidden" }}}


-- lvim.plugins = {
-- {
--   "windwp/nvim-spectre",
--   event = "BufRead",
--   config = function()
--     require("spectre").setup()
--   end,
-- },
-- {
--   "kevinhwang91/rnvimr",
--   cmd = "RnvimrToggle",
--   config = function()
--     vim.g.rnvimr_draw_border = 1
--     vim.g.rnvimr_pick_enable = 1
--     vim.g.rnvimr_bw_enable = 1
--   end,
-- },
-- {
--   "p00f/nvim-ts-rainbow",
-- }
-- --   lvim.builtin.telescope.on_config_done = function(telescope)
-- --   pcall(telescope.load_extension, "frecency")
-- --   pcall(telescope.load_extension, "neoclip")
-- --   -- any other extensions loading
-- -- end

-- }
