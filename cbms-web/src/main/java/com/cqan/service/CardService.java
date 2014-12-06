package com.cqan.service;

import com.cqan.system.Card;
import com.cqan.system.CardBatch;

public interface CardService extends BaseService<Card, Long> {

	void deleteByCardBatch(CardBatch cb);

}
