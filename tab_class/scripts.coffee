class TabSet
  constructor: (@$a) ->
    @_callbacks = []
    @$panelDiv = $(@$a.attr 'href')
    @_eventify()
    @_handleFirstStats()
  _eventify: ->
    @$a.click (e) =>
      e.preventDefault()
      @active()
    @
  _handleFirstStats: ->
    @$a.show()
    @_activated = @$a.hasClass 'on'
    @$panelDiv.hide() unless @_activated
    @
  active: ->
    return @ if @_activated
    @$a.addClass 'on'
    @$panelDiv.show()
    @_activated = true
    $.each @_callbacks, (i, fn) ->
      fn()
    @
  deactive: ->
    return @ unless @_activated
    @$a.removeClass 'on'
    @$panelDiv.hide()
    @_activated = false
    @
  onactive: (fn) ->
    @_callbacks.push fn
    @

class TabManager
  constructor: (@$el) ->
    @_tabSets = (@$el.find 'ul.tabs a').map (i, a) =>
      new TabSet $(a)
    @_eventify()
  _eventify: ->
    @_tabSets.each (i, tabSet) =>
      tabSet.onactive =>
        @deactiveWithout tabSet
      true
    @
  deactiveWithout: (tabSet) ->
    @_tabSets.each (i, current) ->
      current.deactive() unless current is tabSet
      true
    @

$ ->

  $('.tabSet').each ->
    new TabManager $(@)


