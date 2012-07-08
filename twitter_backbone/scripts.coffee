#========================================================
# Twitter検索APIを呼ぶ

getTweets = (query) ->
  $.Deferred (defer) ->
    $.ajax
      url: 'http://search.twitter.com/search.json'
      dataType: 'jsonp'
      data:
        result_type: 'recent'
        rpp: 10
        page: 1
        q: query
    .done (res) ->
      defer.resolve res.results

#========================================================
# Twitter検索のModel／Collection

class Tweet extends Backbone.Model

class TweetList extends Backbone.Collection
  model: Tweet
  update: (query) ->
    @trigger 'updatestart'
    getTweets(query).done (tweets) =>
      @reset(tweets)
      @trigger 'updatesuccess'

tweets = new TweetList # インスタンス化

#========================================================
# Twitter検索結果を表示するView

class TweetItemDiv extends Backbone.View
  tagName: 'div'
  className: 'item'
  render: ->
    compiled = _.template """
      <a href="http://twitter.com/<%- from_user %>">
        <%- from_user %>
      </a>
      <%- text %>
    """
    @$el.html (compiled @model.toJSON())
    @

class TweetsDiv extends Backbone.View
  initialize: ->
    tweets.bind 'updatestart', => @$el.empty()
    tweets.bind 'updatesuccess', => @refresh()
  refresh: ->
    tweets.each (tweet) =>
      view = new TweetItemDiv { model: tweet }
      @$el.append view.render().el
    @

#========================================================
# 実行

$ ->
  tweetsDiv = new TweetsDiv { el: $('#tweets') }
  $('.loadtweets').click ->
    query = $(@).data 'query'
    tweets.update query

