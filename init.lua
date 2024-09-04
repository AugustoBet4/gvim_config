-- Requires core files
require("core.lazy")
require("core.mappings")

---------------------
--- Nvim-tree
--- -----------------

-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

--Colorscheme catppuccin-mocha
vim.cmd.colorscheme "catppuccin-mocha"
