-- Buffers
vim.keymap.set("n", "<F4>", ":Telescope buffers<CR>", { desc = "Buffer explorer" })
vim.keymap.set("n", "<M-Right>", ":bn!<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<M-Left>", ":bp!<CR>", { desc = "Previous buffer" })

-- Search
vim.keymap.set("n", "<F3>", "n", { desc = "Find next" })
vim.keymap.set("n", "<C-F3>", "/", { desc = "Find current word" })
vim.keymap.set("n", "<C-M-F3>", ":v//d<CR>", { desc = "Remove all lines not containing current word" })

-- Copy/Paste
vim.keymap.set("n", "<C-A>", "ggVG", { desc = "Select All" })
vim.keymap.set("v", "<C-C>", '"+y', { desc = "Copy" })
vim.keymap.set("n", "<C-V>", '"+P', { desc = "Paste" })

-- File write
vim.keymap.set("n", "<F9>", ":w<CR>", { desc = "Write current file" })
vim.keymap.set("i", "<F9>", ":w<CR>", { desc = "Write current file" })

vim.keymap.set("n", "<M-F9>", "ggzM:w<CR>:bd<CR>gg", { desc = "Collapse folds, write, close buffer" })
vim.keymap.set("i", "<M-F9>", "ggzM:w<CR>:bd<CR>gg", { desc = "Collapse folds, write, close buffer" })

vim.keymap.set("n", "<C-F9>", ":wall<CR>", { desc = "Write all files" })
vim.keymap.set("i", "<C-F9>", ":wall<CR>", { desc = "Write all files" })
-- vim.keymap.set("n", "", "", {desc]""})
