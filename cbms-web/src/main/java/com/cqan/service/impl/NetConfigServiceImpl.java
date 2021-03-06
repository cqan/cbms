package com.cqan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cqan.net.NetConfig;
import com.cqan.repository.NetConfigRepository;
import com.cqan.service.NetConfigService;

@Service("netConfigService")
public class NetConfigServiceImpl extends
		BaseServiceImpl<NetConfig, Long, NetConfigRepository> implements NetConfigService{

	@Override
	@Autowired
	public void setEntityRepository(NetConfigRepository repository) {
		this.repository = repository;
	}
	
	
	@Override
	public List<NetConfig> findByGroupId(Long gid) {
		return repository.findByGroupId(gid);
	}


	@Override
	@Transactional
	public void delByGroupId(long groupId) {
		repository.delByGroupId(groupId);
	}
	
	

}
