return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install {"lua", "java", "python", "typescript", "bash", "json", "rust", "cpp", "c", "c_sharp"}
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"lua", "java", "python", "typescript", "bash", "json", "rust", "cpp", "c","c_sharp"},
            callback = function() vim.treesitter.start() end,
        })
    end
}
