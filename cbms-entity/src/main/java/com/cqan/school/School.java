package com.cqan.school;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cqan.IdLongEntity;

@Entity
@Table(name = "school")
public class School extends IdLongEntity {

	private String name;// 名称

	private String code;// 学校编码

	private String net;// 网络

	private String netType;// 上网方式(虚拟ADSL ,PPPOE.)
	

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



	
	
}
