local M = {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function(_, opts)
    local neogit = require 'neogit'
    neogit.setup(opts)

    vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>', { desc = 'Open Neogit interface for git' })
  end,
}

return M
