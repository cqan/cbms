package com.cqan.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	   @RequestMapping(value="/save.html",method=RequestMethod.POST)
	    public String save(Role role,Model model){
	    	if (role.getId()==null||role.getId()==0) {
	    		role.setCreateTime(new Date());
			}else{
				Role r = entityService.get(role.getId());
				role.setCreateTime(r.getCreateTime());
			}
	    	entityService.save(role);
	    	return "role/edit";
	    }
}
