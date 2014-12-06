package com.cqan.repository;

import org.springframework.data.jpa.repository.Query;

import com.cqan.account.Account;

public interface AccountRepository extends BaseRepository<Account, Long>{

	Account findByUserName(String userName);

	Account findByLicenseNo(String licenseNo);

	@Query("from Account where userName=?1 or licenseNo=?1")
	Account findByUserNameOrLicenseNo(String name);

}
