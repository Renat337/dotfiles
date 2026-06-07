return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle file tree" },
        { "<leader>EE", "<CMD>NvimTreeFindFile<CR>", desc = "Show file in tree" },
        { "<leader>EC", "<CMD>NvimTreeCollapse<CR>", desc = "Collapse tree" },
    },
    opts = {
        view = {
            side = "right",
        },
        filters = {
            dotfiles = false,
        },
        renderer = {
            root_folder_label = ":t",
        },
    },
}
