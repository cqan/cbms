package com.cqan.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cqan.system.Card;
import com.cqan.system.CardBatch;

public interface CardRepository extends BaseRepository<Card, Long> {

	@Modifying
    @Query(value="delete from card  where card_batch_id= ?1",nativeQuery=true )
	void deleteByCardBatch(Long cardBatchId);
	
	@Query("from Card where card_batch_id= ?")
	List<Card> listByCardBatchId(Long cardBatchId);

	List<Card> findByCardBatch(CardBatch cb);

	Card findByCardNo(String cardNo);

	@Modifying
	@Query("update Card set endTime=?1 where card_batch_id=?2")
	void updateEndTime(Date endTime,Long cid);

}
