package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @version 时间：2018年5月26日 上午11:42:52
 *
 */
public class SessionFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request  = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		String uri = request.getRequestURI();
		String qs = request.getQueryString();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		ArrayList<String> al = new ArrayList<String>();
			al.add("");
		if(al.contains(path)){
			Object obj = request.getSession().getAttribute("user");
			if(obj==null){
				response.sendRedirect("login.jsp");
			}
			else{
				arg2.doFilter(arg0, arg1);
			}
		}
		else{
			arg2.doFilter(arg0, arg1);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
	
}
