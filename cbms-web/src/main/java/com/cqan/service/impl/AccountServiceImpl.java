package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cqan.account.Account;
import com.cqan.repository.AccountRepository;
import com.cqan.service.AccountService;


@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account, Long, AccountRepository> implements AccountService {

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

	@Override
	public List<Account> findBySyncTime(int size) {
		return repository.findAll(new PageRequest(0, size, new Sort(Sort.Direction.ASC,"syncTime"))).getContent();
	}

	@Override
	public List<Account> findByExpireTime(int size) {
		return repository.findAll(new PageRequest(0, size, new Sort(Sort.Direction.ASC,"expireTime"))).getContent();
	}

	@Override
	public Account findByMobile(String mobile) {
		
		return repository.findByMobile(mobile);
	}

}
