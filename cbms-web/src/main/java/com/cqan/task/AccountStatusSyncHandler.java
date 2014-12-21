package com.cqan.task;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.cqan.account.Account;
import com.cqan.account.AccountTask;
import com.cqan.service.AccountService;
import com.cqan.service.AccountTaskService;

/**
 * 同步用户信息
 * @author wuhui
 *
 */
public class AccountStatusSyncHandler implements Runnable{


	private static final Logger logger = LoggerFactory.getLogger(AccountStatusSyncHandler.class);

	private static ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
	
	private static final int INITIALDELAY = 30;
	
	private static final int PERIOD = 60;
	
	private static final int SYNC_SIZE = 100;	
	
	private static boolean flag = false;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountTaskService accountTaskService;
	
    public AccountStatusSyncHandler() {
    	if (!flag) {
    		logger.debug("帐号状态同步任务初始化...");
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
		List<Account> accounts = accountService.findByExpireTime(SYNC_SIZE);
		if (accounts!=null&&!accounts.isEmpty()) {
			for (Account account : accounts) {
				if (account.getExpireTime().getTime()<=System.currentTimeMillis()) {
					account.setStatus(1);
				}
				AccountTask at = accountTaskService.findByAccountId(account.getId());
				if (at!=null) {
					account.setFeePolicyId(at.getId());
					accountTaskService.delete(at.getId());
				}
				accountService.save(account);
				logger.info("更新帐户信息:{}",account);
			}
		}
	}
}
