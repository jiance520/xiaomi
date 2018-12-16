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
<title>小米帐号 - 登录</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript">
/* $(function(){
	
	$('.login_now').click(function(){
		
		window.location.href="index2.html";
		
	})
	
}) */
</script>
</head>

<body class="login_body">

<div class="login_main">
	<div class="login_container">
    
    	<div class="login_logo">
        	<a href="javascript:void(0)">
            	<img width="60px" height="60px" src="images/index4.png" />
            </a> 
        </div>
        
        <h1 class="login_title">
        	<span>一个帐号，玩转所有小米服务！</span>
        </h1>
        
        <div><p class="login_extand">
        <a target="_blank" href="http://www.mi.com">小米手机</a>，<a target="_blank" href="http://www.mi.com">小米网</a>，<a target="_blank" href="http://www.miui.com/">MIUI米柚</a>，<a target="_blank" href="http://www.duokan.com/">多看阅读</a>，<a target="_blank" href="http://www.miliao.com/">米聊</a>
        </p></div>
        
        <div class="login_table">
        	<div class="login_in">
            	<form name="login_form" action="AjaxLoginAction" method="post">
                
                	<div class="user_pwd">
                    	<div class="login_user">
                        	<input class="login_phone" name="login_phone" oldValue="aa" type="text" placeholder="邮箱/手机号码/小米帐号"/>
                            <!--<i>邮箱/手机号码/小米帐号</i>-->
                             <span class="login_error">
                            	<em></em>
                                <span>用户名不正确</span>
                            </span>
                        </div>
                        <div class="login_pwd">
                        	<input class="login_pwds" name="login_pwds" type="password" placeholder="密码" />	
                            <!--<i>密码</i>	-->
                        </div>
                    </div>
                    
                    <input class="login_now" type="submit" value="立即登录" />
                    
                    <div class="other_way clearfix">
                    	<div class="two_way">
                          <span>
                              <a href="javascript:void(0)">其他方式登录</a>
                              <span>|</span>
                          </span>
                          <span><a href="javascript:void(0)">忘记密码？</a></span>
                        </div>
                    </div>
                    
                    <span>
                    	<a class="to_register" href="register.jsp">注册小米帐号</a>
                    </span>
                    
                </form>
                
                <div class="QR_code"></div>
                
            </div>
        </div>
    </div>

	<div class="login_foot">
    	<div>
        	<span class="font_style">
            	<a class="simple" href="javascript:void(0)">简体</a>|<a class="traditional" href="javascript:void(0)">繁体</a>|<a class="english" href="javascript:void(0)">English</a>
            </span>
        	
            <span>
            	<span>|</span>
                <span><a class="common_question" href="javascript:void(0)">常见问题</a></span>
            </span>
        </div>
        
        <p>小米公司版权所有-京ICP备10046444-京公网安备1101080212535</p>
    </div>
    
</div>

</body>
</html>
