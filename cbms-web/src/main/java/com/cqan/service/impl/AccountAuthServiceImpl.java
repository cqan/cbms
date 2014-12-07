package com.cqan.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.Account;
import com.cqan.account.AccountAuth;
import com.cqan.repository.AccountAuthRepository;
import com.cqan.service.AccountAuthService;
import com.cqan.service.NetConfigService;

@Service("accountAuthService")
public class AccountAuthServiceImpl extends
		BaseServiceImpl<AccountAuth, Long, AccountAuthRepository>implements AccountAuthService {

	@Autowired
	private NetConfigService netConfigService;
	
	
	@Override
	@Autowired
	public void setEntityRepository(AccountAuthRepository repository) {
		this.repository = repository;
	}

	@Override
	public void createAccount(Account account) {
		AccountAuth aa = repository.findByUserName(account.getUserName());
		if (aa==null) {
			aa = new AccountAuth();
			aa.setCreateTime(new Date());
			aa.setTimeStamp(new Date());
			aa.setPassword(account.getPassword());
			aa.setUserStatusTime(new Date());
			aa.setUserStatus(account.getStatus());
		}else{
			aa.setUserStatusTime(new Date());
		}
		
		repository.save(aa);
	}

}
