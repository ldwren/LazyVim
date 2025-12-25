-- Text size
--
vim.g.neovide_scale_factor = 0.7

vim.keymap.set("n", "<C-kPlus>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
end, { desc = "Neovide zoom in" })

vim.keymap.set("n", "<C-kMinus>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
end, { desc = "Neovide zoom out" })

vim.keymap.set("n", "<C-k0>", function()
  vim.g.neovide_scale_factor = 1.0
end, { desc = "Neovide zoom reset" })

--

vim.keymap.set("n", "<C-ScrollWheelUp>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
end)

vim.keymap.set("n", "<C-ScrollWheelDown>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
end)
