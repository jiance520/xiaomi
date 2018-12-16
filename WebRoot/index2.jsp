<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.action.*,com.dao.*,com.entity.*,com.service.*,com.dao.impl.*,com.service.impl.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ include file="loginControl.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小米官网——小米手机、红米手机、小米电视官方正品专卖网站</title>
<link type="text/css" rel="stylesheet" href="css/homepage.css" />
<link rel="shortcut icon" href="images/favicon.ico" /> 
<style type="text/css">

</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/homepage.js"></script>
<script type="text/javascript">
	$(function(){
/* 		$(" ").click(function(){
			$.post(" ",{ },function(data){
				
			},"text");
		}); */
	})
</script>
</head>

<body class="homepage_body">
<!----------------------------主页头部--------------------------------------------------->
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
            
            <div class="head_top_right_user">
            	欢迎您
                <a class="userName" href="javascript:void(0);">
                	盗者心生
                    <span class="userName_icon"></span>
                </a>
                <span>|</span>
                <a href="javascript:void(0);">我的订单</a>
                <span>|</span>
                <a href="javascript:void(0);">我的小米账户</a>
                <div class="user_ul">
                	<ul class="list">
                	<li><a href="javascript:void(0)">个人中心</a></li>
                    <li><a href="javascript:void(0)">我的收藏</a></li>
                    <li><a href="javascript:void(0)">退出登录</a></li>
                	</ul>
                    <span class="list_icon">
                    	<input type="image" src="images/2015-07-16_160538.png" />
                    </span>
                </div>
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
                	<a href="javascript:void(0)">小米手环</a>
                    <a href="javascript:void(0)">耳机</a>
                    <a href="javascript:void(0)">插线板</a>
                </div>
            </form>
            </div>
            
            <div class="search_area_right">
            	<a href="cart.jsp" class="search_area_right_cart">
            	<img src="images/2015-07-16_202041.png" />
            	购物车
                </a>
            </div>
        </div>
 <!------------------头部横条导航----------------------->
        <div class="head_container_list">
             <!--全部商品分类-->
        	<div class="all_classification">
            	<a class="a_c_text" href="javascript:void(0)">全部商品分类<i style="display:none"><img src="images/2015-07-28_033959.png" /></i></a>
                <div class="classification_list">
                	<div class="c_l_ul">
	                	<c:forEach var="cate" items="${cateList_p}">
	                    	<div class="c_l_u_li">
	                        	<div class="c_l_u_l_div">
	                            	<a class="class_title" href="javascript:void(0)">
	                                	${cate.C_NAME}</a>
	                                <div class="class_links">
	                                	<c:forEach begin="1" end="2" var="map" items="${cate.cateList_s}">
											<a href="javascript:void(0)">${map.C_NAME}</a>
										</c:forEach>
	                                </div>
	                                <div class="class_children">
	                                	<div class="children_list">
		                                	<c:forEach var="map" items="${cate.cateList_s}">
		                                    	<div>
		                                        	<a class="children_list_a" href="javascript:void(0)">
		                                            	<img class="children_list_img" src="${map.C_FILE_NAME}" />
		                                                <span>${map.C_NAME}</span>
		                                            </a>
		                                        </div>
		                                    </c:forEach>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                	</div>
                </div>
            </div>
        	
  <!------------------头部横条导航-右边---------------------->     
        	<div class="h_c_l_right">
            	<ul class="">
                	<li class="h_c_l_r_li">
                    	<a class="li_a_text" href="javascript:void(0)">首页</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="javascript:void(0)">
                        	小米手机<span class="li_a_img"><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        <div class="head_hidden_show" >
                        	<ul>
                            	<li class="li_one li_first">
                                	<a class="" href="javascript:void(0)">
                                    	<span class="span_one">小米Note</span>
                                        <span class="span_two">大屏旗舰，HiFi 双卡双待</span>
                                        <span class="span_three"><b>1999</b>元起 </span>
                                        <span class="span_two">双网通16GB直降300</span>
                                        <span class="span_img"><img src="images/nav-phone-minote.jpg"/></span>
                                    </a>
                                </li>
                               <li class="li_one">
                                	<a class="" href="javascript:void(0)">
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
                    	<a class="li_a_text" href="javascript:void(0)">
                        	红米<span class="li_a_img" ><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        
                         <div class="head_hidden_show">
                        	<ul>
                            	<li class="li_two li_first">
                                	<a class="" href="javascript:void(0)">
                                    	 <span class="span_img"><img src="images/nav-phone-hongmi2a-more.jpg"/></span>
                                    	<span class="span_one">红米手机2A 4G版</span>
                                        <span class="span_two">4.7英寸屏 / 联芯四核 / 双卡双待</span>
                                        <span class="span_three">无敌价：<b>499</b>元 </span>
                                       
                                    </a>
                                </li>
                               <li class="li_two">
                                	<a class="" href="javascript:void(0)">
                                    <span class="span_img"><img src="images/nav-phone-hongmi2-more.jpg"/></span>
                                    	<span class="span_one">红米手机2 4G版</span>
                                        <span class="span_two">4.7英寸屏 / 64位性能 / 双卡双待</span>
                                        <span class="span_three"><b>599</b>元起，特惠100！ </span>
                                     </a>
                                </li>
                                <li class="li_two">
                                	<a class="" href="javascript:void(0)">
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
                    	<a class="li_a_text" href="javascript:void(0)">小米平板</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="javascript:void(0)">
                        	小米电视<span class="li_a_img"><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        
                         <div class="head_hidden_show">
                        	<ul>
                            	<li class="li_TV li_first">
                                	<a class="" href="javascript:void(0)">
                                    	 <span class="span_img"><img src="images/nav-phone-mitv40-four.jpg" /></span>
                                    	<span class="span_one">小米电视2 40英寸</span>
                                        <span class="span_three"><b>1999</b>元 </span>
                                       
                                    </a>
                                </li>
                               <li class="li_TV">
                                	<a class="" href="javascript:void(0)">
                                    <span class="span_img"><img src="images/nav-phone-mitv48-four.jpg" /></span>
                                    	<span class="span_one">小米电视2S 48英寸</span>
                                        <span class="span_three"><b>2999</b> </span>
                                     </a>
                                </li>
                                <li class="li_TV">
                                	<a class="" href="javascript:void(0)">
                                    	<span class="span_img"><img src="images/nav-phone-mitv49-four.jpg" /></span>
                                    	<span class="span_one">小米电视2 49英寸</span>
                                        <span class="span_three"><b>3399</b>元 </span>     
                                    </a>
                                </li>
                                <li class="li_TV">
                                	<a class="" href="javascript:void(0)">
                                    	<span class="span_img"><img src="images/nav-phone-mitv55-four.jpg" /></span>
                                    	<span class="span_one">小米电视2 55英寸</span>
                                        <span class="span_three"><b>4499</b>元 </span>     
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="javascript:void(0)">
                        	盒子<span class="li_a_img" ><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        <div class="head_hidden_show">
                        	<ul>
                            	<li class="li_one li_first">
                                	<a class="" href="javascript:void(0)">
                                    	<span class="span_one">小米盒子mini版</span>
                                        <span class="span_two">全球最小全高清网络机顶盒</span>
                                        <span class="span_three"><b>199</b>元 </span> 
                                        <span class="span_img"><img src="images/nav-phone-hezimini.jpg"/></span>
                                    </a>
                                </li>
                               <li class="li_one">
                                	<a class="" href="javascript:void(0)">
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
                    	<a class="li_a_text" href="javascript:void(0)">
                        	路由器<span class="li_a_img"><img src="images/2015-07-18_171607.png" /></span>
                        </a>
                        <div class="head_hidden_show" >
                        	<ul>
                            	<li class="li_one li_first">
                                	<a class="" href="javascript:void(0)">
                                    	<span class="span_one">全新小米路由器</span>
                                        <span class="span_two">顶配企业级性能<br />最高内置6TB监控级硬盘</span>
                                        <span class="span_three"><b>699</b>元起 </span> 
                                        <span class="span_img"><img src="images/nav-miwifi-router.jpg"/></span>
                                    </a>
                                </li>
                               <li class="li_one">
                                	<a class="" href="javascript:void(0)">
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
                    	<a class="li_a_text" href="javascript:void(0)">合约机</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="javascript:void(0)">服务</a>
                    </li>
                    <li class="h_c_l_r_li">
                    	<a class="li_a_text" href="javascript:void(0)">社区</a>
                    </li> 	
                </ul>
               
            </div>
        
        </div>
  <!------------------开放购买----------------------->     
        <div class="open_buy_date">
        	<a href="javascript:void(0)">7月21日开放购买</a>
        </div>
    </div>


<!----------------------------主页主体--------------------------------------------------->


<div class="homepage">

	<div class="homepage_show clearfix">
    	<div class="show_container">
        	<div>
            	<div class="big_img">
                	<div class="big_img_con">
                    	<div class="b_i_c">
                        	<div class="img_show" style="display:block;">
                            	<a href="javascript:void(0)">
                                	<img src="images/index.png" />
                                </a>
                            </div>
                            <div class="img_show" >
                            	<a href="javascript:void(0)">
                                	<img src="images/index1.png" />
                                </a>
                            </div>
                            <div class="img_show">
                            	<a href="javascript:void(0)">
                                	<img src="images/index2.png" />
                                </a>
                            </div>
                            <div class="img_show">
                            	<a href="javascript:void(0)">
                                	<img src="images/index3.png" />
                                </a>
                            </div>
                            <div class="img_show">
                            	<a href="javascript:void(0)">
                                	<img src="images/index4.png" />
                                </a>
                            </div>
                    	</div>
                    </div>
                    <a class="last_img"></a>
                    <a class="next_img"></a>
                    <ul class="row_num">
                    	<li><a href="javascript:void(0)" style="background-color:rgba(0, 0, 0, 0.6)">1</a></li>
                        <li><a href="javascript:void(0)">2</a></li>
                        <li><a href="javascript:void(0)">3</a></li>
                        <li><a href="javascript:void(0)">4</a></li>
                        <li><a href="javascript:void(0)">5</a></li>
                    </ul>
                </div>
            </div>
            <div class="little_img clearfix">
            	<div class="three_img three_img_first">
                	<a href="javascript:void(0)">
                    	<img src="images/T1H1Y_B_CT1RXrhCrK.jpg" />
                    </a>
            	</div>
                <div class="three_img">
                	<a href="javascript:void(0)">
                    	<img src="images/T1sxVvBQxT1RXrhCrK.jpg" />
                    </a>
            	</div>
                <div class="three_img">
                	<a href="javascript:void(0)">
                    	<img src="images/T1StY_B_xT1RXrhCrK.jpg" />
                    </a>
            	</div>
            </div>
    	</div>
    </div>
    
    <div class="home_star_goods">
    	<div class="xm_plain_box"> 
        	<div class="box_hd">
            	<h3 class="title">
                	小米明星单品
                    <a class="acc_link" href="javascript:void(0)">根据机型选配件</a>
                </h3>
            	<div class="more clearfix">
                	<div class="xm_recommend_page clearfix">
                		<a class="to_left" href="javascript:void(0)">&lt;</a>
                    	<a class="to_right" href="javascript:void(0)">&gt; </a>
                	</div>
                </div>
            </div>
        	
            <div class="box_bd">
            	<div class="star_img_row">
                	<div class="img_row clearfix">
                    	<div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1GqdTByYv1RXrhCrK!220x220.jpg" />
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小米电视2 全系列
                                  </a>
                                </span>
                              </span>
                              <span class="item_content_info">40/49/55英寸 现货购买</span>
                            </div>
                        </div>
                        
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1m1_TBshT1RXrhCrK!220x220.jpg" />
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小米平板
                                  </a>
                                </span>
                              </span>
                              <span class="item_content_info">全球首款搭载 NVIDIA Tegra K1 处理器平板</span>
                            </div>
                        </div>
                        
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1BUKvBjbT1RXrhCrK!220x220.jpg"/>
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小米盒子增强版 1G
                                  </a>
                                 </span>
                              </span>
                              <span class="item_content_info">首款4K超高清网络机顶盒</span>
                            </div>
                        </div>
                        
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T13jAjB4ET1RXrhCrK!220x220.jpg"/>
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      全新小米路由器
                                  </a>
                                <span class="item_title">
                              </span>
                              <span class="item_content_info">顶配企业级性能，最高内置6TB监控级硬盘</span>
                            </div>
                        </div>
                        
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1GQATBQbT1RXrhCrK!220x220.jpg"/>
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小米头戴式耳机
                                  </a>
                                 <span class="item_title">
                              </span>
                              <span class="item_content_info">50mm大尺寸航天金属振膜</span>
                            </div>
                        </div>
                        
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1unE_BXLT1RXrhCrK!220x220.jpg"/>
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小米路由器 mini
                                  </a>
                                </span>
                              </span>
                              <span class="item_content_info">主流双频AC智能路由器，性价比之王</span>
                            </div>
                        </div>
                          
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1o3Z_BKET1RXrhCrK!220x220.jpg"/>
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小蚁智能摄像机
                                  </a>
                                </span>
                              </span>
                              <span class="item_content_info">能看能听能说，手机远程观看</span>
                            </div>
                        </div>
                        
                        <div class="star_goods_item">
                        	<div class="item_content">
                              <span class="item_content_img">
                                  <a href="javascript:void(0)">
                                      <img src="images/T1ggWQBybT1RXrhCrK!220x220.jpg"/>
                                  </a>
                              </span>
                              <span class="item_content_link">
                              	<span class="item_title">
                                  <a href="javascript:void(0)">
                                      小米移动电源10000mAh
                                  </a>
                                </span>
                              </span>
                              <span class="item_content_info">松下/LG高密度进口电芯</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="home_new_goods">
    	<div class="xm_plain_box">
        	<div class="box_hd">
            	<h3 class="title">
                	新品上架
                </h3>
                <div class="more">
                	<a class="more_link" href="javascript:void(0)">更多  <i>&gt;</i></a>
                </div>
            </div>
        	
        	<div class=" box_bd">
            	<div class="row clearfix">
                
                	<div class="new_good_left col">
                    	<div class="brick_list clearfix">
                        	<div class="brick_item brick_item_1">
                            	<div class="item">
                                	<div class="item_content">
                                    	<a href="javascript:void(0)">
                                        	<span class="item_thumb">
                                            	<img src="images/T1gOCQB4LT1RXrhCrK.jpg" />
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="brick_item brick_item_m">
                            	<div class="item">
                                	<div class="item_content">
                                    	<span class="item_info">
                                        	<span class="item_title"><a href="javascript:void(0)">小米空气净化器</a></span>
                                            <span class="item_price">899元</span>
                                        </span>
                                    	<span class="item_thumb">
                                    		<a href="javascript:void(0)">
                                            	<img src="images/T1XYxTBsAT1RXrhCrK!220x220.jpg" />
                                          	</a>
                                        </span>
                                        <span class="item_flag">
                                        	<span class="icon_flag">包邮</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="brick_item brick_item_m">
                            	<div class="brick_item brick_item_s">
                                    <div class="item  clearfix">
                                        <div class="item_content  clearfix"  >
                                            <span class="item_info">
                                                <span class="item_title"><a href="javascript:void(0)">小蚁运动相机</a></span>
                                                <span class="item_price">399元</span>
                                            </span>
                                            <span class="item_thumb">
                                                <a href="javascript:void(0)">
                                                    <img src="images/T1l0ZvBydv1RXrhCrK!220x220.jpg"/>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="brick_item brick_item_s">
                                    <div class="item clearfix">
                                        <div class="item_content">
                                            <span class="item_info">
                                                <span class="item_title"><a href="javascript:void(0)">小米智能插座</a></span>
                                                <span class="item_price">59元</span>
                                            </span>
                                            <span class="item_thumb">
                                                <a href="javascript:void(0)">
                                                    <img src="images/T1PxJvBCAT1RXrhCrK!220x220.jpg"/>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="brick_item brick_item_m">
                            	<div class="item">
                                	<div class="item_content">
                                    	<span class="item_info">
                                        	<span class="item_title"><a href="javascript:void(0)">小米活塞耳机青春版</a></span>
                                            <span class="item_price">49元</span>
                                        </span>
                                    	<span class="item_thumb">
                                    		<a href="javascript:void(0)">
                                            	<img src="images/T11ZYgBmZT1RXrhCrK!220x220.jpg" />
                                          	</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
							
                            <div class="brick_item brick_item_m">
                            	<div class="item">
                                	<div class="item_content">
                                    	<span class="item_info">
                                        	<span class="item_title"><a href="javascript:void(0)">小米水质TDS检测笔</a></span>
                                            <span class="item_price">39元</span>
                                        </span>
                                    	<span class="item_thumb">
                                    		<a href="javascript:void(0)">
                                            	<img src="images/T19OV_BgKT1RXrhCrK!220x220.jpg" />
                                          	</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="brick_item brick_item_m">
                            	<div class="item">
                                	<div class="item_content">
                                    	<span class="item_info">
                                        	<span class="item_title"><a href="javascript:void(0)">小米体重秤</a></span>
                                            <span class="item_price">99元</span>
                                        </span>
                                    	<span class="item_thumb">
                                    		<a href="javascript:void(0)">
                                            	<img src="images/T1sWd_B7VT1RXrhCrK!220x220.jpg" />
                                          	</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="brick_item brick_item_m">
                            	<div class="item">
                                	<div class="item_content">
                                    	<span class="item_info">
                                        	<span class="item_title"><a href="javascript:void(0)">小米移动电源16000mAh</a></span>
                                            <span class="item_price">129元</span>
                                        </span>
                                    	<span class="item_thumb">
                                    		<a href="javascript:void(0)">
                                            	<img src="images/T1pOWvBKET1RXrhCrK!220x220.jpg" />
                                          	</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="brick_item brick_item_m">
                            	<div class="item">
                                	<div class="item_content">
                                    	<span class="item_info">
                                        	<span class="item_title"><a href="javascript:void(0)">小米蓝牙手柄</a></span>
                                            <span class="item_price">99元</span>
                                        </span>
                                    	<span class="item_thumb">
                                    		<a href="javascript:void(0)">
                                            	<img src="images/T1WTEvBmKT1RXrhCrK!220x220.jpg" />
                                          	</a>
                                        </span>
                                    </div>
                                </div>
                            </div>                            
                            
                    	</div>
                    </div>
                    
                    <div class="new_good_right col">
                    	<div class="channel_section">
                        	<ul class="channel_list">
                            	<li>
                                	<a target="_blank" href="javascript:void(0)">
                                    	<span class="item_info">
                                        	<span class="item_title">全网通现货购买</span>
                                            <span class="item_desc">中信白金卡专享</span>
                                        </span>
                                        <span class="item_thumb">
                                        	<img src="images/T1koxQBCCT1RXrhCrK.jpg" />
                                        </span>
                                    </a>
                                </li>
                                
                                <li>
                                	<a target="_blank" href="javascript:void(0)">
                                    	<span class="item_info">
                                        	<span class="item_title">特惠配件套装</span>
                                            <span class="item_desc">手机必备配件组合购买<br />实惠更优惠</span>
                                        </span>
                                        <span class="item_thumb">
                                        	<img src="images/channel-list-cool.jpg"/>
                                        </span>
                                    </a>
                                </li>
                                
                                <li>
                                	<a target="_blank" href="javascript:void(0)">
                                    	<span class="item_info">
                                        	<span class="item_title">49元自拍神器</span>
                                            <span class="item_desc">蓝牙无线连接，仅150克<br />雷总同款自拍杆</span>
                                        </span>
                                        <span class="item_thumb">
                                        	<img src="images/channel-list-new-20150513.jpg"/>
                                        </span>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                        
                        <div class="news_section">
                        	<ul>
                            	<li class="first">
                                	<a href="javascript:void(0)">企业用户采购通道<i class="iconfont">&gt;</i></a>
                                 </li>
                                 <li>
                                	<a href="javascript:void(0)">小米手机防伪查询<i class="iconfont">&gt;</i></a>
                                 </li>
                                 <li>
                                	<a href="javascript:void(0)">小米手机官翻版<i class="iconfont">&gt;</i></a>
                                 </li>
                                 <li>
                                	<a href="javascript:void(0)">小米路由器官翻版<i class="iconfont">&gt;</i></a>
                                 </li>
                                 <li>
                                	<a href="javascript:void(0)">F码购买通道<i class="iconfont">&gt;</i></a>
                                 </li>
                            </ul>
                        </div>
                        
                        <div class="recharge_section">
                        	<h3>话费充值<span class="xm_charge_tips"></span></h3>
                            <form class="xm_recharge_form" action="javascript:void(0)">
                            <fieldset class="xm_recharge_tel">
                            	<input type="tel" id="rechargeTel"
                                autocomplete="off" placeholder="请输入手机号码" name="rechargeTel" />
                            </fieldset>
                            <fieldset class="xm_recharge_amount">
                            	<div class="xm_select">
                            		<div class="dropdown_text">50元</div>
                                    <ul class="dropdown_menu">
                                    	<li><span>100元</span></li>
                                        <li><span>30元</span></li>
                                        <li><span>50元</span></li>
                                    </ul>
                                    
                                    <span class="arrow_down"></span>
                                </div>
                            </fieldset>
                            <fieldset class="xm_recharge_price">
                            	<span class="fileddset_name">实付价格：</span>
                            	<span id="rechargePrice" class="filedset_text"><span>49.2</span>元起</span>
                            </fieldset>
                            <fieldset class="xm_recharge_submit">
                            	<input type="submit" class="btn_recharge_submit" value="立即充值"/>
                            </fieldset>
                            </form>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    
    <div class="home_hot_goods">
    	<div class="xm_plain_box">
        	<div class="box_hd">
            	<h3 class="title">
                	大家都喜欢
                </h3>
            </div>
        	
        	<div class=" box_bd">
            	<div class="row clearfix">
                
                	<div class="new_good_left col">
                    	<div class="brick_list clearfix">
                        	<div class="brick_item brick_item_1">
                            	<div class="item">
                                	<div class="item_content">
                                    	<a href="javascript:void(0)">
                                        	<span class="item_thumb">
                                            	<img src="images/T18SYvBbAT1RXrhCrK.jpg" />
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            
	                            <c:forEach var="map" items="${product_list_sc}">
		                            <div class="brick_item brick_item_m">
		                            	<div class="item">
		                                	<div class="item_content">
		                                    	<span class="item_info">
		                                        	<span class="item_title"><a href="javascript:void(0)">${map.P_NAME}</a></span>
		                                            <span class="item_price">${map.SHOP_PRICE}元</span>
		                                        </span>
		                                    	<span class="item_thumb">
		                                    		<a href="GoodAction?p_id=${map.P_ID}">
		                                            	<img src="${map.IMAGE}" />
		                                          	</a>
		                                        </span>
		                                    </div>
		                                </div>
		                            </div>
	                            </c:forEach>
                            
                    	</div>
                    </div>
                    
                    <div class="new_good_right col">
                    	<div class="board_section">
                        	<h3><span>HOT</span>热销商品排行</h3>
                            <ul class="board_list">
                            	<li class="top">
                                	<span class="item_info">
                                    	<span class="item_title"><a href="javascript:void(0)">小米随身WIFI U盘版</a></span>
                                        <span class="item_price">49.9元</span>
                                    </span>
                                    <span class="item_thumb"><a href="javascript:void(0)"><img src="images/T1RsL_BXdT1RXrhCrK!220x220.jpg" /></a></span>
                                    <span class="item_num">1</span>
                                </li>
                            	<li class="top">
                                	<span class="item_info">
                                    	<span class="item_title"><a href="javascript:void(0)">小米LED随身灯</a></span>
                                        <span class="item_price">19.9元</span>
                                    </span>
                                    <span class="item_thumb"><a href="javascript:void(0)"><img src="images/T1mxh_BvxT1RXrhCrK!220x220.jpg"/></a></span>
                                    <span class="item_num">2</span>
                                </li>
                                <li class="top">
                                	<span class="item_info">
                                    	<span class="item_title"><a href="javascript:void(0)">米兔便利贴</a></span>
                                        <span class="item_price">4.9元</span>
                                    </span>
                                    <span class="item_thumb"><a href="javascript:void(0)"><img src="images/T1_B_vB_bT1RXrhCrK.jpg"/></a></span>
                                    <span class="item_num">3</span>
                                </li>
                                <li>
                                	<span class="item_info">
                                    	<span class="item_title"><a href="javascript:void(0)">米键</a></span>
                                        <span class="item_price">4.9元</span>
                                    </span>
                                    <span class="item_thumb"><a href="javascript:void(0)"><img src="images/T1QQx_B_AT1RXrhCrK.jpg"/></a></span>
                                    <span class="item_num">4</span>
                                </li>
                                <li>
                                	<span class="item_info">
                                    	<span class="item_title"><a href="javascript:void(0)">小米随身风扇</a></span>
                                        <span class="item_price">19.9元</span>
                                    </span>
                                    <span class="item_thumb"><a href="javascript:void(0)"><img src="images/T1omEQB4dT1RXrhCrK!220x220.jpg"/></a></span>
                                    <span class="item_num">5</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       
    <div class="home_comment_goods">
    	<div class="xm_plain_box">
        	<div class="box_hd">
            	<h3 class="title">
                	热评产品
                </h3>
            </div>
        	
        	<div class=" box_bd">
            
            	<div class="xm_commented_goods_list_wrap">
                	<div class="xm_commented_goods_list clearfix">
	                    <c:forEach var="map" items="${product_list_rp}">
	       					<div class="xm_commented_goods_item J_commmentedGoods">
	                  			<div class="item_content">
	                            	<span class="item_info">
	                                	<span class="item_title">
	                                    	<a href="javascript:void(0)">${map.P_NAME}</a>
	                                    </span>
	                                    <span class="item_meta">
	                                    	<span class="icon_stat icon_stat_5"></span>
	                                        <span class="sep">|</span>
	                                        ${map.P_COMMENT}人好评
	                                    </span>
	                                    <span class="item_price">${map.SHOP_PRICE}元</span>
	                                </span>
	                                <span class="item_thumb">
	                                	<a href="GoodAction?p_id=${map.P_ID}"><img src="${map.IMAGE}" /></a>
	                                </span>
	                                <span class="item_comment">${map.co_content}</span>
	                                <c:if test="${map.POSTAGE==1}">
	                                	<span class="item_flag">
                                     		<span class="icon_flag">包邮</span>
                                		</span>
	                                </c:if>
	                            </div>
	                        </div>
	                    </c:forEach>   
	                     
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    
    <div class="home_comment_goods home_saleoff_goods">
    	<div class="xm_plain_box">
        	<div class="box_hd">
            	<h3 class="title">
                	特价产品
                </h3>
            </div>
        	
        	<div class=" box_bd">
            	<div class="xm_commented_goods_list_wrap home_saleoff_goods_list_wrap">
                	<div class="xm_commented_goods_list clearfix">
                	
	                    <c:forEach var="map" items="${product_list_tj}">
	                    	<div class="xm_commented_goods_item">
	                        	<div class="item_content">
	                            	<span class="item_title">
	                                   <a href="javascript:void(0)">${map.P_NAME}</a>
	                                </span>
	                                <span class="item_price">${map.SHOP_PRICE}元<del>${map.MARKET_PRICE}元</del></span>
	                                
	                                <span class="item_thumb">
	                                	<a href="GoodAction?p_id=${map.P_ID}"><img src="${map.IMAGE}" /></a>
	                                </span>
									<span class="item_flag">
	                                    <span class="icon_flag">省${map.MARKET_PRICE-map.SHOP_PRICE}元</span>
	                                </span>
	                            </div>
	                         </div>
	                    </c:forEach>     
                         
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    
    <div class="home_comment_goods home_duokan_goods">
    	<div class="xm_plain_box">
        	<div class="box_hd">
            	<h3 class="title">
                	多看图书
                </h3>
                <div class="more">
                	<a class="more_link" href="javascript:void(0)">更多  <i>&gt;</i></a>
                </div>
            </div>
        	
        	<div class=" box_bd">
            	<div class="xm_commented_goods_list_wrap">
                	<div class="xm_commented_goods_list clearfix">
                    
                    	<div class="xm_commented_goods_item J_commmentedGoods">
                        	<div class="item_content">
                            	<span class="item_info">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">无声告白</a>
                                    </span>
                                    <span class="item_author">&nbsp;【美】伍绮诗</span>
                                    <span class="item_price">&nbsp;18元<del>25元</del></span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T1yyCgBgxT1RXrhCrK.jpg"/></a>
                                </span>
                                <span class="item_comment">2014美国年度图书NO.1，我们终此一生，就是要摆脱他人的期待，找到真正的自己。</span>
                            </div>
                        </div>
                        
                        <div class="xm_commented_goods_item J_commmentedGoods">
                        	<div class="item_content">
                            	<span class="item_info">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">你一年的8760小时</a>
                                    </span>
                                    <span class="item_author">&nbsp;艾力</span>
                                    <span class="item_price">&nbsp;4.99元<del>18元</del></span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T19jY_BKCT1RXrhCrK.jpg"/></a>
                                </span>
                                <span class="item_comment">你一年的8760小时 『奇葩说』最具正能量的“男神级演讲天才”艾力首部力作！</span>
                            </div>
                        </div>
                        
                        <div class="xm_commented_goods_item J_commmentedGoods">
                        	<div class="item_content">
                            	<span class="item_info">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">52个改变</a>
                                    </span>
                                    <span class="item_author">&nbsp;Leo Babauta</span>
                                    <span class="item_price">&nbsp;免费</span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T1m1x_BvLT1RXrhCrK.jpg"/></a>
                                </span>
                                <span class="item_comment">52个改变 想让自己变得更好，那就从本书开始吧！</span>
                            </div>
                        </div>
                        
                        <div class="xm_commented_goods_item J_commmentedGoods">
                        	<div class="item_content">
                            	<span class="item_info">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">我是猫（夏目漱石著）</a>
                                    </span>
                                    <span class="item_author">&nbsp;【日】夏目漱石</span>
                                    <span class="item_price">&nbsp;8.99元<del>12元</del></span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T1sih_BTLT1RXrhCrK.jpg"/></a>
                                </span>
                                <span class="item_comment">人类一思考，猫君就发笑，史上最会“吐槽”的猫！</span>
                            </div>
                        </div>
                    
                   	</div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="home_comment_goods home_miui_goods">
    	<div class="xm_plain_box">
        	<div class="box_hd">
            	<h3 class="title">
                	MIUI主题
                </h3>
                <div class="more">
                	<a class="more_link" href="javascript:void(0)">更多  <i>&gt;</i></a>
                </div>
            </div>
        	
        	<div class=" box_bd">
            	<div class="xm_commented_goods_list_wrap">
                	<div class="xm_commented_goods_list clearfix">
                    
                    	<div class="xm_commented_goods_item">
                        	<div class="item_content">
                            	<span class="item_info" style="height:42px;">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">watch OS </a>
                                    </span>
                                    <span class="item_price">6米币</span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T18Gx_BKCT1RXrhCrK.jpg" /></a>
                                </span>
                            </div>
                        </div>
                        
                        <div class="xm_commented_goods_item">
                        	<div class="item_content">
                            	<span class="item_info" style="height:42px;">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">【好评返现】花千骨 </a>
                                    </span>
                                    <span class="item_price">6米币</span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T15IC_BgZT1RXrhCrK.jpg" /></a>
                                </span>
                            </div>
                        </div>
                        
                        <div class="xm_commented_goods_item">
                        	<div class="item_content">
                            	<span class="item_info" style="height:42px;">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">因为一个人爱上一座城 </a>
                                    </span>
                                    <span class="item_price">6米币</span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T1gvE_BvET1RXrhCrK.jpg" /></a>
                                </span>
                            </div>
                        </div>
                        
                        <div class="xm_commented_goods_item">
                        	<div class="item_content">
                            	<span class="item_info" style="height:42px;">
                                	<span class="item_title">
                                    	<a href="javascript:void(0)">九龙战</a>
                                    </span>
                                    <span class="item_price">免费</span>
                                </span>
                                <span class="item_thumb">
                                	<a href="javascript:void(0)"><img src="images/T1YAV_BgCT1RXrhCrK.jpg"/></a>
                                </span>
                            </div>
                        </div>
            		
                    
                    </div>
                </div>
            </div>
        </div>
    
    </div>

</div>
<!---------------------------------主页底部--------------------------------------------->


<div class="foot_body">
	<div class="foot_container">
    	<div class="foot_up">
        	<ul class="clearfix">
            	<li>
                	<a class="foot_up_a" href="javascript:void(0)">
                    	<span><img src="images/2015-07-19_085552.png" /></span>
                        <strong>1小时快修服务</strong>
                    </a>
                </li>
                <li>
                	<a class="foot_up_a" href="javascript:void(0)">
                    	<span><img src="images/2015-07-19_085448.png" /></span>
                        <strong>7天无理由退货</strong>
                    </a>
                    
                </li>
                <li>
                	<a class="foot_up_a" href="javascript:void(0)">
                    	<span><img src="images/2015-07-19_085038.png" /></span>
                        <strong>15天免费换货</strong>
                    </a>
                </li>
                <li>
                    <a class="foot_up_a" href="javascript:void(0)">
                    	<span><img src="images/2015-07-19_085120.png" /></span>
                        <strong>满150元包邮</strong>
                    </a>
                </li>
                <li>
                	<a class="foot_up_a" href="javascript:void(0)">
                    	<span><img src="images/2015-07-19_085351.png" /></span>
                        <strong>520余家售后网点</strong>
                    </a>
                </li>
            </ul>
        </div>
        
        <div class="foot_middle clearfix">
        	<dl class="foot_middle_dl dl_first">
            	<dt>帮助中心</dt>
                <dd><a class="" href="javascript:void(0)">购物指南</a></dd>
                <dd><a class="" href="javascript:void(0)">支付方式</a></dd>
                <dd><a class="" href="javascript:void(0)">配送方式</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>服务支持</dt>
                <dd><a class="" href="javascript:void(0)">售后政策</a></dd>
                <dd><a class="" href="javascript:void(0)">自助服务</a></dd>
                <dd><a class="" href="javascript:void(0)">相关下载</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>小米之家</dt>
                <dd><a class="" href="javascript:void(0)">小米之家</a></dd>
                <dd><a class="" href="javascript:void(0)">服务网点</a></dd>
                <dd><a class="" href="javascript:void(0)">预约亲临到店服务</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>关于小米</dt>
                <dd><a class="" href="javascript:void(0)">了解小米</a></dd>
                <dd><a class="" href="javascript:void(0)">加入小米</a></dd>
                <dd><a class="" href="javascript:void(0)">联系我们</a></dd>
            </dl>
            <dl class="foot_middle_dl">
            	<dt>关注我们</dt>
                <dd><a class="" href="javascript:void(0)">新浪微博</a></dd>
                <dd><a class="" href="javascript:void(0)">小米部落</a></dd>
                <dd><a class="" href="javascript:void(0)">官方微信</a></dd>
            </dl>
            <div class="foot_middle_contact">
            	<p class="phone">400-100-5678</p>
                <p>周一至周日 8:00-18:00<br />（仅收市话费）</p>
                <a href="javascript:void(0)">24小时在线客服</a>
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
                    <a href="javascript:void(0)">mi.com</a>
                    京ICP证110507号 京ICP备10046444号 京公网安备1101080212535号		
                    <a href="javascript:void(0)">京网文[2014]0059-0009号</a>
                </p>
            </div>
            
            
            <div class="foot_down_language">
            	<div class="f_d_l_chose">简体中文</div>
                
                <span class="foot_icon"><img src="images/2015-07-19_132244.png" /></span>
                
                <ul>
                	<li><a href="javascript:void(0)">English</a></li>
                    <li><a href="javascript:void(0)">繁體台灣</a></li>
                    <li><a href="javascript:void(0)">繁體香港</a></li>
                    <li><a href="javascript:void(0)">Singapore</a></li>
                    <li><a href="javascript:void(0)">Malaysia</a></li>
                    <li><a href="javascript:void(0)">India</a></li>
                    <li><a href="javascript:void(0)">Philippines</a></li>
                    <li><a href="javascript:void(0)">Indonesia</a></li>
                    <li><a href="javascript:void(0)">Brasil</a></li>
                    <li><a href="javascript:void(0)">简体中文</a></li> 
                </ul>
            
            </div>
            
            <div class="foot_down_info_links">
            	<a href="javascript:void(0)"><img src="images/cnnicVerifyseal.png" /></a>
            	<a href="javascript:void(0)"><img src="images/szfwVerifyseal.gif" /></a>
            	<a href="javascript:void(0)"><img src="images/save.jpg" /></a>
            </div>
        </div>
    </div>
</div>



</body>
</html>
