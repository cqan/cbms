package com.cqan.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqan.service.RoleService;
import com.cqan.service.UserService;
import com.cqan.shiro.credentials.PasswordHelper;
import com.cqan.system.Role;
import com.cqan.system.User;
import com.google.common.collect.Lists;

/**
 * Created by huiwu on 2014/10/19.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User,Long,UserService>{

	private static final String DEFAULT_PASSPORT = "123456";
	
	@Autowired
	private RoleService roleService;
	
    @Override
    @Autowired
    public void setEntityService(UserService userService) {
        this.entityService = userService;
    }
    
    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(User user,Model model,HttpServletRequest request){
    	if (user.getId()==null||user.getId()==0) {
			user.setBirthday(new Date());
			user.setCreateTime(new Date());
			user.setPassword(PasswordHelper.encryptPassword(user.getUserName(), DEFAULT_PASSPORT));
			model.addAttribute("msg","添加成功！");
		}else{
			User u = entityService.get(user.getId());
			user.setBirthday(u.getBirthday());
			user.setCreateTime(u.getCreateTime());
			user.setAvatar(u.getAvatar());
			user.setPassword(u.getPassword());
			user.setRoles(u.getRoles());
			model.addAttribute("msg","修改成功！");
		}
    	user.setUpdateTime(new Date());
    	model.addAttribute("entity", user);
    	entityService.save(user);
    	return page("", "", 1, 10, model, request);
    }
    
    
    @RequestMapping(value="/auth.html",method=RequestMethod.GET)
    public String auth(Long id,String msg,Model model){
    	User user = entityService.get(id);
    	List<Role> roles = roleService.listAll();
    	model.addAttribute("entity", user);
    	model.addAttribute("roles", roles);
    	if (StringUtils.isNoneBlank(msg)) {
    		model.addAttribute("msg",msg);
		}
    	return "user/auth";
    }
    @RequestMapping(value="/auth.html",method=RequestMethod.POST)
    public String saveAuth(HttpServletRequest req,Long id,RedirectAttributes model){
    	User u = entityService.get(id);
		if (u!=null) {
				String [] rids = req.getParameterValues("rids");
				List<Role> roles = Lists.newArrayList();
				if (rids!=null&&rids.length>0) {
					for (String rid : rids) {
						if (rid!=null) {
							roles.add(roleService.get(Long.parseLong(rid)));
						}
					}
				}
				u.setRoles(roles);
				u.setUpdateTime(Calendar.getInstance().getTime());
				u.setLastLoginIp(req.getRemoteAddr());
				entityService.update(u);
		}
		model.addAttribute("msg","修改用户角色成功！");
    	return "redirect:/user/auth.html?id="+id;
    }
    
    @RequestMapping(value="/resetpwd.html")
    public String resetpwd(String newpwd,Model model){
    	Subject subject = SecurityUtils.getSubject();
    	String userName = (String) subject.getPrincipal();
    	if (StringUtils.isNoneBlank(userName)) {
			User user = entityService.findByUserName(userName);
			if (user!=null&&user.getStatus()==1) {
				user.setPassword(PasswordHelper.encryptPassword(userName, newpwd));
				entityService.save(user);
				model.addAttribute("msg", "修改密码成功！");
			}
		}
    	return "/index";
    }
    
    
    @ResponseBody
    @RequestMapping("/checkUserName.html")
    public String checkUserName(String userName,Long id){
    	if (StringUtils.isBlank(userName)) {
			return "true";
		}
    	//修改
    	User user = entityService.findByUserName(userName);
    	if (id!=null&&id!=0) {
			if (user==null||user.getId()==id) {
				return "true";
			}
		}else if(user==null){
			return "true";
		}
    	return "false";
    }
    
    
    
    @ResponseBody
    @RequestMapping(value="/disable.html",method=RequestMethod.POST)
    public String disable(Long id){
    	if (id==null||id==0) {
			return "请求参数错误！";
		}
    	User user = entityService.get(id);
    	if (user==null) {
			return "用户不存在！";
		}
    	if (user.getStatus()==2) {
			user.setStatus(1);
			entityService.save(user);
			return "用户启用成功！";
		}else{
			user.setStatus(2);
			return "用户禁用成功！";
		}
    }

}
