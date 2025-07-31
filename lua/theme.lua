vim.cmd("silent! colorscheme seoul256")

-- Advanced highlight
local hi = {
  -- <Name>, <cterm>
  ['Comment'] = {italic = true},
  ['Constant'] = {bold = true},
  ['Type'] = {underline = true},
  ['Special'] = {underline = true},
  ['SpecialChar'] = {underline = true},
}

for name, opt in ipairs(hi) do
  vim.api.nvim_set_hl(0, name, opt)
end
