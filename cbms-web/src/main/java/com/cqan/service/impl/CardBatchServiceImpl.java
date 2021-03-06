package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.CardBatchRepository;
import com.cqan.service.CardBatchService;
import com.cqan.system.CardBatch;

@Service("cardBatchService")
public class CardBatchServiceImpl extends
		BaseServiceImpl<CardBatch, Long, CardBatchRepository> implements CardBatchService {

	@Override
	@Autowired
	public void setEntityRepository(CardBatchRepository repository) {
		this.repository = repository;
	}

	@Override
	public List<CardBatch> findByStatus(int status) {
		
		return repository.findByStatus(status);
	}

	

}
