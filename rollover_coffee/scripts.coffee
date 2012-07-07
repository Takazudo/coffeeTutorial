$ ->
  $('.rollover').each ->

    # 要素を準備
    a = $(@)
    img = a.find 'img'

    # 画像のパスを準備
    src_off = img.attr 'src'
    src_on = src_off.replace '_off', '_on'

    # プリロード
    $('<img />').attr 'src', src_on

    # イベントを設定
    a.hover ->
      img.attr 'src', src_on
    , ->
      img.attr 'src', src_off
