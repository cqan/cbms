package com.cqan.repository;

import java.util.List;

import com.cqan.school.AccountGroup;
import com.cqan.school.School;

public interface AccountGroupRepository extends BaseRepository<AccountGroup, Long>{

	List<AccountGroup> findBySchool(School school);


}
