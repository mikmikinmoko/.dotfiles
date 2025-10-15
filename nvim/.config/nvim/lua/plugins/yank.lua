return {
  "gbprod/yanky.nvim",
  opts = {
    highlight = { timer = 150 },
    ring = { history_length = 100 },
  },
  keys = {
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "GPut after" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "GPut before" },
    { "[y", "<Plug>(YankyPrevious)", desc = "Previous yank" },
    { "]y", "<Plug>(YankyNext)", desc = "Next yank" },
    { "<leader>sy", "<cmd>Telescope yank_history<cr>", desc = "Search yank history" },
  },
}
