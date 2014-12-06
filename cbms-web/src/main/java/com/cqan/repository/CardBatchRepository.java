package com.cqan.repository;

import java.util.List;

import com.cqan.system.CardBatch;

public interface CardBatchRepository extends BaseRepository<CardBatch, Long> {

	List<CardBatch> findByStatus(int status);

}
