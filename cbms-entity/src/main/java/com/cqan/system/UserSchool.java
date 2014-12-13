package com.cqan.system;


import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.cqan.IdLongEntity;

@Entity
@Table(name="user_school")
public class UserSchool extends IdLongEntity {

	private Long userId;
	
	private Long schoolId;

	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Long schoolId) {
		this.schoolId = schoolId;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
