return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup()
        end,
        options = {
            diagnostics = "nvim_lsp",
            offset = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    text_align = 'center',
                    separator = true,
                },
            },
            separator_style = 'padded_slant'
        }
    }
}
