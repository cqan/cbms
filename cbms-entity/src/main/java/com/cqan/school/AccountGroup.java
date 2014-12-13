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
	
	//独立客户组1：开启；0：关闭
	private int independentGroup;
	
	//描述
	private String description;
	
	//强制下线  1：强制下线；0：不强制下线
	private int kick;
	
	private String nasIp;
	
	private String nasPortId;
	
	private String nasPort;
	
	private String vlanID1;
	
	private String vlanID2;
	
	private Integer vlanBindTag;
	
	private Integer ipBindTag;    
	
	
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

	public int getKick() {
		return kick;
	}

	public void setKick(int kick) {
		this.kick = kick;
	}

	public String getNasPortId() {
		return nasPortId;
	}

	public void setNasPortId(String nasPortId) {
		this.nasPortId = nasPortId;
	}

	public String getNasPort() {
		return nasPort;
	}

	public void setNasPort(String nasPort) {
		this.nasPort = nasPort;
	}

	public String getVlanID1() {
		return vlanID1;
	}

	public void setVlanID1(String vlanID1) {
		this.vlanID1 = vlanID1;
	}

	public String getVlanID2() {
		return vlanID2;
	}

	public void setVlanID2(String vlanID2) {
		this.vlanID2 = vlanID2;
	}

	public Integer getVlanBindTag() {
		return vlanBindTag;
	}

	public void setVlanBindTag(Integer vlanBindTag) {
		this.vlanBindTag = vlanBindTag;
	}

	public Integer getIpBindTag() {
		return ipBindTag;
	}

	public void setIpBindTag(Integer ipBindTag) {
		this.ipBindTag = ipBindTag;
	}

	public String getNasIp() {
		return nasIp;
	}

	public void setNasIp(String nasIp) {
		this.nasIp = nasIp;
	}

	
	
}
