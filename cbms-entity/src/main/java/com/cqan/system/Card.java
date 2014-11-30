package com.cqan.system;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.cqan.IdLongEntity;
import com.cqan.school.AccountGroup;
import com.cqan.school.FeePolicy;
import com.cqan.school.School;


@Entity
@Table(name="card")
public class Card extends IdLongEntity{
	
	private AccountGroup accountGroup;
	
	private  String area;
	
	private CardBatch cardBatch;
	
	private String cardNo;
	
	private Date endTime;
	
	private FeePolicy feePolicy;
	
	private float price;
	
	private String pwd;
	
	private School school;
	
	private String serialNo;
	
	private Date startTime;
	
	//1:未使用；2：已使用；3：过期；4：冻结
	private int status;
	
	private String transferArea;
	
	private String transferName;
	

	@ManyToOne
    @JoinColumn(name="account_group_id")
	public AccountGroup getAccountGroup() {
		return accountGroup;
	}

	public String getArea() {
		return area;
	}

	@ManyToOne
    @JoinColumn(name="card_batch_id")
	public CardBatch getCardBatch() {
		return cardBatch;
	}

	public String getCardNo() {
		return cardNo;
	}

	public Date getEndTime() {
		return endTime;
	}

	@ManyToOne
    @JoinColumn(name="fee_policy_id")
	public FeePolicy getFeePolicy() {
		return feePolicy;
	}

	public float getPrice() {
		return price;
	}

	public String getPwd() {
		return pwd;
	}

	@ManyToOne
    @JoinColumn(name="school_id")
	public School getSchool() {
		return school;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public Date getStartTime() {
		return startTime;
	}

	public int getStatus() {
		return status;
	}

	public String getTransferArea() {
		return transferArea;
	}

	public String getTransferName() {
		return transferName;
	}

	public void setAccountGroup(AccountGroup accountGroup) {
		this.accountGroup = accountGroup;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setCardBatch(CardBatch cardBatch) {
		this.cardBatch = cardBatch;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public void setFeePolicy(FeePolicy feePolicy) {
		this.feePolicy = feePolicy;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setTransferArea(String transferArea) {
		this.transferArea = transferArea;
	}

	public void setTransferName(String transferName) {
		this.transferName = transferName;
	}
	

}
