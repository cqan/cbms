package com.cqan.school;


import com.cqan.IdLongEntity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "fee")
public class Fee extends IdLongEntity {

	private String name;
	
	private short feeType;//计费类型（1，计时。2，按月）

	private School school;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public short getFeeType() {
		return feeType;
	}

	public void setFeeType(short feeType) {
		this.feeType = feeType;
	}

	@ManyToOne(cascade = {CascadeType.ALL},targetEntity=School.class,fetch = FetchType.LAZY)
    @JoinColumn(name="school_id")
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	
}
