package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.Account;
import com.cqan.repository.AccountRepository;
import com.cqan.service.AccountService;


@Service("accountService")
public class AccountImpl extends BaseServiceImpl<Account, Long, AccountRepository> implements AccountService {

	@Override
	@Autowired
	public void setEntityRepository(AccountRepository repository) {
		this.repository = repository;
	}


}
