package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.JdbcUtil;

/**
 * @version 时间：2018年6月12日 上午9:45:23
 *
 */
public class AccountsAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());
	/**
	 * Constructor of the object.
	 */
	public AccountsAction() {
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
		this.doPost(request, response);
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

		response.setContentType("text/html;charset-UTF-8");
		PrintWriter out = response.getWriter();
//		把购物车里的订单保存到数据库订单详情和总订单
		HashMap<String,HashMap> ordermap = (HashMap<String,HashMap>)request.getSession().getAttribute("ordermap");
//		map是保存了登陆用户表的所有信息
		String u_id = ((HashMap)request.getSession().getAttribute("map")).get("U_ID").toString();
		String o_name = ((HashMap)request.getSession().getAttribute("map")).get("USERNAME").toString();
		String o_telphone = ((HashMap)request.getSession().getAttribute("map")).get("PHONE").toString();
		String o_address = null;
		Object addobj = ((HashMap)request.getSession().getAttribute("map")).get("ADDRESS");
		if(addobj!=null){
			o_address = addobj.toString();
		}
		String o_total = request.getParameter("total");
		
		int numtotal = JdbcUtil.executeUpdate("insert into M_orders values(O_ID_SEQ.nextval,?,?,?,?,sysdate,?,0) ",u_id,o_name,o_telphone,o_address,o_total);
		logger.debug("插入总订单");
		ResultSet rs= JdbcUtil.executeQueryRS("select o_id from M_orders order by o_id desc ");
		int o_idcurrval = 0;
		try {
			if(rs.next()){
				o_idcurrval = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(Map.Entry<String, HashMap> map: ordermap.entrySet()){
			int p_id = Integer.parseInt(map.getKey());
			HashMap order = map.getValue();
			int od_count = ((Integer)order.get("od_count")).intValue();
			int od_subtotal = od_count*(((BigDecimal)order.get("shop_price")).intValue());
			int numdetail = JdbcUtil.executeUpdate("insert into M_order_details values(OD_ID_SEQ.nextval,?,?,?,?) ",od_count,od_subtotal,p_id,o_idcurrval);
		}	
		logger.debug("插入订单详情");
		request.getSession().removeAttribute("ordermap");
		if(request.getSession().getAttribute("ordermap")==null){
			out.print(true);
			System.out.println("清空了购物车");
		}
		else{
			out.print(false);
		}
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
