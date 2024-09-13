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

--  Commenting (Requires Plugin)
vim.keymap.set('n', '<C-/>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>', {})
vim.keymap.set('x', '<C-/>',
    '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>', {})


--  Non Vim Keymapings
vim.keymap.set("n", "<C-s>", ":w <CR>", { silent = true }) --  Vainilla Save
vim.keymap.set("i", "<C-s>", "<ESC> :w <CR> i", {})        -- Save (Insert Mode)
vim.keymap.set('n', '<C-q>', ':bd <CR>', {})               --Quit

-- Select all in buffer
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "Select the whole file" })
