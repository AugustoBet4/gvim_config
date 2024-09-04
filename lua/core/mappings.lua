-- Set leader to space for easier reach
vim.g.mapleader = ' '

-- Tree toogle
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- Needed for nviim 0.8+
vim.keymap.set('n', '-', vim.cmd.Ex)

-- " Shift arrows to select
vim.keymap.set('i', '<S-Down>', '<ESC>lvj')
vim.keymap.set('v', '<S-Down>', 'j')
vim.keymap.set('n', '<S-Down>', 'vj')

vim.keymap.set('i', '<S-Up>', '<ESC>vk')
vim.keymap.set('v', '<S-Up>', 'k')
vim.keymap.set('n', '<S-Up>', 'vk')

vim.keymap.set('i', '<S-Right>', '<ESC>vl')
vim.keymap.set('v', '<S-Right>', 'l')
vim.keymap.set('n', '<S-Right>', 'vl')

vim.keymap.set('i', '<S-Left>', '<ESC>vh')
vim.keymap.set('v', '<S-Left>', 'h')
vim.keymap.set('n', '<S-Left>', 'vh')

vim.keymap.set('n', '<leader>a', 'ggVG', { desc = "Select the whole file" })
