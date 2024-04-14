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

-- Searching and replace
-- Define a Lua function to copy the current relative path to the clipboard
local function copy_relative_path_to_clipboard()
  -- Get the relative path of the current file
  local relative_path = vim.fn.expand("%:p")
  -- Copy the relative path to the clipboard
  vim.fn.setreg("+", relative_path)
  -- Display a message indicating that the path has been copied
  print("Relative path copied to clipboard: " .. relative_path)
end
-- Expose the function globally so it can be accessed by the key mapping
_G.copy_relative_path_to_clipboard = copy_relative_path_to_clipboard
-- Map a key combination to the function
vim.api.nvim_set_keymap(
  "n",
  "<leader>cp",
  ":lua copy_relative_path_to_clipboard()<CR>",
  { noremap = true, silent = true }
)

-- Toggle Spectre
vim.api.nvim_set_keymap(
  "n",
  "<leader>S",
  "<cmd>lua require('spectre').toggle()<CR>",
  { noremap = true, desc = "Toggle Spectre" }
)

-- Search current word (normal mode)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sw",
  "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
  { noremap = true, desc = "Search current word" }
)

-- Search current word (visual mode)
vim.api.nvim_set_keymap(
  "v",
  "<leader>sw",
  "<esc><cmd>lua require('spectre').open_visual()<CR>",
  { noremap = true, desc = "Search current word" }
)

-- Search on current file
vim.api.nvim_set_keymap(
  "n",
  "<leader>sp",
  "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
  { noremap = true, desc = "Search on current file" }
)
