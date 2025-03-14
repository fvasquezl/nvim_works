-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>pr", ":PhpactorReferences<CR>", { desc = "Phpactor: Find References" })
vim.keymap.set("n", "<leader>pn", ":PhpactorNavigate<CR>", { desc = "Phpactor: Navigate" })

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
  end,
})
