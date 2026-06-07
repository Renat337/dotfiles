return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install {"lua", "java", "python", "typescript", "bash", "json", "rust", "cpp", "c"}
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"lua", "java", "python", "typescript", "bash", "json", "rust", "cpp", "c"},
            callback = function() vim.treesitter.start() end,
        })
    end
}
