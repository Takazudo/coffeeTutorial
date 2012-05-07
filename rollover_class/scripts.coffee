class Rollover

  constructor: (@$a) ->
    @$img = @$a.find 'img'
    @_prepareSrcs()
    @_preload()
    @_eventify()

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

$ ->

  $('.rollover').each ->
    roll = new Rollover $(@)
