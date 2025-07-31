vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"

local kset = vim.keymap.set

-- Rename
kset('n', '<Space>r', '<Plug>(coc-rename)', {silent=true})

-- Documentation
function showDoc()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
kset('n', 'K', '<CMD>lua showDoc()<CR>', {silent=true})

-- Highlight usages on hover
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
})

-- Code actions
local opt = {silent=true, nowait=true}
kset('n', '<Space>t', '<Plug>(coc-codeaction-cursor)', caopt)

-- Popup scroll
local opt = {silent=true, nowait=true, expr=true}
kset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
kset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
kset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
kset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)

-- Autocomplete
function checkBSpace()
  local c = vim.fn.col('.') - 1
  return c == 0 or vim.fn.getline('.'):sub(c, c):match('%s') ~= nil
end

local opt = {silent = true, noremap = true, expr = true, replace_keycodes = false}
kset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.checkBSpace() ? "<TAB>" : coc#refresh()', opt)
kset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opt)
kset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opt)
