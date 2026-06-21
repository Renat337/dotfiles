local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
-- vim.keymap.set({"n", "v"}, "<leader>p", '"+p')

vim.keymap.set("n", "<leader>cp", function()
    local oil = package.loaded["oil"]
    local path
    if oil and oil.get_current_dir() then
        path = oil.get_current_dir()
    else
        path = vim.fn.expand("%:p")
    end
    vim.fn.setreg("+", path)
    print(path)
end, { desc = "Copy path to clipboard" })

vim.keymap.set("n", "<leader>cc", function()
    local path = vim.fn.expand("%:p")
    local line = vim.fn.line(".")

    local pkg_name, relative = path:match("/src/([^/]+)/(.*)")
    if not pkg_name then
        print("Could not determine package name")
        return
    end

    local blob = vim.fn.system("git rev-parse HEAD"):gsub("%s+", "")
    local url = "https://code.amazon.com/packages/" .. pkg_name .. "/blobs/" .. blob .. "/--/" .. relative .. "#L" .. line
    vim.fn.setreg("+", url)
    print(url)
end, { desc = "Copy code.amazon.com link" })

vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
