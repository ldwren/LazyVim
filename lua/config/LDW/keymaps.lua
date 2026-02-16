vim.keymap.set("n", "<leader>wd", ":lua Snacks.Dashboard()<cr>", { desc = "Welcome Dashboard" })

vim.keymap.set("n", "<leader>@", ":lua print(vim.fn.getcwd())<cr>", { desc = "Print Root Folder" })

-- {{{ Buffers
vim.keymap.set("n", "<F4>", ":Telescope buffers<CR>", { desc = "Buffer explorer" })
vim.keymap.set("n", "<M-Right>", ":bn!<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<M-Left>", ":bp!<CR>", { desc = "Previous buffer" })
-- }}}

-- {{{ Search
vim.keymap.set("n", "<F3>", "n", { desc = "Find next" })
vim.keymap.set("n", "<C-F3>", "/", { desc = "Find current word" })
vim.keymap.set("n", "<C-M-F3>", ":v//d<CR>", { desc = "Remove all lines not containing current word" })
-- }}}

-- {{{ Copy/Paste
vim.keymap.set("n", "<C-A>", "ggVG", { desc = "Select All" })
vim.keymap.set("v", "<C-C>", '"+y', { desc = "Copy" })
vim.keymap.set("n", "<C-V>", '"+P', { desc = "Paste" })
vim.keymap.set("i", "<C-V>", '"+P', { desc = "Paste" })
-- }}}

-- {{{ File write
vim.keymap.set("n", "<F9>", ":w<CR>", { desc = "Write current file" })
vim.keymap.set("i", "<F9>", ":w<CR>", { desc = "Write current file" })

vim.keymap.set("n", "<M-F9>", "ggzM:w<CR>:bd<CR>gg", { desc = "Collapse folds, write, close buffer" })
vim.keymap.set("i", "<M-F9>", "ggzM:w<CR>:bd<CR>gg", { desc = "Collapse folds, write, close buffer" })

vim.keymap.set("n", "<C-F9>", ":wall<CR>", { desc = "Write all files" })
vim.keymap.set("i", "<C-F9>", ":wall<CR>", { desc = "Write all files" })
-- }}}

-- {{{ Open explorer
-- Determine OS in Lua (cross-platform)
local function get_os()
  -- jit.os returns "Windows", "Linux", or "OSX"
  return jit.os
end

-- Open folder of current file
vim.keymap.set("n", "<leader>we", function()
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    print("No file open!")
    return
  end
  print(dir)
  local osname = get_os()
  local cmd
  if osname == "Windows" then
    cmd = string.format('cmd /c start "" "%s"', dir)
  elseif osname == "OSX" then
    cmd = 'open "' .. dir .. '"'
  else
    cmd = 'xdg-open "' .. dir .. '"'
  end

  vim.fn.system(cmd)
end, { desc = "Open file folder in system file manager" })

-- Open folder and select file
vim.keymap.set("n", "<leader>wE", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    print("No file open!")
    return
  end

  local osname = get_os()
  local cmd
  if osname == "Windows" then
    file = file:gsub("/", "\\")
    cmd = string.format('explorer /select,"%s"', file)
  elseif osname == "OSX" then
    cmd = 'open -R "' .. file .. '"'
  else
    local dir = vim.fn.expand("%:p:h")
    cmd = 'xdg-open "' .. dir .. '"'
  end

  vim.fn.system(cmd)
end, { desc = "Open file folder and select current file" })

-- }}}

-- {{{ Folding
vim.o.foldmethod = "marker"
vim.o.foldmarker = "{{{,}}}" -- Default markers

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" }, -- python buffers only
  callback = function()
    print("Python file")
    vim.opt_local.foldmethod = "marker"
    vim.opt_local.foldmarker = "#region,#endregion" -- Python-style markers
  end,
})

--map  <F7>     zo
--imap <F7>   zo
--map  <F8>     z
--imap <F8>   zc
--map  <C-F7>   zR
--imap <C-F7> zR
--map  <C-F8>   zM
--imap <C-F8> zM
-- }}}
