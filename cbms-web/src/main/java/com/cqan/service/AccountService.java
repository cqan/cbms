package com.cqan.service;

import java.util.List;

import com.cqan.account.Account;

public interface AccountService  extends BaseService<Account, Long>{

	Account findByUserName(String userName);

	Account findByLicenseNo(String licenseNo);

	Account findByLicenseNoOrUserName(String name);

	List<Account> findBySyncTime(int size);
	
}
