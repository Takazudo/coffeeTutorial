# EventModuleクラス
class EventModule
  bind: (evName, callback) ->
    @_callbacks = {} unless @_callbacks?
    @_callbacks[evName] = [] unless @_callbacks[evName]?
    @_callbacks[evName].push(callback)
    @
  trigger: (evName) ->
    list = @_callbacks?[evName]
    return @ unless list
    for callback in list
      callback.apply(@)
    @

# EventModuleのテスト
eventModule = new EventModule
eventModule.bind 'foo', -> alert 'foo1'
eventModule.bind 'foo', -> alert 'foo2'
eventModule.trigger 'foo'
  # アラート: foo1
  # アラート: foo2
eventModule.trigger 'foo'
  # アラート: foo1
  # アラート: foo2

# ConcreteUIクラス
class ConcreteUI extends EventModule
  doSomething: ->
    @trigger 'dosomething'
    @

# ConcreteUIのテスト
ui = new ConcreteUI
ui.bind 'dosomething', -> alert 'did it!'
ui.doSomething() # アラート: did it!
ui.doSomething() # アラート: did it!
