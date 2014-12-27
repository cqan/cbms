package com.cqan.service;

import java.util.Date;
import java.util.List;

import com.cqan.account.RechargeHistory;

public interface RechargeHistoryService extends
		BaseService<RechargeHistory, Long> {
	
	public void saveHistory(String userName,Long feePolicyId,String orderNo,String description,Integer rechargeType,Integer status);

	public List<RechargeHistory> findUnRechargeHistory(String userName,Date rechargeTime);

	public Long countCurrMonthRechargeHistory();

	public List<RechargeHistory> findByStreamNumber(String userName,String streamNumber);
}
