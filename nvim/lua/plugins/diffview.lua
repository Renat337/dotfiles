return {
    "sindrets/diffview.nvim",
    keys = {
        { "<leader>do", "<CMD>DiffviewOpen<CR>", desc = "DiffviewOpen" },
        { "<leader>dc", "<CMD>DiffviewClose<CR>", desc = "DiffviewClose" },
    },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    opts = {
        keymaps = {
            view = {
                ["<leader>e"] = "<CMD>DiffviewToggleFiles<CR>",
                ["<leader>dr"] = "<CMD>DiffviewRefresh<CR>",
            },
            file_panel = {
                ["<leader>e"] = "<CMD>DiffviewToggleFiles<CR>",
                ["<leader>dr"] = "<CMD>DiffviewRefresh<CR>",
            },
        },
    },
}
