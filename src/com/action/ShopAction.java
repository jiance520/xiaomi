package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.entity.M_order_details;
import com.entity.M_orders;
import com.util.JdbcUtil;

/**
 * @version 时间：2018年6月2日 上午9:24:26
 *
 */
public class ShopAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());
	/**
	 * Constructor of the object.
	 */
	public ShopAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-UTF-8");
        PrintWriter out = response.getWriter();
		String p_id = request.getParameter("p_id");
		HashMap imagemap = JdbcUtil.queryOne("select * from M_product_image where p_id=? ", p_id);
		HashMap productmap = JdbcUtil.queryOne("select * from M_product where p_id=? ", p_id);
		
		HashMap  order =null;
		HashMap ordermap = (HashMap)request.getSession().getAttribute("ordermap");
		if(ordermap==null){
			ordermap = new HashMap();
			order = new HashMap();
			order.put("p_id",p_id);//商品id
			order.put("p_name",productmap.get("P_NAME"));//商品名称
			order.put("shop_price",productmap.get("SHOP_PRICE"));//商品单价
			order.put("p_file_name",imagemap.get("P_FILE_NAME"));//商品图片路径
			order.put("od_count",1);//商品数量
			ordermap.put(p_id,order);//增加新订单
			logger.debug("增加新订单1");
		}
		else{
			order = (HashMap)ordermap.get(p_id);
			if(order==null){//如果该商品不存在
				order = new HashMap();
				order.put("p_id",p_id);//商品id
				order.put("p_name",productmap.get("P_NAME"));//商品名称
				order.put("shop_price",productmap.get("SHOP_PRICE"));//商品单价
				order.put("p_file_name",imagemap.get("P_FILE_NAME"));//商品图片路径
				order.put("od_count",1);//商品数量
				ordermap.put(p_id,order);//增加新订单
				logger.debug("增加新订单2");
			}
			else{//如果该商品已经存在
				Integer num = (Integer)order.get("od_count");
				int num2 = num.intValue()+1;
				order.put("od_count",num2);//商品数量+1
				ordermap.put(p_id,order);//替换原商品
				logger.debug("替换原商品");
			}
		}
		request.getSession().setAttribute("ordermap", ordermap);
		String js = JSON.toJSONString(ordermap);
		out.print(js);
		out.flush();
        out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
