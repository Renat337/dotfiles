return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        sections = {
            lualine_c = {
                function ()
                   local oil = package.loaded["oil"] 
                   if oil and oil.get_current_dir() then
                       return oil.get_current_dir()
                   end
                   return vim.fn.expand("%:.")
                end,
            },
        },
    },
}
