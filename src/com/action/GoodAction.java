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
 * @version ʱ�䣺2018��5��30�� ����11:22:17
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
//		ȡcookie,cookie�������Ч��
		String his_str = null;//������Ʒp_idʹ���Զ���ָ���#�ֿ���ÿ��׷�ӵ��ַ���his_str���棬
		Cookie[] cookie_arr = request.getCookies();
		for(Cookie cookie:cookie_arr){
			if(cookie.getName().equals("his_str")){//��cookie_arr�������ҵ�������Ʒp_id������
				his_str = cookie.getValue();
				break;
			}
		}
		LinkedList hislist = new LinkedList();
		if(his_str==null){//���ж��ǲ��ǵ�һ�α���
			his_str = p_id;
			hislist.addFirst(productmap);//ֻ��һ����ǰ�����¼
			Cookie p_idcookie  = new Cookie("his_str",his_str);
			response.addCookie(p_idcookie);
		}
		else{
			String[] his_arr = his_str.split("#");
			for(int i=his_arr.length-1;i>his_arr.length-2;i--){//�����������p_id����Ȼ�����list�������¼���ڴ��޸�
				String pid = his_arr[i];
				HashMap pidmap = JdbcUtil.queryOne("select * from M_product where p_id=? ", Integer.parseInt(pid));
				hislist.addLast(pidmap);
			}			
			hislist.addFirst(productmap);//�ѵ�ǰ���ʵ�map����list��
			his_str = his_str+"#"+p_id;
			Cookie p_idcookie  = new Cookie("his_str",his_str);
			response.addCookie(p_idcookie);
		}
		logger.debug("hislist"+hislist);
		request.getSession().setAttribute("hislist", hislist);//hislist�Ǳ仯��,��ʷ�������
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
