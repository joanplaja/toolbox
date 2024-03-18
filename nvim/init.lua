-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_keymap("n", "<Tab>l", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>h", "<cmd>bprevious<CR>", { noremap = true })

-- Key mappings for opening terminals in different directions
vim.api.nvim_set_keymap("n", "<leader>tl", ":vsplit | terminal<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tj", ":split | terminal<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tk", ":above split | terminal<CR>", { noremap = true })

--do not copy on delete
vim.o.clipboard = ""
