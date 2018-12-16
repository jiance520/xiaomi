// JavaScript Document
$(function(){
	
/************************二维码登陆显示和关闭************************************************/
	$('.QR_code').click(function(){
		
		$('.qrlogin_back,.qrlogin_container').css('display','block');	

	})
	
	$('.qrlogin_close').click(function(){
		
		$('.qrlogin_back,.qrlogin_container').css('display','none');
		
	})
/************************输入框验证与提示************************************************/	
	
		//var MSG = { phone:"正确",pwd:"错误"}
		
		
		
		
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
		
			
		
})
		








