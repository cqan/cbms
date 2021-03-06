package com.cqan.net;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.cqan.IdLongEntity;

@Entity
@Table(name="net_config")
public class NetConfig extends IdLongEntity {

	//客户组ID
	private Long agid;
	
	private String startWork;
	
	private String endWork;
	
	private String startTime;
	
	private String endTime;

	
	public NetConfig() {
		super();
	}

	public NetConfig(Long agid, String startWork, String endWork,
			String startTime, String endTime) {
		super();
		this.agid = agid;
		this.startWork = startWork;
		this.endWork = endWork;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public Long getAgid() {
		return agid;
	}

	public void setAgid(Long agid) {
		this.agid = agid;
	}

	public String getStartWork() {
		return startWork;
	}

	public void setStartWork(String startWork) {
		this.startWork = startWork;
	}

	public String getEndWork() {
		return endWork;
	}

	public void setEndWork(String endWork) {
		this.endWork = endWork;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
	
	
}
