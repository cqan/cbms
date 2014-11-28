package com.cqan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqan.service.RoleService;
import com.cqan.system.Role;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController<Role, Long, RoleService>{

	@Override
	@Autowired
	public void setEntityService(RoleService entityService) {
		this.entityService = entityService;
	}

}
