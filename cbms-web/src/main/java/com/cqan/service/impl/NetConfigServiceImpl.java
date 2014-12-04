package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
	

}
