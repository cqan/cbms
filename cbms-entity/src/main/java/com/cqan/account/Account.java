package com.cqan.account;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.cqan.IdLongEntity;
import com.cqan.school.Group;

@Entity
@Table(name = "account")
public class Account extends IdLongEntity {
	
	private boolean active;
	
	private Group group;

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@ManyToOne
    @JoinColumn(name="group_id")
	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

}
