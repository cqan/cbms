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

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController<Account,Long,AccountService>{

	@Autowired
	private SchoolService schoolService;
	
    @Override
    @Autowired
    public void setEntityService(AccountService accountService) {
        this.entityService = accountService;
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(Account account,Model model){
    	Account a =null;
    	//School school = schoolService.get(account.getId());
    	if (account.getId()==null||account.getId()==0) {
    		account.setCreateTime(new Date());
    		//account.setSchool(school);
    		a = account;
			model.addAttribute("msg","添加成功！");
		}else{
			a = entityService.get(account.getId());
			a.setCode(account.getCode());
			a.setActive(account.isActive());
			a.setAddress(account.getAddress());
			a.setCode(account.getCode());
			a.setEmail(account.getEmail());
			a.setFeePolicyId(account.getFeePolicyId());
			a.setGroup(account.getGroup());
			a.setLicenseNo(account.getLicenseNo());
			a.setLicenseType(account.getLicenseType());
			a.setName(account.getName());
			a.setPassword(account.getPassword());
			a.setPhoneNum(account.getPhoneNum());
			a.setSchoolId(account.getSchoolId());
			model.addAttribute("msg","修改成功！");
		}
    	account.setUpdateTime(new Date());
    	model.addAttribute("entity", a);
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
    	entityService.save(a);
    	return "account/edit";
    }
    

	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
        return super.edit(id, model);
	}
    
    
}
