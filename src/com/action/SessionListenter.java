package com.action;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * @version 时间：2018年5月26日 下午6:54:52
 *
 */
public class SessionListenter implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
			String name = arg0.getName();
			Object obj = arg0.getValue();
			System.out.println("add name="+name);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		String name = arg0.getName();
		System.out.println(" remove name = "+name);
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		String name = arg0.getName();
		System.out.println(" replace name = "+name);
	}

}
