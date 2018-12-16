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
<title>head</title>

<link type="text/css" rel="stylesheet" href="css/good.css" />
<link rel="shortcut icon" href="images/favicon.ico" /> 

<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/good.js"></script>
<script type="text/javascript">
	$("document").ready(function(){
		var p_id=${productmap.P_ID};
		$("#goodsDetailAddCartBtn").click(function(){
			alert("购物车加入1件商品");
			$.post("ShopAction",{p_id:p_id},function(data){
			},"json");
		});
	})
</script>
<style type="text/css">

.goods-detail-desc .span5 {
    width: 290px;
    padding-right: 20px;
	float: left;
    min-height: 1px;
}
.xm-box {
    border: 1px solid #DFDFDF;
    background: #FFF none repeat scroll 0% 0%;
}
.goods-detail-desc .goods-recent {
    border: medium none;
}
.xm-box .box-hd {
    position: relative;
    height: 50px;
    border-bottom: 1px solid #DFDFDF;
}
.xm-box .box-hd .title {
    margin: 0px 0px 0px 30px;
    font-size: 18px;
    font-weight: 400;
    line-height: 50px;
    color: #333;
}
.goods-detail-desc .goods-recent .box-hd .title {
    margin: 0px;
    line-height: 55px;
}
.goods-detail-desc .goods-recent .box-bd {
    padding-bottom: 35px;
}
.goods-detail-desc .goods-recent .box-bd ul li {
    float: left;
    width: 79px;
    height: 79px;
    margin-right: 10px;
    margin-top: 10px;
}
.goods-detail-desc .goods-recent .box-bd ul li img {
    width: 78px;
    height: 78px;
    border: 1px solid #FFF;
}
.span15 {
    width: 930px;
    float: left;
    min-height: 1px;
}
.goods-detail-desc .goods-detail-comment {
    position: relative;
    border: medium none;
}
.goods-detail-desc .goods-detail-comment .box-hd .title {
    margin: 0px;
}
.goods-detail-desc .goods-detail-comment .box-bd {
    overflow: hidden;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li {
    position: relative;
    margin-top: 30px;
    padding-bottom: 15px;
    border-bottom: 1px solid #DFDFDF;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article {
    padding-left: 110px;
    text-align: left;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_star {
    padding-top: 5px;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_star .leftPart {
    float: left;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_star .rightPart {
    float: right;
    font-size: 12px;
    color: #C3C3C3;
    font-weight: normal;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_content {
    margin-top: 10px;
    font-size: 14px;
    color: #000;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_content a {
    color: #333;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_reply {
    margin-top: 20px;
    padding: 15px;
    background-color: #F3F3F3;
    font-size: 12px;
    color: #8C8C8C;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .article .art_reply i {
    color: #FF4A00;
    line-height: 15px;
    font-style: normal;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .head_photo {
    position: absolute;
    top: 4px;
    left: 0px;
    text-align: center;
    width: 90px;
    display: block;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .head_photo img {
    width: 80px;
    height: 80px;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .content li .head_photo .name {
    font-size: 12px;
    color: #C3C3C3;
    margin-top: 5px;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .more-content {
    text-align: center;
    font-size: 14px;
	margin-top:10px;
}
.goods-detail-desc .goods-detail-comment .box-bd .com-body .more-content a {
    color: #000;
    line-height: 50px;
    height: 50px;
    display: block;
    background-color: #FAFAFA;
}




</style>

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
        	<input type="image" src="images/2015-07-16_170413.png" />
        </a>
        </div>
      
        <div class="search_area">
        	<div class="search_area_left">
        	<form class="search_form" action="" method="get">
            	<input type="search" class="search_text" 
                	   placeholder="搜索您需要的商品" se />                
                <input type="submit"  class="search_submit" value="" />
            	
                <div class="hot_words"> 
                	<a href="#">小米手环</a>
                    <a href="#">耳机</a>
                    <a href="#">插线板</a>
                </div>
            </form>
            </div>
            
            <div class="search_area_right">
            	<a href="cart.jsp" class="search_area_right_cart">
            	<input type="image" 
                	   src="images/2015-07-16_202041.png" />
            	购物车
                </a>
            </div>
        </div>
 <!------------------头部横条导航----------------------->
        <div class="head_container_list">
             <!--全部商品分类-->
        	<div class="all_classification">
            	<a class="a_c_text" href="#">全部商品分类<i><img src="images/2015-07-28_033959.png" /></i></a>
                <div class="classification_list">
                	<ul class="c_l_ul">
                    	<li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	购买手机</a>
                                <div class="class_links">
                                	<a href="#">小米Note</a>
                                    <a href="#">小米4</a>
                                    <a href="#">红米</a>
                                    <a href="#">红米Note</a>
                                </div>
                                <div class="class_children">
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/minote.jpg" />
                                                <span>小米Note</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/mi4.jpg" />
                                                <span>小米手机4</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/redmi2.jpg" />
                                                <span>红米手机2</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/redminote.jpg" />
                                                <span>红米Note</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/heyue.jpg" />
                                                <span>合约机</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/typeacc.jpg" />
                                                <span>根据机型选配件</span>
                                            </a>
                                        </li>
                                       
                                    </ul>
                                	<div class="star_section">
                                    	<h4>明星配件</h4>
                                       	<ul>
                                           <li><a href="#">小米手环 79元</a></li>
                                           <li><a href="#">小米活塞耳机 99元</a></li>
                                        </ul>
                                    </div>
                           
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	购买电视与平板</a>
                                <div class="class_links">
                                	<a href="#">小米电视</a>
                                    <a href="#">小米盒子</a>
                                    <a href="#">小米平板</a>
                                </div>
                                 <div class="class_children" >
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/mitv.jpg" />
                                                <span>小米电视2</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/mibox.jpg" />
                                                <span>小米盒子</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/mipad.jpg" />
                                                <span>小米平板</span>
                                            </a>
                                        </li>
                                    </ul>
                                	<div class="star_section">
                                    	<h4>明星配件</h4>
                                       	<ul>
                                           <li><a href="#">小米电视配件</a></li>
                                           <li><a href="#">小米盒子配件</a></li>
                                           <li><a href="#">小米平板配件</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	路由器与智能硬件</a>
                                <div class="class_links">
                                	<a href="#">路由器</a>
                                    <a href="#">体重秤</a>
                                    <a href="#">净化器与滤芯</a>
                                </div>
                                <div class="class_children special_children">
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1PRJgBmKT1RXrhCrK!40x40.jpg" />
                                                <span>小米路由器</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1bjCTBy_v1RXrhCrK!40x40.jpg" />
                                                <span>小米路由器mini</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1KjZ_B4bT1RXrhCrK!40x40.jpg" />
                                                <span>小米手环</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1tZhQB4KT1RXrhCrK!40x40.jpg" />
                                                <span>运动相机</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1iIhvB7WT1RXrhCrK!40x40.jpg" />
                                                <span>净化器与滤芯</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1t.bgByAT1RXrhCrK!40x40.jpg" />
                                                <span>摄像机</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T18YL_BmLT1RXrhCrK!40x40.jpg" />
                                                <span>血压计</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1XHD_BCxT1RXrhCrK!40x40.jpg" />
                                                <span>智能插座</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1Q_KTByEv1RXrhCrK!40x40.jpg" />
                                                <span>智能灯泡</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1NUYvBCEv1RXrhCrK!40x40.jpg" />
                                                <span>体重秤</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1LMZvBCAT1RXrhCrK!40x40.jpg" />
                                                <span>随身WiFi</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1Eth_BQJT1RXrhCrK!40x40.jpg" />
                                                <span>床头灯</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1s6CvBXKv1RXrhCrK!40x40.jpg" />
                                                <span>智能家庭套装</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1rdd_BvbT1RXrhCrK!40x40.jpg" />
                                                <span>净水器</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	插线板、移动电源与电池</a>
                                <div class="class_links">
                                	<a href="#">小米移动电源</a>
                                    <a href="#">电池</a>
                                    <a href="#">充电器</a>
                                </div>
                                  <div class="class_children" style=" top:auto; bottom:-297px;" >
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T17DxvB4_T1RXrhCrK!40x40.jpg" />
                                                <span>小米移动电源</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T12.CgB4WT1RXrhCrK!40x40.jpg" />
                                                <span>插线板</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1OwLvB5AT1RXrhCrK!40x40.jpg" />
                                                <span>品牌移动电源</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1QJKvBvJT1RXrhCrK!40x40.jpg" />
                                                <span>电池</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1DUEvBKxT1RXrhCrK!40x40.jpg" />
                                                <span>充电器</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1dAAvBKLT1RXrhCrK!40x40.jpg" />
                                                <span>线材</span>
                                            </a>
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	耳机音箱与存储卡</a>
                                <div class="class_links">
                                	<a href="#">小米头戴式耳机</a>
                                    <a href="#">小米活塞耳机</a>
                                </div>
                                 <div class="class_children" style=" top:auto; bottom:-223px;"   >
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" 
                                                src="images/T1CfKTBQZT1RXrhCrK!40x40.jpg" />
                                                <span>小米头戴式耳机</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1DM__B4dT1RXrhCrK!40x40.jpg" />
                                                <span>小米活塞耳机</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1HHVvBKYv1RXrhCrK!40x40.jpg" />
                                                <span>小米蓝牙耳机</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1wwDgB4JT1RXrhCrK!40x40.jpg" />
                                                <span>品牌耳机</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1qjYgBXYT1RXrhCrK!40x40.jpg" />
                                                <span>音箱</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1dmKgB7JT1RXrhCrK!40x40.jpg" />
                                                <span>存储卡</span>
                                            </a>
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	保护套与贴膜</a>
                                <div class="class_links">
                                	<a href="#">保护套/保护壳</a>
                                    <a href="#">贴膜</a>
                                    <a href="#">防尘塞</a>
                                </div>
                                <div class="class_children">
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" 
                                                src="images/T1.qETBXAv1RXrhCrK!40x40.jpg" />
                                                <span>保护套/保护壳</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1uGJvBCdT1RXrhCrK!40x40.jpg" />
                                                <span>贴膜</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1UrhvBjKT1RXrhCrK!40x40.jpg" />
                                                <span>防尘塞</span>
                                            </a>
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	后盖与个性化配件</a>
                                <div class="class_links">
                                	<a href="#">米键</a>
                                    <a href="#">后盖</a>
                                    <a href="#">贴纸</a>
                                    <a href="#">手机支架</a>
                                </div>
                                 <div class="class_children" style="top:auto; bottom:-75px;"   >
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" 
                                                src="images/T1BrhvBbDT1RXrhCrK!40x40.jpg" />
                                                <span>米键</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1d3bvBbKT1RXrhCrK!40x40.jpg" />
                                                <span>后盖</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T14CZgB5hT1RXrhCrK!40x40.jpg" />
                                                <span>贴纸</span>
                                            </a>
                                        </li>
                                          <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T13rCvBjhT1RXrhCrK!40x40.jpg" />
                                                <span>手机支架</span>
                                            </a>
                                        </li>
                                          <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1FvDvB7ET1RXrhCrK!40x40.jpg" />
                                                <span>耳机绕线器</span>
                                            </a>
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </li>
                        <li class="c_l_u_li">
                        	<div class="c_l_u_l_div">
                            	<a class="class_title" href="#">
                                	小米生活方式</a>
                                <div class="class_links">
                                	<a href="#">服装</a>
                                    <a href="#">米兔</a>
                                    <a href="#">背包</a>
                                    <a href="#">生活周边</a>
                                </div>
                                  <div class="class_children" style="top:auto; bottom:-1px;"   >
                                	<ul class="children_list">
                                    	<li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" 
                                                src="images/T1OaD_BTET1RXrhCrK!40x40.jpg" />
                                                <span>服装</span>
                                            </a>
                                        </li>
                                        <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T14DJvBXK_1RXrhCrK!40x40.jpg" />
                                                <span>米兔</span>
                                            </a>
                                        </li>
                                         <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1hlEvB5AT1RXrhCrK!40x40.jpg" />
                                                <span>背包</span>
                                            </a>
                                        </li>
                                          <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T173VvB7KT1RXrhCrK!40x40.jpg" />
                                                <span>小米鼠标垫</span>
                                            </a>
                                        </li>
                                          <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T15SZvB4Av1RXrhCrK!40x40.jpg" />
                                                <span>生活周边</span>
                                            </a>
                                        </li>
                                          <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1aex_BKbT1RXrhCrK!40x40.jpg" />
                                                <span>酷玩频道</span>
                                            </a>
                                        </li>
                                          <li>
                                        	<a class="children_list_a" href="#">
                                            	<img class="children_list_img" src="images/T1pGA_BTET1RXrhCrK!40x40.jpg" />
                                                <span>蓝牙手柄</span>
                                            </a>
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </li>
                	</ul>
                </div>
            </div>
        	
  <!------------------头部横条导航-右边---------------------->     
        	<div class="h_c_l_right">
            	<ul class="clearfix">
                	<li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">首页</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">
                        	小米手机<span class="li_a_img"><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        <div class="head_hidden_show" >
                        	<ul>
                            	<li class="li_one li_first">
                                	<a class="" href="#">
                                    	<span class="span_one">小米Note</span>
                                        <span class="span_two">大屏旗舰，HiFi 双卡双待</span>
                                        <span class="span_three"><b>1999</b>元起 </span>
                                        <span class="span_two">双网通16GB直降300</span>
                                        <span class="span_img"><img src="images/nav-phone-minote.jpg"/></span>
                                    </a>
                                </li>
                               <li class="li_one">
                                	<a class="" href="#">
                                    	<span class="span_one">小米手机4</span>
                                        <span class="span_two">工艺和手感，超乎想象</span>
                                        <span class="span_three"><b>1499</b>元 </span>
                                        <span class="span_two">小米手机4 旗舰特价直降200</span>
                                        <span class="span_img"><img src="images/nav-phone-mi4.jpg"/></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">
                        	红米<span class="li_a_img" ><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        
                         <div class="head_hidden_show">
                        	<ul>
                            	<li class="li_two li_first">
                                	<a class="" href="#">
                                    	 <span class="span_img"><img src="images/nav-phone-hongmi2a-more.jpg"/></span>
                                    	<span class="span_one">红米手机2A 4G版</span>
                                        <span class="span_two">4.7英寸屏 / 联芯四核 / 双卡双待</span>
                                        <span class="span_three">无敌价：<b>499</b>元 </span>
                                       
                                    </a>
                                </li>
                               <li class="li_two">
                                	<a class="" href="#">
                                    <span class="span_img"><img src="images/nav-phone-hongmi2-more.jpg"/></span>
                                    	<span class="span_one">红米手机2 4G版</span>
                                        <span class="span_two">4.7英寸屏 / 64位性能 / 双卡双待</span>
                                        <span class="span_three"><b>599</b>元起，特惠100！ </span>
                                     </a>
                                </li>
                                <li class="li_two">
                                	<a class="" href="#">
                                    	<span class="span_img"><img src="images/nav-phone-hongminote-more.jpg"/></span>
                                    	<span class="span_one">红米Note 4G版</span>
                                        <span class="span_two">5.5英寸屏 / 64位性能 / 双卡双待</span>
                                        <span class="span_three">直降100  <b>699</b>元起 </span>
                                        
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">小米平板</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">
                        	小米电视<span class="li_a_img"><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        
                         <div class="head_hidden_show">
                        	<ul>
                            	<li class="li_TV li_first">
                                	<a class="" href="#">
                                    	 <span class="span_img"><img src="images/nav-phone-mitv40-four.jpg" /></span>
                                    	<span class="span_one">小米电视2 40英寸</span>
                                        <span class="span_three"><b>1999</b>元 </span>
                                       
                                    </a>
                                </li>
                               <li class="li_TV">
                                	<a class="" href="#">
                                    <span class="span_img"><img src="images/nav-phone-mitv48-four.jpg" /></span>
                                    	<span class="span_one">小米电视2S 48英寸</span>
                                        <span class="span_three"><b>2999</b> </span>
                                     </a>
                                </li>
                                <li class="li_TV">
                                	<a class="" href="#">
                                    	<span class="span_img"><img src="images/nav-phone-mitv49-four.jpg" /></span>
                                    	<span class="span_one">小米电视2 49英寸</span>
                                        <span class="span_three"><b>3399</b>元 </span>     
                                    </a>
                                </li>
                                <li class="li_TV">
                                	<a class="" href="#">
                                    	<span class="span_img"><img src="images/nav-phone-mitv55-four.jpg" /></span>
                                    	<span class="span_one">小米电视2 55英寸</span>
                                        <span class="span_three"><b>4499</b>元 </span>     
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">
                        	盒子<span class="li_a_img" ><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        <div class="head_hidden_show">
                        	<ul>
                            	<li class="li_one li_first">
                                	<a class="" href="#">
                                    	<span class="span_one">小米盒子mini版</span>
                                        <span class="span_two">全球最小全高清网络机顶盒</span>
                                        <span class="span_three"><b>199</b>元 </span> 
                                        <span class="span_img"><img src="images/nav-phone-hezimini.jpg"/></span>
                                    </a>
                                </li>
                               <li class="li_one">
                                	<a class="" href="#">
                                    	<span class="span_one">小米盒子 增强版</span>
                                        <span class="span_two">首款4K超高清网络机顶盒</span>
                                        <span class="span_three"><b>299</b>元 </span>  
                                        <span class="span_img"><img src="images/nav-hezis.jpg"/></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">
                        	路由器<span class="li_a_img"><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        <div class="head_hidden_show" >
                        	<ul>
                            	<li class="li_one li_first">
                                	<a class="" href="#">
                                    	<span class="span_one">全新小米路由器</span>
                                        <span class="span_two">顶配企业级性能<br />最高内置6TB监控级硬盘</span>
                                        <span class="span_three"><b>699</b>元起 </span> 
                                        <span class="span_img"><img src="images/nav-miwifi-router.jpg"/></span>
                                    </a>
                                </li>
                               <li class="li_one">
                                	<a class="" href="#">
                                    	<span class="span_one">小米路由器 mini</span>
                                        <span class="span_two">主流双频AC智能路由器<br />性价比之王</span>
                                        <span class="span_three"><b>129</b>元 </span>  
                                        <span class="span_img"><img src="images/T1XsATBCLT1RXrhCrK!160x160.jpg"/></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">合约机</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">服务</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="#">社区</a>
                    </li> 	
                </ul>
               
            </div>
        
        </div>
  <!------------------开放购买----------------------->     
        <div class="open_buy_date">
        	<a href="#">7月21日开放购买</a>
        </div>
    </div>
 <!------------------------------------主体样式---------------------------------------->     
    
<div class="container breadcrumbs clearfix">
    <a href="javascript:void(0)">首页</a><span class="sep">/</span><a href="javascript:void(0)">配件</a><span class="sep">/</span><a href="javascript:void(0)">运动相机</a><span class="sep">/</span><a href="javascript:void(0)">小蚁相机防水壳 都市白</a></div>

<div class="goods-detail container">
    <div class="goods-detail-info row clearfix">
        <div class="span14 J_mi_goodsPic_block">
            <div class="goods-pic-box  " id="J_mi_goodsPicBox">
                <div class="goods-big-pic" >
                    <img src="${productmap.IMAGE}" class="J_goodsBigPic" id="J_BigPic">
                </div>
                                <div class="goods-small-pic clearfix">
                    <ul id="goodsPicList" >
                        <li class="current"><img src="images/T1A_Z_B7LT1RXrhCrK!69x69.jpg"></li><li class=""><img src="images/T1TDC_B7VT1RXrhCrK!69x69.jpg"></li><li class=""><img src="images/T13nZ_BgAT1RXrhCrK!69x69.jpg" ></li><li class=""><img src="images/T12nJ_BvZT1RXrhCrK!69x69.jpg"></li>                    </ul>
                </div>
                                <span class="icon-slides icon-slides-prev" title="上一张" id="goodsPicPrev">上一张</span>
                <span class="icon-slides icon-slides-next" title="下一张" id="goodsPicNext">下一张</span>
                            </div>
        </div>
        <div class="span6 goods-info-rightbox">
           <dl class="goods-info-box ">
            <dt class="goods-info-head">
                <dl>
                    <dt id="goodsName">${productmap.P_NAME}</dt>
                    <dd class="goods-info-head-price clearfix">
                        <div class="left-part">
                                                                                                <b  class="J_mi_goodsPrice">${productmap.MARKET_PRICE}</b><i>&nbsp;元</i>
                                    <del><span class="J_mi_marketPrice"> </span></del>
                                                                                    </div>
                        <div class="right-part">

                        </div>

                    </dd>
                    <dd class="goods-info-head-userfaq">
                        <ul>


                                                       <li class="faq J_pro_related_btns">
                                                                                                       <span class="icon-stat icon-stat-5 J_mi_goods_starNum" data-class="icon-stat-5"></span>
                                    <a href="javascript:void(0)">92人评价</a>
                                                                         <span class="separator">|</span>
                                                                <a href="javascript:void(0)">0个提问</a>
                            </li>

                            <!--特殊提示-->
                            
                            <!--特殊提示-->

                            

                        </ul>
                    </dd>



                                                <dd class="goods-info-head-colors clearfix">
                            <span>可选颜色：</span>
                                <div class="clearfix">
                                                                    <div class="colorli">
                                        <a href="javascript:void(0)" class="coloractive" title="都市白">
                                            <img class="square" src="images/T1A_Z_B7LT1RXrhCrK!25x25.jpg"/>
                                        </a>
                                    </div>

                                                                    <div class="colorli">
                                        <a href="javascript:void(0)" class="" title="丛林绿">
                                            <img class="square" src="images/T1vIK_BgZT1RXrhCrK!25x25.jpg"/>
                                        </a>
                                    </div>

                                                                </div>
                        </dd>
                        
                        
                                <dd class="goods-info-head-cart" id="goodsDetailBtnBox">
                    <a href="javascript:void(0)" id="goodsDetailAddCartBtn" class="btn btn-primary goods-add-cart-btn"  >
                        <i class="iconfont ">+</i>加入购物车</a>
                    <a id="goodsDetailCollectBtn"class="btn btn-dake  goods-collect-btn">
                        <i class="iconfont">&hearts;</i>
                    </a>
                </dd>
                

                </dl>
            </dt>
            <dd class="goods-info-head-intro">
                            </dd>
            <dd class="goods-info-foot">
                <span class="iconfont">&#xe602;</span>
                <a href="javascript:void(0)">查看更多运动相机</a>
            </dd>
        </dl>
        </div>

    </div>
    
<div class="row goods-detail-desc clearfix">
	<div class="span5">
		<div id="goodsRectScan" class="xm-box goods-recent">
            <div class="box-hd">
                <div class="title">最近浏览</div>
            </div>
            <div class="box-bd">
                <ul class="clearfix">
                <c:forEach var="map" items="${hislist}">
                	 <li>
                        <a target="_blank" href="GoodAction?pi_id=${map.P_ID}">
        					<img width="80" height="80" alt="产品名字" src="${map.IMAGE}"></img>
    					</a>
                    </li>
                </c:forEach>
    			</ul>
			</div> 
		</div>
	 </div>
     <div class="span15">
     	<div id="goodsComment" class="xm-box goods-detail-comment ">
    		<div class="box-hd">
        		<div class="title">用户评价</div>
    		</div>
    		<div id="J_goods_detail_comment" class="box-bd">
    			<div class="com-body">
        			<ul class="content J_goods_detail_comment_content">
            			<li>
                            <div class="article">
                                <h3 class="art_star clearfix">
                                    <div class="leftPart">
                                        <span class="icon-stat icon-stat-5"></span>
                                    </div>
                                    <div class="rightPart"> 2015-06-19</div>
                                </h3>
                                <div class="art_content">
                                    <a href="" target="_blank">米粉不解释 米粉不解释</a>
                                </div>
                                
                                <div class="art_reply">
                                    <i>官方回复：</i>
            						一切尽在不言中，我懂的~感谢您对小米的支持
                                </div>
                            </div>
                            <div class="head_photo">
                                <a href="" target="_blank">
                                    <img alt="" src="images/photo.jpg"></img>
                                </a>
                                <a href="" target="_blank">
                                    <h3 class="name"> 米聊米笑</h3>
                                </a>
                            </div>
                        </li>
                                  			<li>
                            <div class="article">
                                <h3 class="art_star clearfix">
                                    <div class="leftPart">
                                        <span class="icon-stat icon-stat-5"></span>
                                    </div>
                                    <div class="rightPart"> 2015-06-19</div>
                                </h3>
                                <div class="art_content">
                                    <a href="" target="_blank">米粉不解释 米粉不解释</a>
                                </div>
                                
                                <div class="art_reply">
                                    <i>官方回复：</i>
            						一切尽在不言中，我懂的~感谢您对小米的支持
                                </div>
                            </div>
                            <div class="head_photo">
                                <a href="" target="_blank">
                                    <img alt="" src="images/photo.jpg"></img>
                                </a>
                                <a href="" target="_blank">
                                    <h3 class="name"> 米聊米笑</h3>
                                </a>
                            </div>
                        </li>
        			</ul>
                	<div class="more-content J_goods_detail_comment_more">
                    	<a target="_blank" href="">查看全部评价 ></a>
                	</div>
        		</div>
    		</div>
		</div>
	</div>
</div>
    
    
    
    
    
    
</div>
    
<!------------------------------------底部样式---------------------------------------->      
    
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
