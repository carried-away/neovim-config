-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>gb", "<cmd> Gitsigns blame_line <cr>", { desc = "Git Blame Line" })
map("n", "<leader>gB", "<cmd> Gitsigns toggle_current_line_blame <cr>", { desc = "Git Toggle Blame Line" })
map("n", "<leader>gf", "<cmd> Gitsigns blame <cr>", { desc = "Git Blame File" })
map("n", "<leader>gd", "<cmd> Gitsigns diffthis <cr>", { desc = "Git Diff This" })
map("n", "<leader>gh", "<cmd> Gitsigns preview_hunk <cr>", { desc = "Git Preview Hunk" })

-- Navigation
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Move Up half a page" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Move Down half a page" })
