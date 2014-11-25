package com.cqan.repository;

import com.cqan.system.User;

public interface UserRepository extends BaseRepository<User, Long>{

	User findByUserName(String userName);

}
