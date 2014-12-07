package com.cqan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.cqan.net.NetConfig;

public interface NetConfigRepository extends BaseRepository<NetConfig, Long> {
	
	@Query("from NetConfig where agid=?")
	List<NetConfig> findByGroupId(Long gid);
	
}
