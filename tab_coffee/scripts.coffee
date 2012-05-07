$ ->

  $('.tabSet').each ->

    topDiv = $(@)
    anchors = topDiv.find 'ul.tabs a'
    panelDivs = topDiv.find 'div.panel'

    lastAnchor = null
    lastPanel = null

    anchors.show()
    lastAnchor = anchors.filter '.on'
    lastPanel = $(lastAnchor.attr 'href')
    panelDivs.hide()
    lastPanel.show()

    anchors.click (event) ->

      event.preventDefault()
      currentAnchor = $(@)
      currentPanel = $(currentAnchor.attr 'href')
      lastAnchor.removeClass 'on'
      currentAnchor.addClass 'on'
      lastPanel.hide()
      currentPanel.show()
      lastAnchor = currentAnchor
      lastPanel = currentPanel
