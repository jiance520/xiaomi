// JavaScript Document
$(function(){
	
	$('.country_class').att
	/********************监听输入框的值，记录在input.oldValue**************************************/
		$('input').bind('focus',function(){
			
			startCheckValueChange(this);
			
		})
		
		$('input').bind("blur",function(){
      		stopCheckValueChange(this);
      		//testBlurError(conf,view,$(this));
    	});
		
		function startCheckValueChange(input){
			
    		var _check=function(){
				
			  if(input.value!==input.oldValue){
				
				if(input.value===""){
					 input.oldValue=input.value;
					 return false;
			  	}
				input.oldValue=input.value;
				//$(input).trigger("valueChange");	
				
							 
			  }
			  input.__valuechangetc=setTimeout(_check,300);
   	 		};
    		_check()
  		}
		function stopCheckValueChange(input){
   			 clearTimeout(input.__valuechangetc);
  		}
	
/************************输入框验证与提示************************************************/	
	
	/***选择国家***/
	
	$('.country_click').toggle(
		function(){
		
			$(this).next().show();	
	
		},function(){
		
			$(this).next().hide();	
		}
	
	);
	//当鼠标浮上地区选择时改变背景色
	$('.country_li').mouseover(function(){
		$(this).css('background-color','#EAEAEA');
		
	})
	$('.country_li').mouseout(function(){
		$(this).css('background-color','#FFF');
		
	})
	
	//当地区被点击是吧选择的地区放置在页面中
	$('.country_li').click(function(){
		
		var name = $(this).children('.country_name').text();
		
		var code = $(this).children('.country_code').text();
		
		var ss = name+'('+code+')';
		
		//alert(ss);
		
		$('.r_c_chose').children('tt').text(ss);
		
		$('.r_m_c_hidden').hide();
		
		
	})
	//当输入框内的错误文本被清空 并且再次有文本输入时要把隐藏报错区域
	
	
	
	
	//当输入框失去焦点时，做判断并提示
	$('.register_phone').children('input').blur(function(){
		//alert(0);
		var $val = $(this).val();
		
		var req = /^1\d{10}$/;
	
		var ck = req.test($val)
		
		if($val == "" || !ck ){
			
			$(this).css('border-color','#FF6F4D');
			$(this).parent().next().css('display','block');
			
		}else{
			$(this).parent().next().children().children('span').text('');
			$(this).css('border-color','#E8E8E8');
			$(this).parent().next().css('display','none');
		}
		
		if($val == ""){
			
			$(this).parent().next().children().children('span').text('请输入手机号码');
		}
		
		if(!ck){
			$(this).parent().next().children().children('span').text('手机号码格式错误');
		}
		
	})
	//图片验证码的输入框
	$('.register_identify').children('input').blur(function(){
		//alert(0);
		
		var $val = $(this).val();
		
		var ck //输入文本与图片验证码文本比较
		
		if($val == ""){
			
			$(this).css('border-color','#FF6F4D');
			$(this).parent().next().css('display','block');
			
		}else{
			$(this).parent().next().children().children('span').text('');
			$(this).css('border-color','#E8E8E8');
			$(this).parent().next().css('display','none');
		}
		
		if($val == ""){
			
			$(this).parent().next().children().children('span').text('请输入图片验证码');
		}
		
		//if(!ck){
		//	$(this).parent().next().children().children('span').text('图片验证码错误');
		//}
		
	})
	
	//点击注册时验证是否符合注册要求
	$('[name="register_form"]').submit(function(){
		
		var ss =$('.register_error').children().children('span').text();
		
		var pval = $('.register_phone').children('input').val();
		
		var ival = $('.register_identify').children('input').val();
		
		if(ss != "" || pval == "" || ival == ""){
			
			return false;
		}
	})
	
/********************************************注册***************************************************/	
	var seq = /^[^\f\n\r\t\v]{8,16}$/
	var pwd;
	var repwd;
	
	//判断第一次输入的密码是否符合要求
	$(".set-password").blur(function(){
		
		pwd = $(this).val();
		
		var ck = seq.test(pwd);
		
		if(pwd == ''){
			$(this).parent().css('border-color','#FF6F4D');
			
			$('.dis_box').children('span').text('请输入密码');
		}else{
			
			$(this).parent().css('border-color','#E8E8E8');
			$('.dis_box').children('span').text('密码长度8~16位，数字、字母、字符至少包含两种');
			
			if(!ck){
				$(this).parent().css('border-color','#FF6F4D');
				$('.dis_box').children('span').text('密码长度8~16位，数字、字母、字符至少包含两种');
			}
			
	   }
		
	})
	
	//判断第二次输入的密码是否符合要求
	$("[name='repassword']").blur(function(){
		
		repwd = $(this).val();
		
		var ck = seq.test(repwd);
		
		if(repwd == ''){
			$(this).parent().css('border-color','#FF6F4D');
			
			$('.dis_box').children('span').text('请输入确认密码');
		}else{
			
			$(this).parent().css('border-color','#E8E8E8');
			$('.dis_box').children('span').text('密码长度8~16位，数字、字母、字符至少包含两种');
			
			if(!ck){
				$(this).parent().css('border-color','#FF6F4D');
				$('.dis_box').children('span').text('密码长度8~16位，数字、字母、字符至少包含两种');
			}
			
	   }
		
	})
	
	//点击输入密码页面的提交
	$('#to_step4').click(function(){
		
		//两个密码不想相等
		if(pwd != repwd){
			
			$('.dis_box').children('span').text('密码输入不一致');
			
		}else{ //密码相等时提交数据进入下一页面
					
			//通过Ajax判断验证码是否正确
			$.post('RegisterAction', $("[name='password_form']").serialize() ,function(data){
				
				if(data == true){
					$('.phone_step3').css('display','none');
					$('.phone_step4').css('display','block')
					
				}
			
			})
		}
		
	})
	

})