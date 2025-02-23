vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local set = vim.opt

set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.splitbelow = true
set.splitright = true
set.wrap = false

-- Needs to be loaded before requiring plugins (e.g., for keymaps)
require("config.lazy")

-- Keymaps
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader><leader>i", "<cmd>source ~/.config/nvim/init.lua <CR>", { desc = "Source nvim/init.lua" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute visual selection" })
vim.keymap.set("n", "<C-j>", "<C-]>", { desc = "Jump to definition (follow tag)" })
vim.keymap.set("n", "<leader>w", "<C-w>")

-- Buffers
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Buffer delete" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer previous" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Buffer next" })

-- oil
vim.keymap.set("n", "<leader>o", function()
  vim.cmd("leftabove vsplit")
  -- vim.cmd("vertical resize 40")
  require("oil").open()
end, { desc = "Open oil in current dir" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "Telescope fuzzy search in current buffer" })
vim.keymap.set("n", "<leader>en", function()
  builtin.find_files {
    cwd = vim.fn.stdpath("config")
  }
end, { desc = "Telescope edit nvim" })

-- lsp
-- (respects .editorconfig)
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Go to reference" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format file" })

-- which-key
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer local keymaps (which-key)" })

-- iron
vim.keymap.set("n", "<leader>if", ":IronFocus<CR>", { desc = "Iron focus" })
vim.keymap.set("n", "<leader>it", ":IronRepl<CR>", { desc = "Iron togge" })
-- vim.keymap.set("n", "<C-CR>", require("iron.core").send_line, { desc = "Iron send line" })

-- repler
vim.keymap.set("n", "<C-CR>", require("repler").core.repler_send_line, { desc = "Repler send line" })
vim.keymap.set("v", "<C-CR>", require("repler").core.repler_send_visual, { desc = "Repler send visual" })
vim.keymap.set({"n", "t"}, "<leader>r", require("repler").core.toggle_repler, { desc = "Repler toggle" })
vim.keymap.set({"n", "t"}, "<leader>rr", function()
    require("repler").core.toggle_repler({ repl = "radian" })
end, { desc = "Repler toggle radian" })

-- vim.opt.runtimepath:append("~/github/yolo.nvim")
-- require("yolo").setup()

-- :help TermOpen
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)   -- 0 for current window

  job_id = vim.bo.channel
end)

-- can also be set via opts table
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "oil",
--   callback = function()
--     vim.opt_local.number = false
--     vim.opt_local.relativenumber = false
--   end,
-- })
