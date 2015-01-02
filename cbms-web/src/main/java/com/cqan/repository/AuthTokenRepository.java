package com.cqan.repository;

import com.cqan.account.AuthToken;

public interface AuthTokenRepository extends BaseRepository<AuthToken, Long> {

	
	public AuthToken findByUserName(String userName);
}
