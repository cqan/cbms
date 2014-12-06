package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<UserSchool> findByUserId(Long uid) {
		return repository.findByUserId(uid);
	}

	@Override
	@Transactional
	public void delByUserId(Long uid) {
		repository.delByUserId(uid);
	}

}
