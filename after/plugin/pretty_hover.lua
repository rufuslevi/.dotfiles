local hover = require('pretty_hover')

hover.setup()
vim.keymap.set('n', '<leader>ci', hover.hover)
