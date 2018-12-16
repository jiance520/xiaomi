package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.dao.IM_userDao;
import com.dao.impl.M_userDao;
import com.entity.M_user;
import com.util.JdbcUtil;

public class RegisterAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());

	/**
	 * Constructor of the object.
	 */
	public RegisterAction() {
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		
		String veryCode = request.getParameter("veryCode");
		
		Object  vobj = request.getSession().getAttribute("rand");
		
		//ÑéÖ¤ÂëÅÐ¶Ï
		if(veryCode.equalsIgnoreCase((String)vobj)){
			IM_userDao us = new M_userDao();
			//×¢²á
			M_user  u2 = new M_user();
			       u2.setUsername(username);
			       u2.setPassword(password);
			       u2.setEmail(email);
			       u2.setPhone(phone);
			
			int num = us.addNormalUser(u2) ;  // ×¢²á
			if(num > 0){ // ³É¹¦
				
				response.sendRedirect("login.jsp");
			}else{
				System.out.println("×¢²áÊ§°Ü");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}else{
			System.out.println("ÑéÖ¤Âë´íÎó");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
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
