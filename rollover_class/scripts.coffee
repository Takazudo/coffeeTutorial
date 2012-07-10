# Rolloverクラス
class Rollover

  $a: null # a要素
  $img: null # img要素
  _src_off: null # 通常時のsrc
  _src_on: null # オーバー時のsrc

  constructor: ($a) ->
    @$a = $a
    @_prepareEls()
    @_prepareSrcs()
    @_preload()
    @_eventify()
  _prepareEls: ->
    @$img = @$a.find 'img'
    @
  _prepareSrcs: ->
    @_src_off = @$img.attr 'src'
    @_src_on = @_src_off.replace '_off', '_on'
    @
  _preload: ->
    $('<img />').attr 'src', @_src_on
    @
  _eventify: ->
    @$a.hover =>
      @toOver()
    , =>
      @toNormal()
    @
  toOver: ->
    @$img.attr 'src', @_src_on
    @
  toNormal: ->
    @$img.attr 'src', @_src_off
    @

# 実行
$ ->
  $('.rollover').each (i, anchor) ->
    new Rollover $(anchor)
