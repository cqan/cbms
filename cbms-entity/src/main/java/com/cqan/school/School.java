package com.cqan.school;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cqan.IdLongEntity;

@Entity
@Table(name = "school")
public class School extends IdLongEntity {

	private String name;// 名称

	private String code;// 学校编码

	//1:计时，2：包月
	private int rateType;// 网络

	//分成比率
	private float rate;

	//1：虚拟ADSL；2：PPPOE
	//上网方式(虚拟ADSL ,PPPOE.)
	private int netType;
	
	//1:可信；2:不可信
	private  int trusted;
	
	//学校虚拟标识
	private String virtualFlag;
	
	private int activeNum;
	
	//地区
	private String city;
	
	//区局
	private String district;
	
	private String subDistrict;
	
	//网络负责人
	private String netLeader;
	
	//网络负责人
	private String netLeaderPhone;
	
	//维护人
	private String maintenance;
	
	private String mPhone;
	
	private String customerManager;
	
	private String cmPhone;
	
	
	private String serverIp;
	
	private Integer serverPort;
	
	private String addr;
	
	private String description;

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

	public int getRateType() {
		return rateType;
	}

	public void setRateType(int rateType) {
		this.rateType = rateType;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public int getNetType() {
		return netType;
	}

	public void setNetType(int netType) {
		this.netType = netType;
	}

	public int getTrusted() {
		return trusted;
	}

	public void setTrusted(int trusted) {
		this.trusted = trusted;
	}

	public String getVirtualFlag() {
		return virtualFlag;
	}

	public void setVirtualFlag(String virtualFlag) {
		this.virtualFlag = virtualFlag;
	}

	public int getActiveNum() {
		return activeNum;
	}

	public void setActiveNum(int activeNum) {
		this.activeNum = activeNum;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getSubDistrict() {
		return subDistrict;
	}

	public void setSubDistrict(String subDistrict) {
		this.subDistrict = subDistrict;
	}

	public String getNetLeader() {
		return netLeader;
	}

	public void setNetLeader(String netLeader) {
		this.netLeader = netLeader;
	}

	public String getNetLeaderPhone() {
		return netLeaderPhone;
	}

	public void setNetLeaderPhone(String netLeaderPhone) {
		this.netLeaderPhone = netLeaderPhone;
	}

	public String getMaintenance() {
		return maintenance;
	}

	public void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getCustomerManager() {
		return customerManager;
	}

	public void setCustomerManager(String customerManager) {
		this.customerManager = customerManager;
	}

	public String getCmPhone() {
		return cmPhone;
	}

	public void setCmPhone(String cmPhone) {
		this.cmPhone = cmPhone;
	}

	public String getServerIp() {
		return serverIp;
	}

	public void setServerIp(String serverIp) {
		this.serverIp = serverIp;
	}

	public Integer getServerPort() {
		return serverPort;
	}

	public void setServerPort(Integer serverPort) {
		this.serverPort = serverPort;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
	
	
	
}
