$ ->
  $('.rollover').each ->
    a = $(@)
    img = a.find 'img'
    src_off = img.attr 'src'
    src_on = src_off.replace '_off', '_on'
    $('<img />').attr 'src', src_on
    a.hover ->
      img.attr 'src', src_on
    , ->
      img.attr 'src', src_off
