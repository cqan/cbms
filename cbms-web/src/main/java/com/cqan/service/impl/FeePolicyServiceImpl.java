package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.FeePolicy;
import com.cqan.repository.FeePolicyRepository;
import com.cqan.school.School;
import com.cqan.service.FeePolicyService;

@Service("feePolicyService")
public class FeePolicyServiceImpl extends BaseServiceImpl<FeePolicy, Long, FeePolicyRepository> implements FeePolicyService {

	@Override
	@Autowired
	public void setEntityRepository(FeePolicyRepository repository) {
		this.repository = repository;
	}

	@Override
	public List<FeePolicy> findBySchool(School school) {
		return repository.findBySchool(school);
	}

	@Override
	public List<FeePolicy> findBySchoolIsNull() {
		return repository.findBySchoolIsNull();
	}

	@Override
	public FeePolicy findBySerialNo(String serialNo) {
		
		return repository.findBySerialNo(serialNo);
	}

}
