vim.keymap.set("", "<Space>", "<Nop>", { silent = true, noremap = true })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })
vim.keymap.set("n", "q", "<Nop>", { silent = true, desc = "Nvim: Disable Q" })
vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Open Quickfix list" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open Diagnostic Float Window" })

vim.keymap.set("n", "<leader>w", ":write<CR>", { silent = true, desc = "Nvim: Save" })
vim.keymap.set("n", "<leader>q", ":quitall<CR>", { silent = true, desc = "Nvim: Quit" })

vim.keymap.set("n", "<leader>bx", ":BufferClose<CR>", { silent = true, desc = "Buffer: Close" })
vim.keymap.set("n", "<leader>bn", ":BufferNext<CR>", { silent = true, desc = "Buffer: Next" })
vim.keymap.set("n", "<leader>bp", ":BufferPrevious<CR>", { silent = true, desc = "Buffer: Previous" })

vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Window: Increase horizontal", silent = true })
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Window: Descrease horizontal", silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Window: Descrease vertical", silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Window: Increase vertical", silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window: Move focus to the left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window: Move focus to the bottom" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window: Move focus to the top" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window: Move focus to the right" })

vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Cursor: Move to line start" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Cursor: Move to line end" })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("v", ">", ">gv", { desc = "Text: Move right" })
vim.keymap.set("v", "<", "<gv", { desc = "Text: Move left" })
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")
