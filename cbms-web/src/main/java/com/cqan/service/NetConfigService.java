package com.cqan.service;

import java.util.List;

import com.cqan.net.NetConfig;

public interface NetConfigService extends BaseService<NetConfig, Long> {

	List<NetConfig> findByAgid(Long groupId);

}
