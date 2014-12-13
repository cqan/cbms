package com.cqan.account;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.cqan.IdLongEntity;

/**
 * 用户授权表
 * @author wuhui
 *
 */

@Entity
@Table(name="aaa_radius")
public class AccountAuth extends IdLongEntity {

	//认证用户名类型，pppoe-pc， 手机：mobile 
	private String authorType;
	
	private String framedIp;
	
	private Long inputkg;
	
	private Integer kickofftag;
	
	private String mobile;
	
	private Integer moCurSession;
	
	private Integer moMaxSession;
	
	private String nasIp;
	
	private String nasPort;
	
	private String nasPortId;
	
	private Long outputkg;
	
	private String password;
	
	private Integer pcCurSession;
	
	private Integer pcMaxSession;
	
	private Date timeStamp;
	
	private String userName;
	
	//用户状态：0-正常，1：停机  （开户时默认状态为1）
	private Integer userStatus;
	
	private Date userStatusTime;
	
	private String vlanId1;
	
	private String vlanId2;
	
	private Integer vlanbindtag;
	
	private String loginpolicy;
	
	private Integer ipbindtag;
	
	
	/**
	 * 绑定标志：0-禁止绑定，1-需要绑定，2-已绑定vlan，用于绑定vlan。
	 * @return
	 */
	@Column(name="vlanbindtag")
	public Integer getVlanbindtag() {
		return vlanbindtag;
	}

	
	public void setVlanbindtag(Integer vlanbindtag) {
		this.vlanbindtag = vlanbindtag;
	}
	/**
	 * 登录的时间策略 格式：week.beginHHMM.endHHMM.allow; 1:allow,0:deny.
	 * @return 
	 */
	@Column(name="loginpolicy")
	public String getLoginpolicy() {
		return loginpolicy;
	}

	public void setLoginpolicy(String loginpolicy) {
		this.loginpolicy = loginpolicy;
	}

	/**
	 * 绑定标志：0-禁止绑定，1-需要绑定，3-已绑定NAS-IP-Address，用于绑定NAS-IP-Address。
	 * @return
	 */
	@Column(name="ipbindtag")
	public Integer getIpbindtag() {
		return ipbindtag;
	}

	public void setIpbindtag(Integer ipbindtag) {
		this.ipbindtag = ipbindtag;
	}

	/**
	 * 
	 * 认证用户名类型，pppoe-pc， 手机：mobile 
	 * @return
	 */
	@Column(name="author_type")
	public String getAuthorType() {
		return authorType;
	}

	/**
	 * Framed-IP-Address私网地址
	 * @return
	 */
	@Column(name="framed_ip")
	public String getFramedIp() {
		return framedIp;
	}

	/**
	 * 下行流量，单位字节（管理平台计费套餐）
	 * @return
	 */
	@Column(name="inputpkg")
	public Long getInputkg() {
		return inputkg;
	}

	/**
	 * 踢用户下线标志0-可以被踢下线, 1-禁止被踢下线 （管理平台）
	 * @return
	 */
	@Column(name="kickofftag")
	public Integer getKickofftag() {
		return kickofftag;
	}

	/**
	 * 用户绑定的手机号码  （管理平台）
	 * @return
	 */
	@Column(name="mobile")
	public String getMobile() {
		return mobile;
	}

	/**
	 * 手机登录当前在线用户数
	 * @return
	 */
	@Column(name="mo_cur_session")
	public Integer getMoCurSession() {
		return moCurSession;
	}

	/**
	 * 手机登录最大允许在线用户数（管理平台客户组配置）
	 * @return
	 */
	@Column(name="mo_max_session")
	public Integer getMoMaxSession() {
		return moMaxSession;
	}

	/**
	 * NAS-IP-Address BrasIP地址  （管理平台客户组配置根据绑定标识变化）
	 * @return
	 */
	@Column(name="nas_ip")
	public String getNasIp() {
		return nasIp;
	}

	/**
	 * NAS-Port
	 * @return
	 */
	@Column(name="nas_port")
	public String getNasPort() {
		return nasPort;
	}

	/**
	 * NAS-Port-Id
	 * @return
	 */
	@Column(name="nas_port_id")
	public String getNasPortId() {
		return nasPortId;
	}

	/**
	 * 上行流量，单位字节（管理平台计费套餐）
	 * @return
	 */
	@Column(name="outputpkg")
	public Long getOutputkg() {
		return outputkg;
	}

	/**
	 * 账号密码（管理平台对其操作）
	 * @return
	 */
	@Column(name="user_password")
	public String getPassword() {
		return password;
	}

	/**
	 * pc登录当前在线用户数
	 * @return
	 */
	@Column(name="pc_cur_session")
	public Integer getPcCurSession() {
		return pcCurSession;
	}

	/**
	 * pc登录最大允许在线用户数（管理平台客户组配置）
	 * @return
	 */
	@Column(name="pc_max_session")
	public Integer getPcMaxSession() {
		return pcMaxSession;
	}

	/**
	 * 时间戳  
	 * @return
	 */
	@Column(name="time_stamp")
	public Date getTimeStamp() {
		return timeStamp;
	}

	/**
	 * 认证账号用户名（管理平台对其操作）
	 * @return
	 */
	@Column(name="user_name")
	public String getUserName() {
		return userName;
	}

	/**
	 * 用户状态：0-正常，1：停机  （开户时默认状态为1）
	 * @return
	 */
	@Column(name="user_status")
	public Integer getUserStatus() {
		return userStatus;
	}

	/**
	 * 状态更新时间（管理平台）
	 * @return
	 */
	@Column(name="user_status_time")
	public Date getUserStatusTime() {
		return userStatusTime;
	}

	/**
	 * 内vlan  （管理平台客户组配置根据绑定标识变化）
	 * @return
	 */
	@Column(name="vlan_id1")
	public String getVlanId1() {
		return vlanId1;
	}

	/**
	 * 外vlan  （管理平台客户组配置根据绑定标识变化）
	 * @return
	 */
	@Column(name="vlan_id2")
	public String getVlanId2() {
		return vlanId2;
	}

	public void setAuthorType(String authorType) {
		this.authorType = authorType;
	}

	public void setFramedIp(String framedIp) {
		this.framedIp = framedIp;
	}

	public void setInputkg(Long inputkg) {
		this.inputkg = inputkg;
	}

	public void setKickofftag(Integer kickofftag) {
		this.kickofftag = kickofftag;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setMoCurSession(Integer moCurSession) {
		this.moCurSession = moCurSession;
	}

	public void setMoMaxSession(Integer moMaxSession) {
		this.moMaxSession = moMaxSession;
	}

	public void setNasIp(String nasIp) {
		this.nasIp = nasIp;
	}

	public void setNasPort(String nasPort) {
		this.nasPort = nasPort;
	}

	public void setNasPortId(String nasPortId) {
		this.nasPortId = nasPortId;
	}

	public void setOutputkg(Long outputkg) {
		this.outputkg = outputkg;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPcCurSession(Integer pcCurSession) {
		this.pcCurSession = pcCurSession;
	}

	public void setPcMaxSession(Integer pcMaxSession) {
		this.pcMaxSession = pcMaxSession;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

	public void setUserStatusTime(Date userStatusTime) {
		this.userStatusTime = userStatusTime;
	}

	public void setVlanId1(String vlanId1) {
		this.vlanId1 = vlanId1;
	}

	public void setVlanId2(String vlanId2) {
		this.vlanId2 = vlanId2;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
	
	
	
}
