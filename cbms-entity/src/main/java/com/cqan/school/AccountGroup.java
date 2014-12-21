package com.cqan.school;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.cqan.IdLongEntity;

@Entity
@Table(name = "account_group")
public class AccountGroup extends IdLongEntity {
	
	private String groupCode;
	
	private String name;
	
	//1：学生；2：家属区；3：办公区；4：其它
	private Integer type;
	
	private School school;//所属学校
	
	//独立客户组1：开启；0：关闭
	private Integer independentGroup =0;
	
	//描述
	private String description;
	
	//强制下线  1：强制下线；0：不强制下线
	private Integer kick;
	
	//pin码启用  1：启用pin码；0：不启用pin码
	private Integer passAddedPin =0;
	
	//带宽分享  1：分享；0：不分享
	private Integer sharedBandRate =0;
	
	private String nasIp;
	
	private String nasPortId;
	
	private Integer nasPort;
	
	private String vlanID1;
	
	private String vlanID2;
	
	private Integer pcMaxSession;
	
	private Integer moMaxSession;
	
	private Integer vlanBindTag;
	
	private Integer ipBindTag;    
	
	
	public Integer getPcMaxSession() {
		if (pcMaxSession==null) {
			return 0;
		}
		return pcMaxSession;
	}

	public void setPcMaxSession(Integer pcMaxSession) {
		this.pcMaxSession = pcMaxSession;
	}

	public Integer getMoMaxSession() {
		if (moMaxSession==null) {
			return 0;
		}
		return moMaxSession;
	}

	public void setMoMaxSession(Integer moMaxSession) {
		this.moMaxSession = moMaxSession;
	}

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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getIndependentGroup() {
		return independentGroup;
	}

	public void setIndependentGroup(Integer independentGroup) {
		this.independentGroup = independentGroup;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getKick() {
		return kick;
	}

	public void setKick(Integer kick) {
		this.kick = kick;
	}

	public String getNasPortId() {
		return nasPortId;
	}

	public void setNasPortId(String nasPortId) {
		this.nasPortId = nasPortId;
	}

	public Integer getNasPort() {
		if (nasPort==null) {
			return 0;
		}
		return nasPort;
	}

	public void setNasPort(Integer nasPort) {
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
	
	@Column(name="ISPASSADDEDPIN")
	public Integer getPassAddedPin() {
		return passAddedPin;
	}

	public void setPassAddedPin(Integer passAddedPin) {
		this.passAddedPin = passAddedPin;
	}

	@Column(name="SHAREDBANDRATE")
	public Integer getSharedBandRate() {
		return sharedBandRate;
	}

	public void setSharedBandRate(Integer sharedBandRate) {
		this.sharedBandRate = sharedBandRate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
	
	
}
