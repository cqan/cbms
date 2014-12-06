package com.cqan.service;

import java.util.List;

import com.cqan.school.AccountGroup;
import com.cqan.school.School;

public interface AccountGroupService  extends BaseService<AccountGroup, Long>{

	List<AccountGroup> findBySchool(School school);
	
}
