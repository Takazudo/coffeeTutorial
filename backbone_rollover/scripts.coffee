# Rolloverクラス
class Rollover extends Backbone.View
  events:
    'mouseenter': 'toOver'
    'mouseleave': 'toNormal'
  initialize: ->
    @_prepareEls()
    @_prepareSrcs()
    @_preload()
    @
  _prepareEls: ->
    @$img = @$('img')
    @
  _prepareSrcs: ->
    @_src_off = @$img.attr 'src'
    @_src_on = @_src_off.replace '_off', '_on'
    @
  _preload: ->
    $('<img />').attr 'src', @_src_on
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
    new Rollover { el: anchor }
