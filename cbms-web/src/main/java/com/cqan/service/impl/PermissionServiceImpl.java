package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.PermissionRepository;
import com.cqan.service.PermissionService;
import com.cqan.system.Permission;

@Service("permissionService")
public class PermissionServiceImpl extends
		BaseServiceImpl<Permission, Long, PermissionRepository> implements
		PermissionService {

	@Override
	@Autowired
	public void setEntityRepository(PermissionRepository repository) {
		this.repository = repository;
	}

	
}
