local w = require('wilder') 

w.setup({
  modes = {':', '/', '?'}
})

w.set_option('renderer', w.popupmenu_renderer(
  w.popupmenu_palette_theme({
    highlighter = w.basic_highlighter(),
    left = {' ', w.popupmenu_devicons(), ' '},
    right = {' ', w.popupmenu_scrollbar(), ' '},
    highlights = {
      accent = w.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#e0bebc'}}),
    },
    border = 'rounded',
    max_height = '40%',
    min_height = 0,
    max_width = '50%',
    prompt_position = "top",
    reverse = 0,
  })
))
