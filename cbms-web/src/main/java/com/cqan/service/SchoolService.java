package com.cqan.service;

import java.util.List;

import com.cqan.school.School;

public interface SchoolService  extends BaseService<School, Long>{
	
	public List<School> listById(long id);
	
	public List<School> listByAreaId(String id);
	
}
