package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.UserSchoolRepository;
import com.cqan.service.UserSchoolService;
import com.cqan.system.UserSchool;

@Service("userSchoolService")
public class UserSchoolServiceImpl extends
		BaseServiceImpl<UserSchool, Long, UserSchoolRepository> implements UserSchoolService {

	@Override
	@Autowired
	public void setEntityRepository(UserSchoolRepository repository) {
		this.repository = repository;
	}

}
