package com.cqan.task;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cqan.account.Account;
import com.cqan.account.AccountTask;
import com.cqan.account.FeePolicy;
import com.cqan.account.RechargeHistory;
import com.cqan.service.AccountService;
import com.cqan.service.AccountTaskService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.RechargeHistoryService;

/**
 * 同步用户信息
 * @author wuhui
 *
 */
@Component
public class AccountStatusSyncHandler implements Runnable{


	private static final Logger logger = LoggerFactory.getLogger(AccountStatusSyncHandler.class);

	private static ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
	
	private static final int INITIALDELAY = 30;
	
	private static final int PERIOD = 60;
	
	private static final int SYNC_SIZE = 100;	
	
	//短信充值延长15分钟
	private static final int DELAY = 15;
	
	private static boolean flag = false;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountTaskService accountTaskService;
	
	@Autowired
	private FeePolicyService feePolicyService;
	
	
	
	@Autowired
	private RechargeHistoryService rechargeHistoryService;
	
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
				account.setStatusSyncTime(System.currentTimeMillis());
				accountService.save(account);
				logger.info("更新帐户信息:{}",account);
				//处理帐号过期的情况
				if (account.getExpireTime().getTime()<=System.currentTimeMillis()) {
					account.setStatus(1);
					accountService.save(account);
				}
				//处理变更请求
				if (account.getExpireTime().getTime()<=System.currentTimeMillis()) {
					Calendar c = Calendar.getInstance();
					AccountTask at = accountTaskService.findByAccountId(account.getId());
					if (at!=null) {
						account.setFeePolicyId(at.getId());
						if (at.getFeePolicyId()!=null) {
							FeePolicy fp = feePolicyService.get(at.getFeePolicyId());
							if (fp!=null) {
								flag = false;
								c.set(Calendar.MONTH, c.get(Calendar.MONTH)+fp.getTime());
								account.setExpireTime(c.getTime());
								accountTaskService.delete(at.getId());
								account.setStatus(0);
								accountService.save(account);
							}
						}
					}
				}
				//处理短信充值
				if (account!=null&&StringUtils.isNotBlank(account.getMobile())) {
					Calendar c = Calendar.getInstance();
					c.set(Calendar.MINUTE, c.get(Calendar.MINUTE)-DELAY);
					List<RechargeHistory> lists = rechargeHistoryService.findUnRechargeHistory(account.getMobile(),c.getTime());
					if (lists!=null&&!lists.isEmpty()) {
						for (RechargeHistory rh : lists) {
							if (account.getFeePolicyId()==null||rh.getFeePolicyId()==account.getFeePolicyId()) {
								FeePolicy fp = feePolicyService.get(rh.getFeePolicyId());
								c.set(Calendar.MONTH, c.get(Calendar.MONTH)+fp.getTime());
								account.setExpireTime(c.getTime());
								rh.setStatus(2);
								rh.setUpdateTime(new Date());
								rechargeHistoryService.save(rh);
								account.setStatus(0);
								flag = false;
								accountService.save(account);
								logger.info("同步短信充值信息：{}",rh);
							}
						}
					}
				}
			}
		}
	}
}
