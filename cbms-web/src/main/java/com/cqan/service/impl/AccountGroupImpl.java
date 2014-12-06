package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.AccountGroupRepository;
import com.cqan.school.AccountGroup;
import com.cqan.school.School;
import com.cqan.service.AccountGroupService;

@Service("groupService")
public class AccountGroupImpl extends BaseServiceImpl<AccountGroup, Long, AccountGroupRepository> implements AccountGroupService {

	@Override
	@Autowired
	public void setEntityRepository(AccountGroupRepository repository) {
		this.repository = repository;
	}

	@Override
	public List<AccountGroup> findBySchool(School school) {
		return repository.findBySchool(school);
	}


}
