local GOLDEN_RATIO = 1.618

local function on_win_enter()
  -- for current_callback_index = 1, #ignore_callbacks do
  --   local callback = ignore_callbacks[current_callback_index][1]
  --   local callback_args = ignore_callbacks[current_callback_index][2]

  --   if callback(callback_args) == 1 then
  --     return
  --   end
  -- end

  local columns = vim.api.nvim_get_option 'columns'
  local rows = vim.api.nvim_get_option 'lines'
  local current_height = vim.api.nvim_win_get_height(0)
  local current_width = vim.api.nvim_win_get_width(0)
  local golden_width = math.floor(columns / GOLDEN_RATIO)

  if current_width < golden_width then
    vim.api.nvim_win_set_width(0, golden_width)
  end

  local golden_height = math.floor(rows / GOLDEN_RATIO)

  if current_height < golden_height then
    vim.api.nvim_win_set_height(0, golden_height)
  end
end

vim.api.nvim_create_autocmd({ 'WinEnter' }, {
  pattern = { '*.*', 'term://*', 'Makefile', 'Dockerfile' },
  callback = on_win_enter,
})
