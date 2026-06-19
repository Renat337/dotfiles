local function find_git_repos()
    local cwd = vim.fn.getcwd()
    local repos = {}

    local function scan(dir, depth)
        if depth > 2 then return end
        local handle = vim.loop.fs_scandir(dir)
        if not handle then return end

        while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then break end
            if type == "directory" and name ~= ".git" then
                local child = dir .. "/" .. name
                if vim.loop.fs_stat(child .. "/.git") then
                    local rel = child:sub(#cwd + 2)
                    table.insert(repos, { name = rel, path = child })
                else
                    scan(child, depth + 1)
                end
            end
        end
    end

    -- check if cwd itself is a repo
    if vim.loop.fs_stat(cwd .. "/.git") then
        table.insert(repos, { name = vim.fn.fnamemodify(cwd, ":t"), path = cwd })
    end

    scan(cwd, 1)
    return repos
end

local function get_repo_changed_files(repo_path)
    return vim.fn.systemlist("git -C " .. vim.fn.shellescape(repo_path) .. " status --porcelain")
end

local function open_diffview_in(repo_path)
    pcall(vim.cmd, "DiffviewClose")
    local prev_cwd = vim.fn.getcwd()
    vim.cmd("cd " .. vim.fn.fnameescape(repo_path))
    vim.cmd("DiffviewOpen")
    vim.cmd("cd " .. vim.fn.fnameescape(prev_cwd))
end

local function pick_repo()
    local repos = find_git_repos()

    if #repos == 0 then
        vim.notify("No git repos found under " .. vim.fn.getcwd(), vim.log.levels.WARN)
        return
    end

    if #repos == 1 then
        open_diffview_in(repos[1].path)
        return
    end

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local previewers = require("telescope.previewers")

    pickers.new({}, {
        prompt_title = "Diffview: Select Repo",
        finder = finders.new_table({
            results = repos,
            entry_maker = function(repo)
                local files = get_repo_changed_files(repo.path)
                local display = repo.name
                if #files > 0 then
                    display = display .. "  +" .. #files
                end
                return {
                    value = repo,
                    display = display,
                    ordinal = repo.name,
                    changed_files = files,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        previewer = previewers.new_buffer_previewer({
            title = "Changed Files",
            define_preview = function(self, entry)
                local lines = {}
                for _, line in ipairs(entry.changed_files) do
                    local status = line:sub(1, 2)
                    local filepath = line:sub(4)
                    local name = vim.fn.fnamemodify(filepath, ":t")
                    table.insert(lines, status .. " " .. name .. "  (" .. filepath .. ")")
                end
                if #lines == 0 then
                    lines = { "No changes" }
                end
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
                vim.bo[self.state.bufnr].filetype = "diff"
            end,
        }),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    open_diffview_in(selection.value.path)
                end
            end)
            return true
        end,
    }):find()
end

return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
        { "<leader>do", pick_repo, desc = "Diffview: pick repo" },
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
