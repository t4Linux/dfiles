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

