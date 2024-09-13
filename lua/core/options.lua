-- Global options for nvim
local options = {
    backup = false,
    clipboard = 'unnamedplus',
    completeopt = { 'menuone', 'noselect' },
    conceallevel = 0,
    fileencoding = 'utf-8',
    hlsearch = true,
    ignorecase = true,
    mouse = 'a',
    pumheight = 10,
    showmode = false,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 300,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = 'yes',
    wrap = true,
    scrolloff = 8,
    sidescroll = 8,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
