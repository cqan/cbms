package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.SchoolRepository;
import com.cqan.school.School;
import com.cqan.service.SchoolService;

@Service("schoolService")
public class SchoolServiceImpl extends BaseServiceImpl<School, Long, SchoolRepository> implements SchoolService {

	@Override
	@Autowired
	public void setEntityRepository(SchoolRepository repository) {
		this.repository = repository;
	}


}
