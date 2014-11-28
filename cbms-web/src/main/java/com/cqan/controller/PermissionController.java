package com.cqan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqan.service.PermissionService;
import com.cqan.system.Permission;

@Controller
@RequestMapping("/permission")
public class PermissionController extends
		BaseController<Permission, Long, PermissionService> {

	@Override
	@Autowired
	public void setEntityService(PermissionService entityService) {
		this.entityService = entityService;
	}

}
