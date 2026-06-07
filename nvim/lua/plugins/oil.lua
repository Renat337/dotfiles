return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
        },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "See directory" })
    end,
}
