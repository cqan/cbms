package com.cqan.account;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

import com.cqan.IdLongEntity;
import com.cqan.school.School;

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
	private Integer strategyType;

	private School school;
	
	private Float price;
	
	private Integer time;
	
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
	
	private Long creatorId;
	
	private String creator;
	


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStrategyType() {
		return strategyType;
	}

	public void setStrategyType(Integer strategyType) {
		this.strategyType = strategyType;
	}

	public float getPrice() {
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
	
	public Long getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(Long creatorId) {
		this.creatorId = creatorId;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@ManyToOne
    @JoinColumn(name="school_id")
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}

	
}
