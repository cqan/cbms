package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.CardRepository;
import com.cqan.service.CardService;
import com.cqan.system.Card;

@Service("cardService")
public class CardServiceImpl extends
		BaseServiceImpl<Card, Long, CardRepository> implements CardService {

	@Override
	@Autowired
	public void setEntityRepository(CardRepository repository) {
		this.repository = repository;
	}

	

}
