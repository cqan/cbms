package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.FeePolicyRepository;
import com.cqan.school.FeePolicy;
import com.cqan.service.FeePolicyService;

@Service("feePolicyService")
public class FeePolicyServiceImpl extends BaseServiceImpl<FeePolicy, Long, FeePolicyRepository> implements FeePolicyService {

	@Override
	@Autowired
	public void setEntityRepository(FeePolicyRepository repository) {
		this.repository = repository;
	}

}
