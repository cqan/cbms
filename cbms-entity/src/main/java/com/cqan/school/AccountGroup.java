package com.cqan.school;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.cqan.IdLongEntity;

@Entity
@Table(name = "account_group")
public class AccountGroup extends IdLongEntity {
	
	private String groupCode;
	
	private String name;
	
	//1：学生；2：家属区；3：办公区；4：其它
	private int type;
	
	private School school;//所属学校
	
	//独立客户组1：开启；2：关闭
	private int independentGroup;
	
	//描述
	private String description;
	
	
	@ManyToOne
    @JoinColumn(name="school_id")
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String code) {
		this.groupCode = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getIndependentGroup() {
		return independentGroup;
	}

	public void setIndependentGroup(int independentGroup) {
		this.independentGroup = independentGroup;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
}
