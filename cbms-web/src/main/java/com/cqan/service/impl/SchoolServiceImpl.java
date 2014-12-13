package com.cqan.service.impl;

import java.util.List;

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

	@Override
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	public List<School> listById(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<School> listByAreaId(String id) {
		return repository.listSchoolByAreaId(id);
	}
	
	


}
