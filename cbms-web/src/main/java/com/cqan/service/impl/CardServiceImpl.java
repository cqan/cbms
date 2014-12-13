package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cqan.repository.CardRepository;
import com.cqan.service.CardService;
import com.cqan.system.Card;
import com.cqan.system.CardBatch;

@Service("cardService")
public class CardServiceImpl extends
		BaseServiceImpl<Card, Long, CardRepository> implements CardService {

	@Override
	@Autowired
	public void setEntityRepository(CardRepository repository) {
		this.repository = repository;
	}

	@Override
	@Transactional
	public void deleteByCardBatch(CardBatch cb) {
		repository.deleteByCardBatch(cb.getId());
	}

	@Override
	public List<Card> findByCardBatch(CardBatch cb) {
		return repository.findByCardBatch(cb);
	}

	@Override
	public Card findByCardNo(String cardNo) {
		return repository.findByCardNo(cardNo);
	}

	

}
