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
import com.cqan.service.AccountAuthService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.NetConfigService;

@Service("accountAuthService")
public class AccountAuthServiceImpl extends
		BaseServiceImpl<AccountAuth, Long, AccountAuthRepository> implements AccountAuthService{

	@Autowired
	private NetConfigService netConfigService;
	
	@Autowired
	private FeePolicyService feePolicyService;
	
	@Override
	public void createAccount(Account account) {
		AccountAuth aa = repository.findByUserName(account.getUserName());
		if (aa==null) {
			aa = new AccountAuth();
			aa.setPassword(account.getPassword());
			aa.setUserStatus(account.getStatus());
			aa.setCreateTime(new Date());
		}
		aa.setUserStatusTime(new Date());
		aa.setUpdateTime(new Date());
		aa.setLoginpolicy(loginPolicy(account.getGroup().getId()));
		FeePolicy fp = feePolicyService.get(account.getFeePolicyId());
		if (fp!=null) {
			aa.setInputkg(getBit(fp.getDownControl()));
			aa.setOutputkg(getBit(fp.getUpControl()));
		}
		repository.save(aa);
	}
	
	private long getBit(Integer kg){
		long c = kg;
		if (c==512) {
			c=c*1024;
		}else{
			c=c*1024*1024;
		}
		return c;
		
	}

	@Override
	@Autowired
	public void setEntityRepository(AccountAuthRepository repository) {
		this.repository = repository;
	}
	
	private String loginPolicy(Long groupId){
		List<NetConfig> ncs = netConfigService.findByGroupId(groupId);
		if (ncs!=null&&!ncs.isEmpty()) {
			StringBuffer all = new StringBuffer();
			for (int i=0;i<ncs.size();i++) {
				NetConfig nc = ncs.get(i);
				Integer sw = Integer.parseInt(nc.getStartWork());
				Integer ew = Integer.parseInt(nc.getEndWork());
				for (int j = sw; j <=ew; j++) {
					StringBuffer sb = new StringBuffer();
					sb.append(nc.getStartWork()).append(".begin").append(nc.getStartTime())
					.append(".end").append(nc.getEndTime());
					if (j!=ew) {
						sb.append(";");
					}
				}
				if (i!=ncs.size()-1) {
					all.append(";");
				}
			}
			return all.toString();
		}
		return "";
	}

}
