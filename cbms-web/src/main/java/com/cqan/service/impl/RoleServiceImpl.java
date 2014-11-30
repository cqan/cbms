package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.RoleRepository;
import com.cqan.service.RoleService;
import com.cqan.system.Role;

@Service("roleService")
public class RoleServiceImpl extends
		BaseServiceImpl<Role, Long, RoleRepository> implements RoleService {

	@Override
	@Autowired
	public void setEntityRepository(RoleRepository repository) {
		this.repository = repository;
	}

	@Override
	public Role findByRoleCode(String roleCode) {
		return repository.findByRoleCode(roleCode);
	}

	

}
