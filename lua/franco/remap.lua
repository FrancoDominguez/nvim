print("starting remap.lua")
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<C-q>", vim.cmd.Ex)

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>done', ':wqa<CR>')

vim.keymap.set('n', '<M-h>', '<C-w>h', opts)
vim.keymap.set('n', '<M-j>', '<C-w>j', opts)
vim.keymap.set('n', '<M-k>', '<C-w>k', opts)
vim.keymap.set('n', '<M-l>', '<C-w>l', opts)


