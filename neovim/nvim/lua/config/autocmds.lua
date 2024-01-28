-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- -- Add any additional autocmds here
vim.api.nvim_exec([[ autocmd FileType java setlocal expandtab shiftwidth=4 softtabstop=4 ]], false)
vim.api.nvim_exec([[ autocmd BufWritePost *.java :silent !./mvnw compile > /dev/null 2>&1 & ]], false)
