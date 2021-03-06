package com.cqan.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.Account;
import com.cqan.account.AccountAuth;
import com.cqan.account.FeePolicy;
import com.cqan.net.NetConfig;
import com.cqan.repository.AccountAuthRepository;
import com.cqan.school.AccountGroup;
import com.cqan.service.AccountAuthService;
import com.cqan.service.AccountGroupService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.NetConfigService;

@Service("accountAuthService")
public class AccountAuthServiceImpl extends
		BaseServiceImpl<AccountAuth, Long, AccountAuthRepository> implements AccountAuthService{

	@Autowired
	private NetConfigService netConfigService;
	
	@Autowired
	private FeePolicyService feePolicyService;
	
	@Autowired
	private AccountGroupService accountGroupService;
	
	@Override
	public void updateAccount(Account account) {
		AccountAuth aa = repository.findByUserName(account.getUserName());
		if (aa==null) {
			aa = new AccountAuth();
			aa.setCreateTime(new Date());
		}
		aa.setUserStatus(account.getStatus());
		aa.setPassword(account.getPassword());
		aa.setSchoolcode(String.valueOf(account.getSchoolId()));
		aa.setUserStatusTime(new Date());
		aa.setUpdateTime(new Date());
		aa.setUserName(account.getUserName());
		aa.setMobile(account.getMobile());
		if (account.getGroup().getId()!=null) {
			aa.setLoginpolicy(loginPolicy(account.getGroup().getId()));
		}
		AccountGroup ag = accountGroupService.get(account.getGroup().getId());
		if (ag!=null) {
			aa.setIpbindtag(ag.getIpBindTag());
			aa.setNasIp(ag.getNasIp());
			aa.setPcMaxSession(ag.getPcMaxSession());
			aa.setMoMaxSession(ag.getMoMaxSession());
			aa.setNasPort(ag.getNasPort());
			aa.setNasPortId(ag.getNasPortId());
			aa.setKickofftag(ag.getKick());
			aa.setPassAddedPin(ag.getPassAddedPin());
			aa.setSharedBandRate(ag.getSharedBandRate());
			aa.setVlanbindtag(ag.getVlanBindTag());
			aa.setVlanId1(ag.getVlanID1());
			aa.setVlanId2(ag.getVlanID2());
		}
		if (account.getFeePolicyId()!=null) {
			FeePolicy fp = feePolicyService.get(account.getFeePolicyId());
			if (fp!=null) {
				aa.setInputkg(getBit(fp.getUpControl()));
				aa.setOutputkg(getBit(fp.getDownControl()));
			}
			repository.save(aa);
		}
	}
	
	private long getBit(Integer kg){
		return kg*1024*1024;
	}

	@Override
	@Autowired
	public void setEntityRepository(AccountAuthRepository repository) {
		this.repository = repository;
	}
	
	private String loginPolicy(Long groupId){
		List<NetConfig> ncs = netConfigService.findByGroupId(groupId);
		if (ncs!=null&&!ncs.isEmpty()) {
			StringBuffer sb = new StringBuffer();
			for (int i=0;i<ncs.size();i++) {
				NetConfig nc = ncs.get(i);
				sb.append(nc.getStartWork()).append(".").append(nc.getEndWork()).append(".").append(nc.getStartTime())
				.append(".").append(nc.getEndTime()).append(".0");
				if (i!=ncs.size()-1) {
					sb.append(";");
				}
			}
			return sb.toString();
		}
		return "";
	}

}
