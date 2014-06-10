#========================================================
# ブックマークのJSONを取得する関数

getBookmarks = (type) ->
  $.Deferred (defer) ->
    $.ajax
      url: "data/#{type}.json"
      dataType: 'json'
    .done (res) ->
      defer.resolve res.items
  .promise()

#========================================================
# ブックマークののModel／Collection

class Bookmark extends Backbone.Model

class BookmarkCollection extends Backbone.Collection
  model: Bookmark
  update: (type) ->
    @trigger 'updatestart'
    getBookmarks(type).done (bookmarks) =>
      @reset bookmarks
      @trigger 'updatesuccess'

bookmarks = new BookmarkCollection # インスタンス化

#========================================================
# ブックマークを表示するView

class BookmarkItemView extends Backbone.View
  tagName: 'div'
  className: 'item'
  render: ->
    compiled = _.template """
      <a href="<%- url %>"><%- title %></a><br>
      <%- description %>
    """
    @$el.html (compiled @model.toJSON())
    @

class BookmarkView extends Backbone.View
  initialize: ->
    bookmarks.on 'updatestart', => @$el.empty()
    bookmarks.on 'updatesuccess', => @refresh()
  refresh: ->
    bookmarks.each (bookmark) =>
      view = new BookmarkItemView { model: bookmark }
      @$el.append view.render().el
    @

#========================================================
# 実行

$ ->
  bookmarkView = new BookmarkView { el: $('#bookmarks') }
  $('.loadBookmarks').click ->
    type = $(@).data 'type'
    bookmarks.update type

