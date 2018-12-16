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
		$(this).children('.c_l_u_l_div').css('border-left','3px solid #FF4A00');
	
	})
	$('.c_l_u_li').mouseout(function(){
		
		$(this).children().children('.class_children').css('display','none');
		$(this).css('background-color','#FFF');
		$(this).children('.c_l_u_l_div').css('border-left','none');
	
	})
	
		$('.foot_down_language').mouseover(function(){
		
		$(this).children('ul').show();
		
	})
	
	$('.foot_down_language').mouseout(function(){
		
		$(this).children('ul').hide();
		
	})	
	
	/****************************购物车样式*************************************/
	
	$('.J_minus').click(function(){
		
		var val = parseFloat($(this).next().val());
		
		if(val>1){
			val--;	
		}
		$(this).next().val(val);
	
		var p_id = $(this).parent().parent().next().next().children('a:eq(0)').children('#p_id').val();
		var value = val;
		$.post("ModifyOrderAction",{str:"minus",p_id:p_id,value:value},function(data){
		},'text')
		contentTatol()
		
	})
	
	$('.J_plus').click(function(){
		var val = parseFloat($(this).prev().val());	
		val++;
		$(this).prev().val(val);	
		
		var p_id = $(this).parent().parent().next().next().children('a:eq(0)').children('#p_id').val();
		var value = val;
		$.post("ModifyOrderAction",{str:"plus",p_id:p_id,value:value},function(data){
		},'text')
		contentTatol()
	})
	
	$('.goods_num').change(function(){
		var p_id = $(this).parent().parent().next().next().children('a:eq(0)').children('#p_id').val();
		var value = $(this).val();
		$.post("ModifyOrderAction",{str:"change",p_id:p_id,value:value},function(data){
		},'text')
		contentTatol()
	})
	
	$('.del').click(function(){
		var p_id = $("#p_id").val();
		$.post("ModifyOrderAction",{str:"del",p_id:p_id},function(data){
		},'text')
		$(this).parent().parent().parent().remove();
		//删除子订单，必须在总订单中也删除，否则刷新，会重新加载
		contentTatol()
	})

contentTatol()
	
})

//计算购物车商品总价
function contentTatol(){
	
	var total = 0;
	
	$('.item').each(function(index, element) {
		
		var price = $(this).children().children('.col_2').children('span').html();
		
		var num = $(this).children().children('.col_3').children().children('input').val();
		//alert(num)
		var ss = price*num
		
		$(this).children().children('.col_4').children('em').html(ss+'元');
		
		total+= ss;
		$('.total_price').children().children('strong').html(total);
    });
	
	//结算
	$(".btn.btn_primary").click(function(){
		var flag = confirm("请确认是否提交订单");
		if(flag==true){
			var total = $('.total_price').children().children('strong').html();
			$.post("AccountsAction",{total:total},function(data){
				if(data='true'){
					var vNow = new Date();
					var sNow = "";
					sNow += String(vNow.getFullYear());
					sNow += String(vNow.getMonth() + 1);
					sNow += String(vNow.getDate());
					sNow += String(vNow.getHours());
					sNow += String(vNow.getMinutes());
					sNow += String(vNow.getSeconds());
					sNow += String(vNow.getMilliseconds());
					window.location.href='alipay.trade.page.pay.jsp?WIDout_trade_no='+sNow+"&WIDtotal_amount="+total+"&WIDsubject=Subject&WIDbody=XiaoMi";
				}
			},"json");
		}
		else{
			return false;
		}
	});
	
}



