package com.cqan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cqan.school.AccountGroup;
import com.cqan.school.School;
import com.cqan.service.AccountGroupService;
import com.cqan.service.SchoolService;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/accountGroup")
public class AccountGrouplController extends BaseController<AccountGroup,Long,AccountGroupService>{

	@Autowired
	private SchoolService schoolService;
	
    @Override
    @Autowired
    public void setEntityService(AccountGroupService groupService) {
        this.entityService = groupService;
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(AccountGroup accountGroup,Model model){
    	AccountGroup ag;
    	School school = schoolService.get(accountGroup.getSchool().getId());
    	if (accountGroup.getId()==null||accountGroup.getId()==0) {
    		accountGroup.setCreateTime(new Date());
    		accountGroup.setSchool(school);
    		ag = accountGroup;
			model.addAttribute("msg","添加成功！");
		}else{
			ag = entityService.get(accountGroup.getId());
			ag.setCode(accountGroup.getCode());
			ag.setDescription(accountGroup.getDescription());
			ag.setIndependentGroup(accountGroup.getIndependentGroup());
			ag.setName(accountGroup.getName());
			accountGroup.setSchool(school);
			ag.setType(accountGroup.getType());
			model.addAttribute("msg","修改成功！");
		}
    	accountGroup.setUpdateTime(new Date());
    	model.addAttribute("entity", ag);
    	entityService.save(ag);
    	return "accountGroup/edit";
    }

    
    
	@Override
	@RequestMapping("/index.html")
	 public String page(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,String sortField,
             @RequestParam(value = "page", defaultValue = "1") int pageNumber,@RequestParam
             (value = "pageSize", defaultValue = PAGESIZE) int pageSize, Model model,HttpServletRequest request) {
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
		return super.page(sortType, sortField, pageNumber, pageSize, model, request);
	}

	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
        return super.edit(id, model);
	}
    
    
}
