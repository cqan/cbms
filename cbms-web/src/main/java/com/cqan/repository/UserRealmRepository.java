package com.cqan.repository;


import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.cqan.system.User;

public interface UserRealmRepository  extends PagingAndSortingRepository<User, Long>,
JpaSpecificationExecutor<User> {

	User findByUserName(String username);

}
