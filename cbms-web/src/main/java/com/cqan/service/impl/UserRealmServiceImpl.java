package com.cqan.service.impl;

import org.springframework.stereotype.Service;

import com.cqan.repository.UserRealmRepository;
import com.cqan.service.UserRealmService;
import com.cqan.system.User;

@Service("userRealmService")
public class UserRealmServiceImpl implements UserRealmService {

	private UserRealmRepository userRealmRepository;
	
	@Override
	public User findByUserName(String username) {
		
		return userRealmRepository.findByUserName(username);
	}

}
