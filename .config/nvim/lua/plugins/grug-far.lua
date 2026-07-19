return {
  "MagicDuck/grug-far.nvim",
  opts = { windowCreationCommand = "botright 50vsplit" },
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    {
      "<leader>sr",
      mode = { "n", "x" },
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          -- delete buffer on close
          transient = true,
          -- Only search matching file endings
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
          -- SR in selection if selection
          visualSelectionUsage = "auto-detect",
        })
      end,
      desc = "Search and Replace",
    },
  },
}
