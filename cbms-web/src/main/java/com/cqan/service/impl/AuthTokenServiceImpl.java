package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.AuthToken;
import com.cqan.repository.AuthTokenRepository;
import com.cqan.service.AuthTokenService;

@Service("authTokenService")
public class AuthTokenServiceImpl extends
		BaseServiceImpl<AuthToken, Long, AuthTokenRepository> implements
		AuthTokenService {

	@Override
	@Autowired
	public void setEntityRepository(AuthTokenRepository repository) {
		this.repository = repository;
	}

	@Override
	public AuthToken findByUserName(String userName) {
		return repository.findByUserName(userName);
	}

	
}
