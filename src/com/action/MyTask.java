package com.action;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/**
 * @version ʱ�䣺2018��5��26�� ����7:07:28
 *
 */
public class MyTask extends TimerTask{
	private Timer timer;
	public MyTask(Timer timer){
		this.timer=timer;
	}
	public void start(Date firstTime,long period){
		timer.schedule(this, firstTime,period);
	}
	public void close(){
		timer.cancel();
	}
	@Override
	public void run() {
//		System.out.println(" ʱ�� �� "+ new Date());
	}
}
