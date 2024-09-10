local telescope_config = function()
    -- This is your opts table
    require("telescope").setup({
        defaults = {
            layout_strategy = "flex",
            layout_config = {
                flex = {
                    flip_columns = 120,
                },
            },
            file_ignore_patterns = {
                "node_modules",
                "vendor",
                ".git"
            },
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
        },
        pickers = {
            colorscheme = { enable_preview = true },
            find_files = {
                hidden = true
            }

        },
    })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("emoji")

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")

    local builtin = require("telescope.builtin")

    local vks = function(mode, key, action, desc)
        vim.keymap.set(mode, key, action, { noremap = true, desc = desc })
    end

    -- direct commands
    vks("n", "<leader>b", builtin.buffers, "Buffers")
    vks("n", "<leader>r", builtin.grep_string, "References")
    vks("n", "<leader>f", builtin.find_files, "Paths")
    vks("n", "<leader>c", builtin.commands, "Commands")
    -- vks('n', '<leader>sf', builtin.git_files,              'Git files')

    -- search submenu
    vks("n", "<leader>sT", builtin.builtin, "Telescope")

    vks("n", "<leader>sc", builtin.colorscheme, "Colorchemes")
    vks("n", "<leader>sb", builtin.buffers, "Buffers")
    vks("n", "<leader>sg", builtin.live_grep, "Find/grep")
    vks("n", "<leader>sh", builtin.help_tags, "Help")
    vks("n", "<leader>sk", builtin.keymaps, "Key mappings")
end

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but desired:
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        config = telescope_config,
    },
    {
        "gnfisher/nvim-telescope-ctags-plus",
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('ctags_plus')
            vim.keymap.set('n', 'g]', function()
                telescope.extensions.ctags_plus.jump_to_tag()
            end, { desc = 'jump to tag (telescope)', noremap = true, silent = true }
            )
        end
    },
    { "xiyaowong/telescope-emoji.nvim" },
}
