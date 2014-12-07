package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.AccountTask;
import com.cqan.repository.AccountTaskRepository;

@Service("accountTaskService")
public class AccountTaskServiceImpl extends
		BaseServiceImpl<AccountTask, Long, AccountTaskRepository> {

	@Override
	@Autowired
	public void setEntityRepository(AccountTaskRepository repository) {
		this.repository = repository;
	}

}
