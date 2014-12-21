package com.cqan.system;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

import com.cqan.IdLongEntity;

@Entity
@Table(name="card_strategy")
public class CardBatch extends IdLongEntity {

	
	private String name;
	
	private String area;
	
	private float price;
	
	private int cardNum;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	
	private String cardPrefix;
	
	private String cardSuffix;
	
	private String decription;
	
	//0:未制卡；1:正在制卡；2:制卡完成
	private int status;
	
	private Long feePolicyId;
	


	public Long getFeePolicyId() {
		return feePolicyId;
	}

	public void setFeePolicyId(Long feePolicyId) {
		this.feePolicyId = feePolicyId;
	}

	public String getCardPrefix() {
		return cardPrefix;
	}

	public void setCardPrefix(String cardPrefix) {
		this.cardPrefix = cardPrefix;
	}

	public String getCardSuffix() {
		return cardSuffix;
	}

	public void setCardSuffix(String cardSuffix) {
		this.cardSuffix = cardSuffix;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getCardNum() {
		return cardNum;
	}

	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
	
	
	
}
