package com.cqan.school;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.cqan.IdLongEntity;

/**
 * 计费管理
 * @author wuhui
 *
 */
@Entity
@Table(name = "fee_policy")
public class FeePolicy extends IdLongEntity {

	private String name;
	
	//计费政策类型
	private short strategyType;

	private School school;
	
	private float price;
	
	private int time;
	
	private Integer downControl;
	
	private Integer upControl;
	
	private String area;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startTime;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endTime;
	//学生是否可见 1：是；2：否
	private Integer stuVisible;
	
	private String description;
	


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public short getStrategyType() {
		return strategyType;
	}

	public void setStrategyType(short strategyType) {
		this.strategyType = strategyType;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}


	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getDownControl() {
		return downControl;
	}

	public void setDownControl(Integer downControl) {
		this.downControl = downControl;
	}

	public Integer getUpControl() {
		return upControl;
	}

	public void setUpControl(Integer upControl) {
		this.upControl = upControl;
	}

	public Integer getStuVisible() {
		return stuVisible;
	}

	public void setStuVisible(Integer stuVisible) {
		this.stuVisible = stuVisible;
	}

	@ManyToOne
    @JoinColumn(name="school_id")
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	
}
