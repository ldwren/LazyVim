require("config.LDW.textsize")
require("config.LDW.keymaps")

-- Change start directoru
-- $env:NVIM_START_DIR="C:\Projects\myapp"

--
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local dir = vim.env.NVIM_START_DIR
    if dir and vim.fn.isdirectory(dir) == 1 then
      vim.cmd.cd(dir)
    end
  end,
})
