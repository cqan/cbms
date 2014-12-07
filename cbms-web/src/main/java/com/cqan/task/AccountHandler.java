package com.cqan.task;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class AccountHandler implements Runnable {

	
	private static final Logger logger = LoggerFactory.getLogger(AccountHandler.class);

	private static ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
	
	private static final int INITIALDELAY = 30;
	
	private static final int PERIOD = 30;
	
	private static boolean flag = false;
	
    public AccountHandler() {
    	if (!flag) {
    		logger.debug("帐号定时任务初始化...");
			flag = true;
			scheduled.scheduleAtFixedRate(this, INITIALDELAY, PERIOD, TimeUnit.SECONDS);
		}
	}
	
	@Override
	public void run() {
		try {
			sync();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 同步套餐
	 */
	private void sync(){
		
	}

}
