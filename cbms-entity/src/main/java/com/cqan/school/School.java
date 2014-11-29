package com.cqan.school;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.cqan.IdLongEntity;
import com.cqan.system.User;

@Entity
@Table(name = "school")
public class School extends IdLongEntity {

	private String name;// 名称

	private String code;// 学校编码

	private String net;// 网络

	private String netType;// 上网方式(虚拟ADSL ,PPPOE.)
	
	private List<Group> groups;

	private List<User> users;

	private List<Fee> fees;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getNetType() {
		return netType;
	}

	public void setNetType(String netType) {
		this.netType = netType;
	}

	public String getNet() {
		return net;
	}

	public void setNet(String net) {
		this.net = net;
	}

	@OneToMany(mappedBy = "groups",cascade = {CascadeType.ALL},targetEntity=School.class,fetch = FetchType.EAGER)
	public List<Group> getGroups() {
		return groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	
	@OneToMany(mappedBy="fees",cascade = {CascadeType.ALL},targetEntity=School.class,fetch = FetchType.EAGER)
	public List<Fee> getFees() {
		return fees;
	}

	public void setFees(List<Fee> fees) {
		this.fees = fees;
	}
	
	@OneToMany(mappedBy="users",cascade = {CascadeType.ALL},targetEntity=School.class,fetch = FetchType.EAGER)
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	
}
