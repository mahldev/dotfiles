-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", {})

vim.keymap.set("n", "<leader>ci", [[:set shiftwidth=4 expandtab<CR>]], { noremap = true, silent = true })

-- local nvim_tmux_nav = require("nvim-tmux-navigation")

-- vim.keymap.set("n", "<c-h>", nvim_tmux_nav.nvimtmuxnavigateleft)
-- vim.keymap.set("n", "<c-j>", nvim_tmux_nav.nvimtmuxnavigatedown)
-- vim.keymap.set("n", "<c-k>", nvim_tmux_nav.nvimtmuxnavigateup)
-- vim.keymap.set("n", "<c-l>", nvim_tmux_nav.nvimtmuxnavigateright)
-- vim.keymap.set("n", "<c-\\>", nvim_tmux_nav.nvimtmuxnavigatelastactive)
-- vim.keymap.set("n", "<c-space>", nvim_tmux_nav.nvimtmuxnavigatenext)

----- Harpoon 2 -----
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end, { desc = "Add harpoon mark" })

vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-M-h>", function()
  harpoon:list():select(1)
end)

vim.keymap.set("n", "<C-M-j>", function()
  harpoon:list():select(2)
end)

vim.keymap.set("n", "<C-M-k>", function()
  harpoon:list():select(3)
end)

vim.keymap.set("n", "<C-M-l>", function()
  harpoon:list():select(4)
end)

-- Disable key mappings in insert mode
vim.api.nvim_set_keymap("i", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Nop>", { noremap = true, silent = true })

-- Disable key mappings in normal mode
vim.api.nvim_set_keymap("n", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<Nop>", { noremap = true, silent = true })

-- Disable key mappings in visual block mode
vim.api.nvim_set_keymap("x", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", "<Nop>", { noremap = true, silent = true })

vim.opt.scrolloff = 8

vim.opt.updatetime = 144

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<A-o>", "i<CR><ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-i>", "i<Space><ESC>", { noremap = true, silent = true })
