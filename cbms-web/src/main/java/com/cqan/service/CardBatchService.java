package com.cqan.service;

import java.util.List;

import com.cqan.system.CardBatch;

public interface CardBatchService extends BaseService<CardBatch, Long> {

	List<CardBatch> findByStatus(int i);

}
