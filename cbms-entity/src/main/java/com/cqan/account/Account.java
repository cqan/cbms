package com.cqan.account;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.cqan.IdLongEntity;
import com.cqan.school.AccountGroup;

@Entity
@Table(name = "account")
public class Account extends IdLongEntity {
	
	//用户状态：0-正常，1：停机  （开户时默认状态为1）
	private Integer status;
	
	private String name;
	
	private String password;
	
	private String licenseNo;
	
	private String licenseType;
	//账号
	private String userName;
	
	private String phoneNum;
	
	private String email;
	
	private String address;
	
	private Long schoolId;
	
	private Long feePolicyId;
	
	private AccountGroup group;
	
	private String creater;
	
	private Date expireTime;
	
	private Long syncTime;
	
	
	public Long getSyncTime() {
		return syncTime;
	}

	public void setSyncTime(Long syncTime) {
		this.syncTime = syncTime;
	}

	public Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@ManyToOne
    @JoinColumn(name="group_id")
	public AccountGroup getGroup() {
		return group;
	}

	public void setGroup(AccountGroup group) {
		this.group = group;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public String getLicenseType() {
		return licenseType;
	}

	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Long schoolId) {
		this.schoolId = schoolId;
	}

	public Long getFeePolicyId() {
		return feePolicyId;
	}

	public void setFeePolicyId(Long feePolicyId) {
		this.feePolicyId = feePolicyId;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
	
	

}
