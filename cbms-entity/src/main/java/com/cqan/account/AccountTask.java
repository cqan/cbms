package com.cqan.account;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cqan.IdLongEntity;

@Entity
@Table(name = "account_task")
public class AccountTask extends IdLongEntity{

	private Long accountId;
	
	private Long feePolicyId;
	

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public Long getFeePolicyId() {
		return feePolicyId;
	}

	public void setFeePolicyId(Long feePolicyId) {
		this.feePolicyId = feePolicyId;
	}
}
