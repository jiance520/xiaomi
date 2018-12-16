// JavaScript Document
$(function(){
	
	
	$('.open_buy_date').children('a').mouseover(function(){
		
		$(this).css('background-position','0px -16px')
	})
	$('.open_buy_date').children('a').mouseout(function(){
		
		$(this).css('background-position','0px 0px')
	})
	
	//开放购买提醒区域，浮上变色
	$('.search_area_left').mouseover(function(){
		$('.search_submit').css('background','url(images/2015-07-27_064103.png) no-repeat');
	
	})
	$('.search_area_left').mouseout(function(){
		$('.search_submit').css('background','url(images/2015-07-16_191002.png) 12px 12px no-repeat');
		
	})
	
	//浮上头部导航时显示掩藏的区域
	$('.h_c_l_r_li').mouseover(function(){
		$(this).children('.head_hidden_show').show();
		$(this).children('a').children('span').css('display','block');
	})
	$('.h_c_l_r_li').mouseout(function(){
		$(this).children('.head_hidden_show').hide();
		$(this).children('a').children('span').css('display','none');
	})
	
	//浮上左侧导航时显示掩藏的区域
	$('.c_l_u_li').mouseover(function(){
		
		$(this).children().children('.class_children').css('display','block');
		$(this).css('background-color','#FAFAFA');
	
	})
	$('.c_l_u_li').mouseout(function(){
		
		$(this).children().children('.class_children').css('display','none');
		$(this).css('background-color','#FFF');
	
	})
	
	$('.all_classification').mouseover(function(){
		
		$(this).children('div').show()	
		$(this).children('a').children('i').children('img').attr('src','images/2015-07-30_063228.png')
		
	})
	
	$('.all_classification').mouseout(function(){
		
		$(this).children('div').hide()	
		$(this).children('a').children('i').children('img').attr('src','images/2015-07-28_033959.png')
		
	})
	
	$('.foot_down_language').mouseover(function(){
		
		$(this).children('ul').show();
		
	})
	
	$('.foot_down_language').mouseout(function(){
		
		$(this).children('ul').hide();
		
	})	
	
})




















































