<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.action.*,com.dao.*,com.entity.*,com.service.*,com.dao.impl.*,com.service.impl.*,java.sql.*" %>
<%-- <%@ include file="loginControl.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小米账号 - 注册</title>
<link type="text/css" rel="stylesheet" href="css/register.css" />
<link rel="shortcut icon" href="images/favicon.ico" /> 

<script type="text/javascript" src="<%=basePath %>js/adddate.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<style type="text/css">
	td,input {
		height:24px;
    	font: normal 16px 宋体;
    }
    input{
    	margin:3px;
    	border:1px solid #666;
    }
</style>


</head>

<body class="register_body">

	<div class="register_up">
    	<div>
        	<a class="" href="#">
            	<img src="images/n-logo.png" />
            </a>
        </div>
    </div>
    
    <div class="register_middle">
    	<div class="r_m_container">
        	<div class="r_m_c_title">
            	<h4>注册小米帐号</h4>
            </div>
            <div>
              <div class="r_m_c_table">
    <form name="register_form" action="RegisterAction" method="post">                   
    <table>
    	<tr>
    		<td>用户名：</td>
    		<td>
	    		<input type="text" name="username" required placeholder="必填"/>
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>密码：</td>
    		<td>
	    		<input type="password"  name="password" required placeholder="必填">
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>确认密码：</td>
    		<td>
	    		<input name="repassword" type="password" required placeholder="必填">
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>手机号:</td>
    		<td>
	    		<input type="text" name="phone" required placeholder="必填"/>
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>email：</td>
    		<td>
	    		<input type="email" name="email" required placeholder="必填"/>
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>生日：</td>
    		<td>
	    		<input type="text" name="birthday" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd')" placeholder="可选"/>
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>验证码：</td>
    		<td>
	    		<input type="text" name="veryCode" /><span></span>
    		</td>
    		<td><img id="veryCode" src="/xiaomi/ImageAction" /></td>
    	</tr>
    </table>
    <div class="fixed_bot mar_phone_dis3"><input id="pwd_submit" class="btn332 btn_reg_1 submit-step" type="submit" value="提交"></div>    
  </div>       
   
                </form>
               </div>
             </div>
         </div>         
    </div>
     
    
    <div class="register_down">
    	<div><a href="http://static.account.xiaomi.com/html/faq/zh_CN/faqList.jsp">常见问题</a></div>
        
        <p><span>小米公司版权所有-京ICP备10046444-京公网安备1101080212535</span></p>
        
        <div class="register_language"><a class="font_simple" href="#">简体</a><span>|</span><a href="#">繁体</a><span>|</span><a href="#">English</a>
        </div>
        
        
    </div>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	//alert("0");
	$(document).ready(function(){
		$("#veryCode").click(function(){
			var vs = "/xiaomi/ImageAction?times="+new Date();
			$(this).attr("src",vs);
		})
		
		$(".veryCode").blur(function(){
            //alert(0);
            var val = $(this).val();
            $.post("CheckCodeAction",{value:val},function(data){
                  if(data=="true"){
                        $(".veryCode").next().html("");
                  }
                  else{
                        $(".veryCode").val("");
                        $(".veryCode").next().html("验证码错误");
                  }
            },"text");
        })
	})
</script>
</body>
</html>
