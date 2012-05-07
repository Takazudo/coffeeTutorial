$(function(){
	$('.rollover').each(function(){
		var a = $(this);
		var img = a.find('img');
		var src_off = img.attr('src');
		var src_on = src_off.replace('_off','_on');
		$('<img />').attr('src', src_on);
		a.hover(function(){
			img.attr('src', src_on);
		},function(){
			img.attr('src', src_off);
		});
	});
});
