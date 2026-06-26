return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gs = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map("n", "]h", function() gs.nav_hunk("next", { target = "all" }) end, { desc = "Next git hunk" })
            map("n", "[h", function() gs.nav_hunk("prev", { target = "all" }) end, { desc = "Previous git hunk" })
            map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Git blame line" })
            map("n", "<leader>ga", gs.stage_hunk, { desc = "Git add/stage hunk" })
            map("n", "<leader>gr", gs.reset_hunk, { desc = "Git reset hunk" })
            map("n", "<leader>gp", gs.preview_hunk, { desc = "Git preview hunk" })
            map("n", "<leader>gd", gs.diffthis, { desc = "Git diff this file" })
        end,
    },
}
