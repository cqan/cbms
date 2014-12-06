package com.cqan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cqan.system.UserSchool;


public interface UserSchoolRepository extends BaseRepository<UserSchool, Long>{

	List<UserSchool> findByUserId(Long uid);

	@Modifying
	@Query("delete from UserSchool where userId=?")
	void delByUserId(Long uid);


}
