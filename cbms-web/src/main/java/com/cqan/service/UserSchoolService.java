package com.cqan.service;

import java.util.List;

import com.cqan.system.UserSchool;

public interface UserSchoolService  extends BaseService<UserSchool, Long>{

	List<UserSchool> findByUserId(Long id);
	
	void delByUserId(Long uid);
	
}
