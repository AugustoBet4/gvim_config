-- Requires core files
require('core.lazy')
require('core.mappings')
require('core.options')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--Colorscheme catppuccin-mocha
vim.cmd.colorscheme 'catppuccin-mocha'
