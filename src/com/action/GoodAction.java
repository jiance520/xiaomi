package com.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.JdbcUtil;

/**
 * @version 时间：2018年5月30日 下午11:22:17
 *
 */
public class GoodAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());

	/**
	 * Constructor of the object.
	 */
	public GoodAction() {
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
		response.setCharacterEncoding("UTF-8");
		String p_id = request.getParameter("p_id");
		HashMap productmap = JdbcUtil.queryOne("select * from M_product where p_id=? ", p_id);
//		取cookie,cookie最好有有效期
		String his_str = null;//保存商品p_id使用自定义分隔符#分开，每次追加到字符串his_str后面，
		Cookie[] cookie_arr = request.getCookies();
		for(Cookie cookie:cookie_arr){
			if(cookie.getName().equals("his_str")){//从cookie_arr数组中找到保存商品p_id的属性
				his_str = cookie.getValue();
				break;
			}
		}
		LinkedList hislist = new LinkedList();
		if(his_str==null){//先判断是不是第一次保存
			his_str = p_id;
			hislist.addFirst(productmap);//只有一条当前浏览记录
			Cookie p_idcookie  = new Cookie("his_str",his_str);
			response.addCookie(p_idcookie);
		}
		else{
			String[] his_arr = his_str.split("#");
			for(int i=his_arr.length-1;i>his_arr.length-2;i--){//遍历出最近的p_id对象，然后放入list，浏览记录数在此修改
				String pid = his_arr[i];
				HashMap pidmap = JdbcUtil.queryOne("select * from M_product where p_id=? ", Integer.parseInt(pid));
				hislist.addLast(pidmap);
			}			
			hislist.addFirst(productmap);//把当前访问的map放入list。
			his_str = his_str+"#"+p_id;
			Cookie p_idcookie  = new Cookie("his_str",his_str);
			response.addCookie(p_idcookie);
		}
		logger.debug("hislist"+hislist);
		request.getSession().setAttribute("hislist", hislist);//hislist是变化的,历史浏览内容
		request.setAttribute("productmap", productmap);
		request.getRequestDispatcher("good.jsp").forward(request, response);
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
