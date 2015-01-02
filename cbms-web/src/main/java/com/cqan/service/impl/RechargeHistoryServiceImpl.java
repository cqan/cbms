package com.cqan.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.account.FeePolicy;
import com.cqan.account.RechargeHistory;
import com.cqan.repository.RechargeHistoryRepository;
import com.cqan.service.FeePolicyService;
import com.cqan.service.RechargeHistoryService;
import com.google.common.collect.Maps;

@Service("rechargeHistoryService")
public class RechargeHistoryServiceImpl extends
		BaseServiceImpl<RechargeHistory, Long, RechargeHistoryRepository>
		implements RechargeHistoryService {

	@Autowired
	private FeePolicyService feePolicyService;
	
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Override
	@Autowired
	public void setEntityRepository(RechargeHistoryRepository repository) {
		this.repository = repository;
	}

	@Override
	public void saveHistory(String userName, Long feePolicyId,String orderNo,
			String description, Integer rechargeType, Integer status) {
		RechargeHistory rh = new RechargeHistory();
		rh.setCreateTime(new Date());
		rh.setUserName(userName);
		rh.setDescription(description);
		rh.setFeePolicyId(feePolicyId);
		rh.setStreamNumber(orderNo);
		rh.setRechargeType(rechargeType);
		rh.setStatus(status);
		rh.setUpdateTime(new Date());
		FeePolicy fp = feePolicyService.get(feePolicyId);
		if (fp!=null) {
			rh.setFeePolicyName(fp.getName());
			rh.setPrice(fp.getPrice());
			rh.setTime(fp.getTime());
		}
		save(rh);
	}

	@Override
	public List<RechargeHistory> findUnRechargeHistory(String userName,Date rechargeTime) {
		
		return repository.findRecharegeHistory(userName,rechargeTime);
	}

	@Override
	public Long countCurrMonthRechargeHistory(String username) {
		Map<String,Object> searchParams = Maps.newHashMap();
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DATE, 0);
		c.set(Calendar.HOUR, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		searchParams.put("GTED_createTime",sdf.format(c.getTime()));
		searchParams.put("EQS_userName",username);
		return repository.count(buildSpecification(searchParams));
	}

	@Override
	public List<RechargeHistory> findByStreamNumber(String userName,String streamNumber) {
		
		return repository.findByStreamNumber(userName,streamNumber);
	}

	

}
