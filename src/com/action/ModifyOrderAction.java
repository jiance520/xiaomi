package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.util.JdbcUtil;

/**
 * @version 时间：2018年6月12日 下午8:25:12
 *
 */
public class ModifyOrderAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());
	/**
	 * Constructor of the object.
	 */
	public ModifyOrderAction() {
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
		String str = request.getParameter("str");
		String p_id = request.getParameter("p_id");
		HashMap ordermap = (HashMap)request.getSession().getAttribute("ordermap");
		if(str!=null){
			if(str.equals("del")){
				ordermap.remove(p_id);
				request.getSession().setAttribute("ordermap", ordermap);
			}
			if(str.equals("change")||str.equals("plus")||str.equals("minus")){
				String value = request.getParameter("value");
				HashMap order = (HashMap)ordermap.get(p_id);
				order.put("od_count", Integer.valueOf(value));
				ordermap.put(p_id, order);
				request.getSession().setAttribute("ordermap", ordermap);
				logger.debug(ordermap);
			}
		}
		out.print(p_id);
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
