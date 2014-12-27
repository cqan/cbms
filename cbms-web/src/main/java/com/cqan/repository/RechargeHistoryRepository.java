package com.cqan.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.cqan.account.RechargeHistory;

public interface RechargeHistoryRepository extends
		BaseRepository<RechargeHistory, Long> {


	@Query("from RechargeHistory where status=1 and rechargeType=2 and userName=?1 and createTime<=?2")
	public List<RechargeHistory> findRecharegeHistory(String userName,Date rechargeTime);

	@Query("from RechargeHistory where status=1 and rechargeType=2 and userName=?1 and streamNumber=?2")
	public List<RechargeHistory> findByStreamNumber(String userName,String streamNumber);
}
