package com.action;

import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @version 时间：2018年5月26日 下午7:03:33
 *
 */
public class ProjectListenter implements ServletContextListener {
	private MyTask mt;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("---工程结束");
		if(mt!=null){
			mt.cancel();//关闭定时器
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("---工程启动");
		Timer t1 = new Timer();
		mt = new MyTask(t1);
		mt.start(new Date(), 1000);
	}

}
