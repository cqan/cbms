package com.cqan.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cqan.account.Account;
import com.cqan.school.School;
import com.cqan.service.AccountService;
import com.cqan.service.SchoolService;
import com.cqan.service.UserSchoolService;
import com.cqan.system.UserSchool;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/userSchool")
public class UserSchoolController extends BaseController<UserSchool,Long,UserSchoolService>{

	@Autowired
	private SchoolService schoolService;
	
    @Override
    @Autowired
    public void setEntityService(UserSchoolService userSchoolService) {
        this.entityService = userSchoolService;
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(UserSchool userSchool,Model model){
    	UserSchool us =null;
    	//School school = schoolService.get(account.getId());
    	if (userSchool.getId()==null||userSchool.getId()==0) {
    		userSchool.setCreateTime(new Date());
    		//account.setSchool(school);
    		us = userSchool;
			model.addAttribute("msg","添加成功！");
		}else{
			us = entityService.get(userSchool.getId());
			model.addAttribute("msg","修改成功！");
		}
    	userSchool.setUpdateTime(new Date());
    	model.addAttribute("entity", us);
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
    	entityService.save(us);
    	return "userSchool/edit";
    }
    

	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
        return super.edit(id, model);
	}
    
    
}
