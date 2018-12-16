package com.action;

import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @version ʱ�䣺2018��5��26�� ����7:03:33
 *
 */
public class ProjectListenter implements ServletContextListener {
	private MyTask mt;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("---���̽���");
		if(mt!=null){
			mt.cancel();//�رն�ʱ��
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("---��������");
		Timer t1 = new Timer();
		mt = new MyTask(t1);
		mt.start(new Date(), 1000);
	}

}
