package com.cqan.service;

import java.util.List;

import com.cqan.account.FeePolicy;
import com.cqan.school.School;

public interface FeePolicyService extends BaseService<FeePolicy, Long>{

	List<FeePolicy> findBySchool(School school);

	List<FeePolicy> findBySchoolIsNull();
}
