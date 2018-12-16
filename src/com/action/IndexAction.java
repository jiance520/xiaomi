package com.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.JdbcUtil;

/**
 * @version 时间：2018年6月1日 下午2:22:20
 *
 */
public class IndexAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());
	/**
	 * Constructor of the object.
	 */
	public IndexAction() {
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

//		读取商品分类
		List<HashMap> cateList_p = JdbcUtil.exectueQuery("select * from (select c.*,rownum as r from M_category c) where r<=?",8);
		if(cateList_p!=null){
			for(HashMap map:cateList_p){
				int c_id = ((BigDecimal)map.get("C_ID")).intValue();
				List<HashMap> cateList_s = JdbcUtil.exectueQuery("select * from M_category where c_parent_id=?", c_id);
				logger.debug("cateList_s"+cateList_s);
				map.put("cateList_s", cateList_s);
			}
		}
//		读取热评商品
		List<HashMap> product_list_rp  = JdbcUtil.exectueQuery("select * from (select p.*,rownum as r from (select * from M_product order by p_comment desc)p) where r<=?",4);
		for(HashMap map:product_list_rp){
			int p_id = ((BigDecimal)map.get("P_ID")).intValue();
			HashMap commentmap = JdbcUtil.queryOne("select * from M_comment where p_id=?",p_id);
			map.put("co_content", commentmap.get("CO_CONTENT"));//把评价表的评论加进来对应商品，注意是小写
		}
//		读取特价商品
		List<HashMap> product_list_tj  = JdbcUtil.exectueQuery("select * from (select p.*,rownum as r from M_product p where rate_flag=1) where r<=?",4);
//		for(HashMap map:product_list_tj){
//			int rate_id = ((BigDecimal)map.get("RATE_ID")).intValue();
//			HashMap rate_flagmap = JdbcUtil.queryOne("select * from M_rate where rate_id=?",rate_id);
//			map.put("rate_flag", rate_flagmap.get("RATE_FLAG"));//把评价表的评论加进来对应商品，注意是小写
//		}
		
//		读取大家都喜欢商品
		List<HashMap> product_list_sc  = JdbcUtil.exectueQuery("select * from (select p.*,rownum as r from (select * from M_product order by p_collect desc)p) where r<=?",4);
		
		logger.debug("cateList_p:"+cateList_p );
		logger.debug("product_list_rp:"+product_list_rp);
		logger.debug("product_list_tj:"+product_list_tj);
		logger.debug("product_list_sc:"+product_list_sc);
		request.getSession().setAttribute("cateList_p", cateList_p);
		request.getSession().setAttribute("product_list_rp", product_list_rp);
		request.getSession().setAttribute("product_list_tj", product_list_tj);
		request.getSession().setAttribute("product_list_sc", product_list_sc);
		request.getRequestDispatcher("index2.jsp").forward(request, response);
//		request.getSession().setAttribute("imagemap", imagemap);
//		response.sendRedirect("index2.jsp");
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
