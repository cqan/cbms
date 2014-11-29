package com.cqan.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqan.service.UserService;
import com.cqan.system.User;

/**
 * Created by huiwu on 2014/10/19.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User,Long,UserService>{

    @Override
    @Autowired
    public void setEntityService(UserService userService) {
        this.entityService = userService;
    }
    
    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(User user,Model model){
    	if (user.getId()==null||user.getId()==0) {
			user.setBirthday(new Date());
			user.setCreateTime(new Date());
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
    	entityService.save(user);
    	return "user/edit";
    }
    
    @ResponseBody
    @RequestMapping("/checkUserName.html")
    public Boolean checkUserName(String userName){
    	
    	
    	return true;
    }

}
