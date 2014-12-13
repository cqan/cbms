package com.cqan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.cqan.school.School;

public interface SchoolRepository extends BaseRepository<School, Long>{

	@Query("from School where agid=?")
	List<School> listSchoolById(Long gid);
	
	@Query("from School where city=?")
	List<School> listSchoolByAreaId(String areaId);
}
