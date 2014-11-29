package com.cqan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqan.repository.GroupRepository;
import com.cqan.school.Group;
import com.cqan.service.GroupService;

@Service("groupService")
public class GroupServiceImpl extends BaseServiceImpl<Group, Long, GroupRepository> implements GroupService {

	@Override
	@Autowired
	public void setEntityRepository(GroupRepository repository) {
		this.repository = repository;
	}


}
