local function db_completion()
  require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
end

local function setup()
  vim.g.db_ui_save_location = vim.fn.stdpath 'config' .. require('plenary.path').path.sep .. 'db_ui'

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'sql',
    },
    command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'sql',
      'mysql',
      'plsql',
    },
    callback = function()
      vim.schedule(db_completion)
    end,
  })
end

local M = {
  -- Database
  { 'kristijanhusak/vim-dadbod-ui' },
  { 'kristijanhusak/vim-dadbod-completion' },
  {
    'tpope/vim-dadbod',
    opt = true,
    requires = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      setup()
    end,
  },
}

return M
