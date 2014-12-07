package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.Account;
import com.cqan.account.AccountAuth;
import com.cqan.repository.AccountAuthRepository;
import com.cqan.service.AccountAuthService;

@Service("accountAuthService")
public class AccountAuthServiceImpl extends
		BaseServiceImpl<AccountAuth, Long, AccountAuthRepository> implements AccountAuthService{

	@Override
	public void createAccount(Account account) {
		
		
	}

	@Override
	@Autowired
	public void setEntityRepository(AccountAuthRepository repository) {
		this.repository = repository;
	}

}
