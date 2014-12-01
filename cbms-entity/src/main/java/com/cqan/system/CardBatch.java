package com.cqan.system;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
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
	
	private String decription;
	
	//1:正在制卡；2:制卡完成
	private int status;
	

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
	
	
	
}
