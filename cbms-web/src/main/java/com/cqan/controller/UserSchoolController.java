package com.cqan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cqan.school.School;
import com.cqan.service.SchoolService;
import com.cqan.service.UserSchoolService;
import com.cqan.service.UserService;
import com.cqan.system.User;
import com.cqan.system.UserSchool;
import com.google.common.base.Splitter;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/userSchool")
public class UserSchoolController extends BaseController<UserSchool,Long,UserSchoolService>{

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private UserService userService;
	
    @Override
    @Autowired
    public void setEntityService(UserSchoolService userSchoolService) {
        this.entityService = userSchoolService;
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(String schoolIds,Long userId,Model model){

    	entityService.delByUserId(userId);
    	User user = userService.get(userId);
    	if (!StringUtils.isBlank(schoolIds)) {
        	List<String> ids = Splitter.on(",").trimResults().splitToList(schoolIds);
        	for (String usid : ids) {
        		UserSchool us = new UserSchool();
        		us.setCreateTime(new Date());
        		us.setSchoolId(Long.parseLong(usid));
        		us.setUpdateTime(new Date());
        		us.setUserId(userId);
        		entityService.save(us);
    		}
		}
		List<School> schools = schoolService.listAll();
		List<School> inMySchools = new ArrayList<School>();
		String userName = getCurrentUserName();
		if (StringUtils.isBlank(userName)) {
			return null;
		}
		List<UserSchool> us = entityService.findByUserId(userId);
		for (UserSchool userSchool : us) {
			for (School school : schools) {
				if (school.getId().equals(userSchool.getSchoolId())) {
					inMySchools.add(school);
				}
			}
		}
		schools.removeAll(inMySchools);
        model.addAttribute("schools",schools);
        model.addAttribute("inMySchools",inMySchools);
        model.addAttribute("user",user);
        model.addAttribute("msg","操作成功！");
    	return "userSchool/edit";
    }
    

	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		User user = userService.get(id);
		List<School> schools = schoolService.listAll();
		List<School> inMySchools = new ArrayList<School>();
		String userName = getCurrentUserName();
		if (StringUtils.isBlank(userName)) {
			return null;
		}
		List<UserSchool> us = entityService.findByUserId(id);
		for (UserSchool userSchool : us) {
			for (School school : schools) {
				if (school.getId().equals(userSchool.getSchoolId())) {
					inMySchools.add(school);
				}
			}
		}
		schools.removeAll(inMySchools);
        model.addAttribute("schools",schools);
        model.addAttribute("inMySchools",inMySchools);
        model.addAttribute("user",user);
        return super.edit(id, model);
	}
    
    
}
