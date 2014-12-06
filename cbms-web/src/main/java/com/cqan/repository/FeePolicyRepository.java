package com.cqan.repository;

import java.util.List;

import com.cqan.school.FeePolicy;
import com.cqan.school.School;

public interface FeePolicyRepository extends BaseRepository<FeePolicy, Long> {

	List<FeePolicy> findBySchool(School school);

}
