-- This is where the keymaps for telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>mp", function()
  builtin.man_pages({ sections = { "ALL" } })
end, { desc = "[M]an [P]ages" })
