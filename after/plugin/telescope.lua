local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>ps', builtin.find_files, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })

local telescope_setup = {
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  }
}

require('telescope').setup(telescope_setup)
