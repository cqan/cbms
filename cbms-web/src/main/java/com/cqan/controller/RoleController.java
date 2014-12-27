package com.cqan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqan.service.PermissionService;
import com.cqan.service.RoleService;
import com.cqan.system.Permission;
import com.cqan.system.Role;
import com.google.common.collect.Lists;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController<Role, Long, RoleService> {

	@Autowired
	private PermissionService permissionService;

	@Override
	@Autowired
	public void setEntityService(RoleService entityService) {
		this.entityService = entityService;
	}

	@RequestMapping(value = "/save.html", method = RequestMethod.POST)
	public String save(Role role, Model model,HttpServletRequest request) {
		if (role.getId() == null || role.getId() == 0) {
			role.setCreateTime(new Date());
			model.addAttribute("msg", "添加成功！");
		} else {
			Role r = entityService.get(role.getId());
			role.setCreateTime(r.getCreateTime());
			model.addAttribute("msg", "修改成功！");
		}
		entityService.save(role);
		model.addAttribute("entity", role);
		return page("", "", 1, 10, model, request);
	}

	@ResponseBody
	@RequestMapping("/checkRoleCode.html")
	public String checkUserName(String roleCode, Long id) {
		if (StringUtils.isBlank(roleCode)) {
			return "true";
		}
		// 修改
		Role role = entityService.findByRoleCode(roleCode);
		if (id != null && id != 0) {
			if (role == null || role.getId() == id) {
				return "true";
			}
		} else if (role == null) {
			return "true";
		}
		return "false";
	}

	@RequestMapping(value = "/auth.html", method = RequestMethod.GET)
	public String auth(Long id,String msg, Model model) {
		Role role = entityService.get(id);
		List<Permission> auths = permissionService.listAll();
		model.addAttribute("entity", role);
		model.addAttribute("auths", auths);
		if (StringUtils.isNoneBlank(msg)) {
    		model.addAttribute("msg","修改角色权限成功！");
		}
		return "role/auth";
	}
	
	@RequestMapping(value = "/auth.html", method = RequestMethod.POST)
	public String saveAuth(Long id,HttpServletRequest req,RedirectAttributes model) {
		Role role = entityService.get(id);
		String[] aids = req.getParameterValues("auth");
		List<Permission> auths = Lists.newArrayList();
		if (aids!=null) {
			for (String aid : aids) {
				if (StringUtils.isNotBlank(aid)) {
					auths.add(permissionService.get(Long.parseLong(aid)));
				}
			}
			role.setPermissions(auths);
		}else{
			role.setPermissions(null);
		}
		model.addAttribute("msg","修改角色权限成功！");
		entityService.save(role);
		return "redirect:/role/auth.html?id="+id;
	}
	
	
}
