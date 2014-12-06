package com.cqan.system;


import javax.persistence.Entity;
import javax.persistence.Table;

import com.cqan.IdLongEntity;

@Entity
@Table(name="user_school")
public class UserSchool extends IdLongEntity {

	private int userId;
	
	private int schoolId;

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}
	
}
