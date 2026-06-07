return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    },
    config = function()
        require("telescope").setup({
            defaults = {
                path_display = {"filename_first"},
            },
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>fd", function()
            builtin.find_files({
                find_command = { "fd", "--type", "d" },
                prompt_title = "Find Directories",
                path_display = { "truncate" },
            })
        end, { desc = "Telescope find directories" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find all keymaps" })
    end,
}
