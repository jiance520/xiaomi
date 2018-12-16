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
 * @version ʱ�䣺2018��6��2�� ����9:24:26
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
			order.put("p_id",p_id);//��Ʒid
			order.put("p_name",productmap.get("P_NAME"));//��Ʒ����
			order.put("shop_price",productmap.get("SHOP_PRICE"));//��Ʒ����
			order.put("p_file_name",imagemap.get("P_FILE_NAME"));//��ƷͼƬ·��
			order.put("od_count",1);//��Ʒ����
			ordermap.put(p_id,order);//�����¶���
			logger.debug("�����¶���1");
		}
		else{
			order = (HashMap)ordermap.get(p_id);
			if(order==null){//�������Ʒ������
				order = new HashMap();
				order.put("p_id",p_id);//��Ʒid
				order.put("p_name",productmap.get("P_NAME"));//��Ʒ����
				order.put("shop_price",productmap.get("SHOP_PRICE"));//��Ʒ����
				order.put("p_file_name",imagemap.get("P_FILE_NAME"));//��ƷͼƬ·��
				order.put("od_count",1);//��Ʒ����
				ordermap.put(p_id,order);//�����¶���
				logger.debug("�����¶���2");
			}
			else{//�������Ʒ�Ѿ�����
				Integer num = (Integer)order.get("od_count");
				int num2 = num.intValue()+1;
				order.put("od_count",num2);//��Ʒ����+1
				ordermap.put(p_id,order);//�滻ԭ��Ʒ
				logger.debug("�滻ԭ��Ʒ");
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
