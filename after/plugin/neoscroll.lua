neoscroll = require('neoscroll')

neoscroll.setup({ mappings = {'<C-u>', '<C-d>'} })

local keymap = {
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 80 }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 80 }) end;
}

local modes = {'n', 'v', 'x'}

for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end




