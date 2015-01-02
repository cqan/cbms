package com.cqan.account;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cqan.IdLongEntity;

@Entity
@Table(name = "tbl_account_auth_token")
public class AuthToken extends IdLongEntity {

	private String authToken;
	
	private String userName;
	
	private Date expireTime;
	

	public Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	public String getAuthToken() {
		return authToken;
	}

	public String getUserName() {
		return userName;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
