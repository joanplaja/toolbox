-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_keymap("n", "<Tab>l", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>h", "<cmd>bprevious<CR>", { noremap = true })
