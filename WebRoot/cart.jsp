<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.action.*,com.dao.*,com.entity.*,com.service.*,com.dao.impl.*,com.service.impl.*,java.sql.*" %>
<%-- <%@ include file="loginControl.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车——小米手机官网</title>

<link type="text/css" rel="stylesheet" href="css/cart.css" />
<link rel="shortcut icon" href="images/favicon.ico" /> 
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript">
	//结账
/* 	$("document").ready(function(){
		$("").click(function(){
			$.post("",{},function(data){
			},"text");
		});
	}) */
</script>
</head>

<body>
	<div class="head_top"><!--1-->
    	<div class="head_top_container">
            <div class="head_top_left">
                <a href="javascript:void(0);">小米网</a>
                <span>|</span>
                <a href="javascript:void(0);">MIUI</a>
                <span>|</span>
                <a href="javascript:void(0);">米聊</a>
                <span>|</span>
                <a href="javascript:void(0);">游戏</a>
                <span>|</span>
                <a href="javascript:void(0);">多看阅读</a>
                <span>|</span>
                <a href="javascript:void(0);">云服务</a>
                <span>|</span>
                <a href="javascript:void(0);">小米网移动版</a>
                <span>|</span>
                <a href="javascript:void(0);">Select region</a>
            </div>   

            <div class="head_top_right">
 				<c:choose>
	        		<c:when test="${map==null}">
	        			<a href="login.jsp">登录</a><span>|</span><a href="register.jsp">注册</a>
	        		</c:when>
	        		<c:otherwise>
	        			欢迎您
		                <a class="userName" href="javascript:void(0);">
		                	${map.USERNAME}
		                    <span class="userName_icon"></span>
		                </a>&nbsp;
		                <a href="ClearSessionAction">退出登录</a>
		                <span>|</span>
		                <a href="javascript:void(0);">我的订单</a>
		                <span>|</span>
		                <a href="javascript:void(0);">我的小米账户</a>
<!-- 		                </br>
		                <div class="user_ul">
		                	<ul class="list">
		                	<li><a href="javascript:void(0)">个人中心</a></li>
		                    <li><a href="javascript:void(0)">我的收藏</a></li>
		                    <li><a href="javascript:void(0)">退出登录</a></li>
		                	</ul>
		                    <span class="list_icon">
		                    	<input type="image" src="images/2015-07-16_160538.png" />
		                    </span>
		                </div> -->
		            </span>
	        		</c:otherwise>
          		</c:choose>
            </div>        
        </div>
	</div>
<!----------------------------1-------------------------------------> 
    <div class="head_container">
    
    	<div class="homepage_logo"><a>
        	<img src="images/2015-07-16_170413.png" />
        </a>
        </div>
      
        <div class="">
        	
            <img src="images/2015-07-29_063928.png" />
            
        </div>

  
    </div>
<!---------------------------------中部---------------------------------------->  

	<div class="cart_container clearfix">
	
    	<div id="shopCartBox" class="shop_cart_box hide">
    		<div id="J_cartHeader" class="shop_cart_box_hd">
            	<h2 class="title">我的购物车</h2>
            	<p id="J_cartPostFreeTip" class="tip">全场满¥150免运费，除电视、净水器、体重秤</p>
            </div>
    	
    		<div id="J_cartBody" class="shop_cart_box_bd">
            	<dl id="J_cartGoodList" class="shop_cart_goods">
            		<dt class="clearfix">
                    	<span class="col col_1">商品</span>
                        <span class="col col_2">单价</span>
                        <span class="col col_3">数量</span>
                        <span class="col col_4">小计</span>
                        <span class="col col_5">操作</span>
                    
                    </dt>
                    
                    <c:forEach var="order" items="${ordermap}">
                    	<dd class="item clearfix J_proItem">
                    	<div class="item_row">
                        
                    		<div class="col col_1">
                            	<div class="g_pic">
                                	<a target="_blank" href="javascript:void(0)">
                                    	<img width="120" height="120" src="${order.value.p_file_name}"/>
                                    </a>
                                </div>
                                <div class="g_info">
                                	<div class="g_name"><a target="_blank" href="">${order.value.p_name}</a></div>
                                    <p class="g_type">
                                		<span>备注：${order.key}</span>
                                	</p>
                                </div>
                            </div>
                            
                            <div class="col col_2"><span>${order.value.shop_price}</span>元</div>
                            
                    		<div class="col col_3">
                            	<div class="change_goods_num clearfix" J_changeGoodNum>
                            		<a class="J_minus" href="javascript:void(0)">
                                    	<i class="iconfont">&ndash;</i>
                                    </a>
                                    <input type="text" class="goods_num J_goodsNum" autocomplete="off" value="${order.value.od_count}" />
                                    
                                    <a class="J_plus" href="javascript:void(0)">
                                    	<i class="iconfont">+</i>
                                    </a>
                            	</div>
                            </div>
                            
                    		<div class="col col_4"><em></em></div>
                            
                            <div class="col col_5">
                            	<a class="del JdelGoods" href="javascript:void(0)">
                                	<i class="iconfont">&times;</i>
                                	<input type="text" name="p_id" id="p_id" value="${order.value.p_id}" hidden/>
                                </a>
                            </div>
                            
                    	<div>
                    </dd>
                    </c:forEach>  
            	</dl>
            </div>
    		
            <div id="J_cartFooter" class="shop_cart_box_ft clearfix">
            	<div class="shop_cart_total">
                	<p class="total_price">商品总计：<span><strong></strong>元</span></p>
                </div>
            	<div class="shop_cart_action clearfix">
            		
                    <a class="btn btn_primary" href="javascript:void(0)">去结账</a>
                    <a class="btn btn_lineDakeLight btn_back" href="IndexAction">继续购物</a>
                    
            	</div>
            </div>
    	
    	</div>
    </div>



<!-------------------------------底部------------------------------------------>  

<div class="foot_body">
	<div class="foot_container">
    	<div class="foot_up">
        	<ul class="clearfix">
            	<li>
                	<a class="foot_up_a" href="#">
                    	<span><img src="images/2015-07-19_085552.png" /></span>
                        <strong>1小时快修服务</strong>
                    </a>
                </li>
                <li>
                	<a class="foot_up_a" href="#">
                    	<span><img src="images/2015-07-19_085448.png" /></span>
                        <strong>7天无理由退货</strong>
                    </a>
                    
                </li>
                <li>
                	<a class="foot_up_a" href="#">
                    	<span><img src="images/2015-07-19_085038.png" /></span>
                        <strong>15天免费换货</strong>
                    </a>
                </li>
                <li>
                    <a class="foot_up_a" href="#">
                    	<span><img src="images/2015-07-19_085120.png" /></span>
                        <strong>满150元包邮</strong>
                    </a>
                </li>
                <li>
                	<a class="foot_up_a" href="#">
                    	<span><img src="images/2015-07-19_085351.png" /></span>
                        <strong>520余家售后网点</strong>
                    </a>
                </li>
            </ul>
        </div>
        
        <div class="foot_middle clearfix">
        	<dl class="foot_middle_dl dl_first">
            	<dt>帮助中心</dt>
                <dd><a class="" href="">购物指南</a></dd>
                <dd><a class="" href="">支付方式</a></dd>
                <dd><a class="" href="">配送方式</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>服务支持</dt>
                <dd><a class="" href="">售后政策</a></dd>
                <dd><a class="" href="">自助服务</a></dd>
                <dd><a class="" href="">相关下载</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>小米之家</dt>
                <dd><a class="" href="">小米之家</a></dd>
                <dd><a class="" href="">服务网点</a></dd>
                <dd><a class="" href="">预约亲临到店服务</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>关于小米</dt>
                <dd><a class="" href="">了解小米</a></dd>
                <dd><a class="" href="">加入小米</a></dd>
                <dd><a class="" href="">联系我们</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>关注我们</dt>
                <dd><a class="" href="">新浪微博</a></dd>
                <dd><a class="" href="">小米部落</a></dd>
                <dd><a class="" href="">官方微信</a></dd>
            </dl>
            <div class="foot_middle_contact">
            	<p class="phone">400-100-5678</p>
                <p>周一至周日 8:00-18:00<br />（仅收市话费）</p>
                <a href="#">24小时在线客服</a>
            </div>
        </div>
        
        <div class="foot_down">
        	<div class="foot_down_info">
            	<p>
                	小米旗下网站：
                    <a href="http://www.mi.com/">小米网</a>
                    <span>|</span>
                    <a href="http://www.miui.com/">MIUI</a>
                    <span>|</span>
                    <a href="http://www.miliao.com/">米聊</a>
                    <span>|</span>
                    <a href="http://www.duokan.com/">多看书城</a>
                    <span>|</span>
                    <a href="http://www.miwifi.com/">小米路由器</a>
                    <span>|</span>
                    <a href="http://www.mi.com/hk/">繁體香港</a>
                    <span>|</span>
                    <a href="www.mi.com/tw/">繁體台灣</a>
                    <span>|</span>
                    <a href="http://www.mi.com/en/">English</a>
                    <span>|</span>
                    <a href="http://blog.xiaomi.com/">小米后院</a>
                    <span>|</span>
                    <a href="http://xiaomi.tmall.com/">小米天猫店</a>
                    <span>|</span>
                    <a href="http://shop115048570.taobao.com/">小米淘宝直营店</a>
                    <span>|</span>
                    <a href="http://union.mi.com/">小米网盟</a>
                </p>
                
                <p>
                	&copy;
                    <a href="#">mi.com</a>
                    京ICP证110507号 京ICP备10046444号 京公网安备1101080212535号		
                    <a href="#">京网文[2014]0059-0009号</a>
                </p>
            </div>
            
            
            <div class="foot_down_language">
            	<div class="f_d_l_chose">简体中文</div>
                
                <span class="foot_icon"><img src="images/2015-07-19_132244.png" /></span>
                
                <ul>
                	<li><a href="#">English</a></li>
                    <li><a href="#">繁體台灣</a></li>
                    <li><a href="#">繁體香港</a></li>
                    <li><a href="#">Singapore</a></li>
                    <li><a href="#">Malaysia</a></li>
                    <li><a href="#">India</a></li>
                    <li><a href="#">Philippines</a></li>
                    <li><a href="#">Indonesia</a></li>
                    <li><a href="#">Brasil</a></li>
                    <li><a href="#">简体中文</a></li> 
                </ul>
            
            </div>
            
            <div class="foot_down_info_links">
            	<a href="#"><img src="images/cnnicVerifyseal.png" /></a>
            	<a href="#"><img src="images/szfwVerifyseal.gif" /></a>
            	<a href="#"><img src="images/save.jpg" /></a>
            </div>
        </div>
    </div>
</div>




     
</body>
</html>
