package com.cqan.account;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.cqan.IdLongEntity;

@Entity
@Table(name="tbl_recharge_history")
public class RechargeHistory extends IdLongEntity {

	
	private String userName;
	
	//1:未充值；2：充值成功；3：取消充值
	private Integer status;
	
	private Long feePolicyId;
	
	private String feePolicyName;
	
	private String streamNumber;
	
	//充值类型；1：卡充值；2：短信充值
	private Integer rechargeType;
	
	private String description;
	
	private Float price;
	
	private Integer time;
	

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getFeePolicyId() {
		return feePolicyId;
	}

	public void setFeePolicyId(Long feePolicyId) {
		this.feePolicyId = feePolicyId;
	}

	public String getFeePolicyName() {
		return feePolicyName;
	}

	public void setFeePolicyName(String feePolicyName) {
		this.feePolicyName = feePolicyName;
	}

	public String getStreamNumber() {
		return streamNumber;
	}

	public void setStreamNumber(String streamNumber) {
		this.streamNumber = streamNumber;
	}

	public Integer getRechargeType() {
		return rechargeType;
	}

	public void setRechargeType(Integer rechargeType) {
		this.rechargeType = rechargeType;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
	
	
	
	
	
}
