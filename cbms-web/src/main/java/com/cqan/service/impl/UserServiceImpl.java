package com.cqan.service.impl;

import com.cqan.repository.UserRepository;
import com.cqan.service.UserService;
import com.cqan.system.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User, Long, UserRepository>
		implements UserService {

	@Override
	@Autowired
	public void setEntityRepository(UserRepository repository) {
		this.repository = repository;
	}

	@Override
	public User findByUserName(String userName) {
		
		return repository.findByUserName(userName);
	}

	

}
