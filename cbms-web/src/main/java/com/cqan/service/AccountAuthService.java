package com.cqan.service;

import com.cqan.account.Account;
import com.cqan.account.AccountAuth;

public interface AccountAuthService extends BaseService<AccountAuth, Long> {

	void updateAccount(Account account);
}
