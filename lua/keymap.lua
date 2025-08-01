local setmapn = function(src, macro)
  vim.api.nvim_set_keymap('n', src, macro, {noremap=true,silent=true})
end

-- fzf
setmapn('<Space>b', ':Lines<CR>')
setmapn('<Space>f', ':Files<CR>')

-- Window switching
setmapn('<Space>h', '<C-W>h<CR>')
setmapn('<Space>j', '<C-W>j<CR>')
setmapn('<Space>k', '<C-W>k<CR>')
setmapn('<Space>l', '<C-W>l<CR>')

-- Tab switching
setmapn('<TAB>', ':tabn<CR>')
setmapn('<S-TAB>', ':tabp<CR>')

-- Tool windows
setmapn('<Space>z', ':NvimTreeToggle<CR>')
setmapn('z', ':Outline<CR>')
setmapn('T', ':term<CR>')
setmapn('vT', ':vert term<CR>')

-- Escape from teminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {noremap = true})

-- Close window
setmapn('q', ':q<CR>')
