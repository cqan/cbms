package com.cqan.service;

import java.util.List;

import com.cqan.net.NetConfig;

public interface NetConfigService extends BaseService<NetConfig, Long> {

	public List<NetConfig> findByGroupId(Long gid);

	public void delByGroupId(long groupId);
}
