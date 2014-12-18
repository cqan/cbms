package com.cqan.service;

import com.cqan.system.User;

public interface UserRealmService {

	User findByUserName(String username);

}
