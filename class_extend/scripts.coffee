# Manjuクラス
class Manju
  shape: 'ball'
  constructor: ->
    alert 'まんじゅう作成完了'
  sayShape: ->
    alert @shape
    @

# MomijiManjuクラス
class MomijiManju extends Manju
  shape: 'momiji'
  constructor: ->
    super
    alert 'もみじまんじゅう！'

# 実行
manju1 = new Manju
  # アラート: まんじゅう作成完了
manju1.sayShape()
  # アラート: ball
momijiManju1 = new MomijiManju
  # アラート: まんじゅう作成完了
  # アラート: もみじまんじゅう！
momijiManju1.sayShape()
  # アラート: momiji

