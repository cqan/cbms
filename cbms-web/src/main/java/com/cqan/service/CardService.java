package com.cqan.service;

import java.util.List;

import com.cqan.system.Card;
import com.cqan.system.CardBatch;

public interface CardService extends BaseService<Card, Long> {

	void deleteByCardBatch(CardBatch cb);

	List<Card> findByCardBatch(CardBatch cb);

	Card findByCardNo(String cardNo);

}
