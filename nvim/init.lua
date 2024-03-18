-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_keymap("n", "<Tab>l", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>h", "<cmd>bprevious<CR>", { noremap = true })

-- Key mappings for opening terminals in different directions
vim.api.nvim_set_keymap("n", "<leader>tl", ":vsplit | terminal<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tj", ":split | terminal<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tk", ":above split | terminal<CR>", { noremap = true })

-- Remap dd to _dd to avoid cutting when deleting
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
