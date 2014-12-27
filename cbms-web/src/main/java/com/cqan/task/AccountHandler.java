package com.cqan.task;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cqan.account.Account;
import com.cqan.service.AccountAuthService;
import com.cqan.service.AccountService;


/**
 * 同步帐户信息到认证表中。
 * @author wuhui
 *
 */
@Component
public class AccountHandler implements Runnable {

	
	private static final Logger logger = LoggerFactory.getLogger(AccountHandler.class);

	private static ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
	
	private static final int INITIALDELAY = 30;
	
	private static final int PERIOD = 60;
	
private static final int SYNC_SIZE = 100;	
	private static boolean flag = false;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountAuthService accountAuthService;
	
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
		List<Account> accounts = accountService.findBySyncTime(SYNC_SIZE);
		if (accounts!=null&&!accounts.isEmpty()) {
			for (Account account : accounts) {
				accountAuthService.updateAccount(account);
				account.setSyncTime(System.currentTimeMillis());
				accountService.save(account);
				logger.info("同步套餐信息:{}",account);
			}
		}
	}

}
