package com.cqan.account;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.cqan.IdLongEntity;
import com.cqan.school.AccountGroup;

@Entity
@Table(name = "account")
public class Account extends IdLongEntity {
	
	private boolean active;
	
	private AccountGroup group;

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@ManyToOne
    @JoinColumn(name="group_id")
	public AccountGroup getGroup() {
		return group;
	}

	public void setGroup(AccountGroup group) {
		this.group = group;
	}

}
