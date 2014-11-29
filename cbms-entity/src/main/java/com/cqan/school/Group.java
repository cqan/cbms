package com.cqan.school;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.cqan.IdLongEntity;
import com.cqan.account.Account;

@Entity
@Table(name = "account_group")
public class Group extends IdLongEntity {
	
	private String code;
	
	private String name;
	
	private String type;
	
	private School school;//所属学校
	
	private List<Account> Accounts;
	
	@ManyToOne(fetch=FetchType.LAZY,cascade={CascadeType.REFRESH},targetEntity=School.class)
    @JoinColumn(name="school_id")
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	@OneToMany(mappedBy="group",cascade = {CascadeType.ALL},targetEntity=Account.class,fetch = FetchType.LAZY)
	public List<Account> getAccounts() {
		return Accounts;
	}

	public void setAccounts(List<Account> accounts) {
		Accounts = accounts;
	}
	

}
