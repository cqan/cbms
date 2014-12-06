package com.cqan.system;


import javax.persistence.Entity;
import javax.persistence.Table;

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
	
}
