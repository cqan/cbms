package com.cqan.repository;

import com.cqan.account.AccountAuth;

public interface AccountAuthRepository extends
		BaseRepository<AccountAuth, Long> {

	AccountAuth findByUserName(String userName);

}
