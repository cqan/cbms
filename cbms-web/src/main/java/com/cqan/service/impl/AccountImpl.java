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

	@Override
	public Account findByUserName(String userName) {
		return repository.findByUserName(userName);
	}

	@Override
	public Account findByLicenseNo(String licenseNo) {
		return repository.findByLicenseNo(licenseNo);
	}

	@Override
	public Account findByLicenseNoOrUserName(String name) {
		
		return repository.findByUserNameOrLicenseNo(name);
	}

}
