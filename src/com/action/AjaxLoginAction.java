package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.JdbcUtil;

/**
 * @version 时间：2018年5月29日 下午12:01:44
 *
 */
public class AjaxLoginAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());

	/**
	 * Constructor of the object.
	 */
	public AjaxLoginAction() {
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
		int num=0;
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("login_phone");
		String password = request.getParameter("login_pwds");
		HashMap map = (HashMap)JdbcUtil.queryOne("select * from M_user where email=? and password=?", userName,password);
	
		if(map!=null){
			logger.debug("登陆成功");
			request.getSession().setAttribute("map", map);
			response.sendRedirect("IndexAction");
			out.print(true);
		}
		else{
			map = (HashMap)JdbcUtil.queryOne("select * from M_user where username=? and password=?", userName,password);
			if(map!=null){
				logger.debug("登陆成功");
				request.getSession().setAttribute("map", map);
				response.sendRedirect("IndexAction");
			}
			else{
				map = (HashMap)JdbcUtil.queryOne("select * from M_user where phone=? and password=?", userName,password);
				if(map!=null){
					
					int status = ((BigDecimal)map.get("STATUS")).intValue();
					if(1== status){
						logger.debug("登陆成功");
						request.getSession().setAttribute("map", map);
						response.sendRedirect("IndexAction");
					}
					else{
						logger.debug("未激活，登陆失败");
						response.sendRedirect("login.jsp");
					}
				}
				else{
					logger.debug("登陆失败");
					response.sendRedirect("login.jsp");
				}
			}
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
