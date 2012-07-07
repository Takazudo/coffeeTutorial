$(function(){
  $('.rollover').each(function(){

    // 要素を準備
    var $a = $(this);
    var $img = $a.find('img');
    
    // 画像のパスを準備
    var src_off = $img.attr('src');
    var src_on = src_off.replace('_off','_on');

    // プリロード
    $('<img />').attr('src', src_on);

    // イベントを設定
    $a.hover(function(){
      $img.attr('src', src_on);
    },function(){
      $img.attr('src', src_off);
    });

  });
});
