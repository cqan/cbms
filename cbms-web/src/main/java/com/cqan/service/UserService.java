package com.cqan.service;

import com.cqan.system.User;

public interface UserService extends BaseService<User, Long> {

	User findByUserName(String username);

}
