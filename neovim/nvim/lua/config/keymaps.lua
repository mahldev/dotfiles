-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { silent = true })

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
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<C-h>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
  harpoon:list():select(4)
end)

vim.keymap.set("n", "<Tab>", "<C-^>")

-- Disable key mappings in insert mode
vim.keymap.set("i", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- REMAP folke/flash.nvim flashbang
vim.keymap.set("n", "f", "f")
vim.keymap.set("n", "F", "F")
vim.keymap.set("n", "t", "t")
vim.keymap.set("n", "T", "T")
vim.keymap.set("n", ";", "<Nop>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<A-o>", "i<CR><ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-i>", "i<Space><ESC>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>cc", ":!./mvnw compile -q<CR>", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>cc",
  ":!./gradlew build --continuous --quiet &> /dev/null & <CR>",
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
