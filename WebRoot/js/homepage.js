// JavaScript Document

$(function(){

/****************************************头部*****************************************/	
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
		$(this).children('.c_l_u_l_div').css('border-left','3px solid #FF4A00');
	
	})
	$('.c_l_u_li').mouseout(function(){
		
		$(this).children("div:eq(0)").children('.class_children').css('display','none');
		$(this).css('background-color','#FFF');
		$(this).children('.c_l_u_l_div').css('border-left','none');
	
	})
	
	
/*******************************底部*************************************************/	
	
	
	$('.foot_down_language').mouseover(function(){
		
		$(this).children('ul').show();
		
	})
	
	$('.foot_down_language').mouseout(function(){
		
		$(this).children('ul').hide();
		
	})	
	
/*******************************主体*************************************************/		
	
	$('.big_img').mouseover(function(){
		
		$(this).children('a').show();
		
	})
	$('.big_img').mouseout(function(){
		
		$(this).children('a').hide();
		
	})
	
	//话费充值
	$('#rechargeTel').focus(function(){
		$('.btn_recharge_submit').css('background-color','#FF4A00');
		
	})
	
	$('.xm_select').mouseover(function(){
		
		$(this).children('ul').show();
		$('.arrow_down').css('background-position','0px -5px');
		
	})
	$('.xm_select').mouseout(function(){
		
		$(this).children('ul').hide();
		$('.arrow_down').css('background-position','0px 0px');
		
	})
	
	$('.btn_recharge_submit').click(function(){
		var ss = $('#rechargeTel').val();
		
		var seq = /^1\d{10}$/
		
		if(ss==''){
			
			$('.xm_charge_tips').text('手机号码号码不能为空！');
			
			setTimeout("$('.xm_charge_tips').text('')",1000);
		}else{
			
			if(!seq.test(ss)){
				
				$('.xm_charge_tips').text('请输入正确的手机号码！');
			
				setTimeout("$('.xm_charge_tips').text('')",1000);	
			}
		}
		
	})
	
	$('.dropdown_menu').children('li').click(function(){
		
		var val = $(this).children('span').text();
		
		if(val == '30元'){
			$('#rechargePrice').children('span').text('29.55');
			
		}else if(val == '50元'){
			$('#rechargePrice').children('span').text('49.2');
			
		}else if(val == '100元'){
			$('#rechargePrice').children('span').text('98.4');
		}
			
		$('.dropdown_text').text(val);
		$(this).parent().hide();
	})
	
	$('.item_content').mouseover(function(){
		
		$(this).css('border-color','#F3F3F3');	
		
	})

	$('.item_content').mouseout(function(){
		
		$(this).css('border-color','#FFF');	
		
	})	
	
	$('.c_l_ul').children().eq(1).click(function(){
		
		alert(0);
	})
	
	$('.row_num').children().children().click(function(){
		
		var index = $(this).text();
		
		//$('.b_i_c').children().eq(index-1).hide();
		
		
	$('.b_i_c').children().eq(index-1).css('display','block');
	
	//$('.row_num').children().eq(index).children('a').css('background-color','rgba(0, 0, 0, 0.6)')
	//$('.row_num').children().eq(index-1).children('a').css('background-color','rgba(0, 0, 0, 0.3)')
		
		
	})
	
	
	
	
	
	
	
	
	
	setTimeout('startRow()',4000)
	setTimeout('start()',4000)
})

/**********明星单品滚动栏**************/
var way = 0;
var ck = true;
function start(){
	setInterval("init()",100)
}

function init(){
	
	var ss = -way+'px';
	
	
	if(ck){
		$('.to_left').css('color','#8C8C8C')
		$('.to_right').css('color','#333')
		
		if(way >=1240){
			way = 1240
			setTimeout('ck=false',4000)
			
		}else{
			way+=124
		}
	}else{
		
		$('.to_left').css('color','#333')
		$('.to_right').css('color','#8C8C8C')
		if(way<=0){
				
			setTimeout('ck = true',4000)
		}else{
			way-=124;
		}
	}

		$('.img_row').css('margin-left',ss);

}

/**********展示栏切换图片*************/	

var index = 1 ;

function startRow(){
	
	setInterval("row()",4000)
}

function row(){
	//alert(index)
	if(index == 5){ index = 0}
	//$('.b_i_c').children().eq(index-1).hide();
	//$('.b_i_c').children().eq(index).show();
	
	$('.b_i_c').children().eq(index-1).hide();
	$('.b_i_c').children().eq(index).css('display','block');
	$('.row_num').children().eq(index).children('a').css('background-color','rgba(0, 0, 0, 0.6)')
	$('.row_num').children().eq(index-1).children('a').css('background-color','rgba(0, 0, 0, 0.3)')
	
	
	for(var i=1;i<=10;i++){
		
		setTimeout("$('.b_i_c').children().eq(index).css('opacity','0.1*'+i)",100)
		
		
	}
		
	
	
	index++
	
}


































































































