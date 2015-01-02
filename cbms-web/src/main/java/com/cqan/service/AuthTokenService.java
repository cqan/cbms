package com.cqan.service;

import com.cqan.account.AuthToken;

public interface AuthTokenService extends BaseService<AuthToken, Long> {

	public AuthToken findByUserName(String userName);
}
