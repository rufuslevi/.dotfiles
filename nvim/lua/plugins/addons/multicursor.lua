return {
  "jake-stewart/multicursor.nvim",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    -- use MultiCursorCursor and MultiCursorVisual to customize
    -- additional cursors appearance
    vim.cmd.hi("link", "MultiCursorCursor", "Cursor")
    vim.cmd.hi("link", "MultiCursorVisual", "Visual")

    vim.keymap.set("n", "<esc>", function()
      if mc.hasCursors() then
        mc.clearCursors()
      else
        -- default <esc> handler
      end
    end)

    -- add cursors above/below the main cursor
    vim.keymap.set("n", "<leader>mu", function()
      mc.addCursor("k")
    end, { desc = "Add cursor up" })
    vim.keymap.set("n", "<leader>md", function()
      mc.addCursor("j")
    end, { desc = "Add cursor down" })

    -- add a cursor and jump to the next word under cursor
    vim.keymap.set("n", "<leader>mw", function()
      mc.addCursor("*")
    end)

    -- jump to the next word under cursor but do not add a cursor
    vim.keymap.set("n", "<leader>ms", function()
      mc.skipCursor("*")
    end)

    -- rotate the main cursor
    vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
    vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

    -- delete the main cursor
    vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

    -- add and remove cursors with control + left click
    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
  end,
}
