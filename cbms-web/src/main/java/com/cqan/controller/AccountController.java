package com.cqan.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.cqan.account.Account;
import com.cqan.school.AccountGroup;
import com.cqan.school.FeePolicy;
import com.cqan.school.School;
import com.cqan.service.AccountGroupService;
import com.cqan.service.AccountService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.SchoolService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController<Account,Long,AccountService>{

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private AccountGroupService accountGroupService;
	
	@Autowired
	private FeePolicyService feePolicyService;
	
    @Override
    @Autowired
    public void setEntityService(AccountService accountService) {
        this.entityService = accountService;
    }
    
    @RequestMapping(value="/create.html")
    public String createAccount(Model model){
    	
    	return "account/create";
    }
    
    @ResponseBody
    @RequestMapping(value="/select.html")
    public String select(String name,String schoolId){
    	List<Map<String,Object>> data = Lists.newArrayList();
    	if (name.equals("school")) {
    		List<School> schools = schoolService.listAll();
    		for (School school : schools) {
    			Map<String,Object> map = Maps.newHashMap();
        		map.put("schoolId", school.getId());
        		map.put("schoolName", school.getName());
        		data.add(map);
			}
		}else if (name.equals("group")) {
    		if (StringUtils.isNotBlank(schoolId)) {
    			School school = schoolService.get(Long.parseLong(schoolId));
    			if (school!=null) {
	    			List<AccountGroup> ags = accountGroupService.findBySchool(school);
	        		for (AccountGroup ag : ags) {
	        			Map<String,Object> map = Maps.newHashMap();
	        			map.put("groupId", ag.getId());
	        			map.put("groupName", ag.getName());
	        			data.add(map);
	        		}
    			}
			}
    	}else if (name.equals("feePolicy")) {
    		if (StringUtils.isNotBlank(schoolId)) {
    			School school = schoolService.get(Long.parseLong(schoolId));
    			if (school!=null) {
	    			List<FeePolicy> fps = feePolicyService.findBySchool(school);
	        		for (FeePolicy ag : fps) {
	        			Map<String,Object> map = Maps.newHashMap();
	        			map.put("feePolicyId", ag.getId());
	        			map.put("feePolicyName", ag.getName());
	        			data.add(map);
	        		}
    			}
			}
    	}
    	
    	return JSON.toJSONString(data);
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
			a.setUserName(account.getUserName());
			a.setActive(account.isActive());
			a.setAddress(account.getAddress());
			a.setEmail(account.getEmail());
			a.setFeePolicyId(account.getFeePolicyId());
			a.setGroup(account.getGroup());
			a.setLicenseNo(account.getLicenseNo());
			a.setLicenseType(account.getLicenseType());
			a.setName(account.getName());
			a.setPassword(account.getPassword());
			a.setPhoneNum(account.getPhoneNum());
			a.setSchoolId(account.getSchoolId());
			a.setFeePolicyId(account.getFeePolicyId());
			model.addAttribute("msg","修改成功！");
		}
    	account.setUpdateTime(new Date());
    	model.addAttribute("entity", a);
    	entityService.save(a);
    	return "account/create";
    }
    


    @ResponseBody
    @RequestMapping("/checkUserName.html")
    public String checkUserName(String userName,Long id){
    	if (StringUtils.isBlank(userName)) {
			return "true";
		}
    	//修改
    	Account account = entityService.findByUserName(userName);
    	if (id!=null&&id!=0) {
			if (account==null||account.getId()==id) {
				return "true";
			}
		}else if(account==null){
			return "true";
		}
    	return "false";
    }
    
    
    @ResponseBody
    @RequestMapping("/checkLicenseNo.html")
    public String checkLicenseNo(String licenseNo,Long id){
    	if (StringUtils.isBlank(licenseNo)) {
    		return "true";
    	}
    	//修改
    	Account account = entityService.findByLicenseNo(licenseNo);
    	if (id!=null&&id!=0) {
    		if (account==null||account.getId()==id) {
    			return "true";
    		}
    	}else if(account==null){
    		return "true";
    	}
    	return "false";
    }
    
    @RequestMapping(value="/setpwd.html")
    public String setpwd(String name,Model model){
    	
    	if (StringUtils.isBlank(name)) {
    		return "account/resetpwd";
		}
    	
    	Account account = entityService.findByLicenseNoOrUserName(name);
    	if (account==null) {
			model.addAttribute("msg", "*帐号不存在！");
		}else{
			model.addAttribute("account", account);
			return "account/modpwd";
		}
    	return "account/resetpwd";
    }
    @RequestMapping(value="/modify.html")
    public String modify(String name,Model model){
    	
    	if (StringUtils.isBlank(name)) {
    		return "account/modify";
    	}
    	
    	Account account = entityService.findByLicenseNoOrUserName(name);
    	if (account==null) {
    		model.addAttribute("msg", "*帐号不存在！");
    	}else{
    		model.addAttribute("account", account);
    		return "account/modInfo";
    	}
    	return "account/modify";
    }
    
    @RequestMapping(value="/modpwd.html",method=RequestMethod.POST)
    public String modpwd(Long id,String pwd,Model model){
    	
    	if (id==null||id==0||StringUtils.isBlank(pwd)) {
    		model.addAttribute("msg", "请求参数错误！");
    		return "account/resetpwd";
    	}
    	
    	Account account = entityService.get(id);
    	if (account==null) {
    		model.addAttribute("msg", "*帐号不存在！");
    	}else{
    		account.setPassword(pwd);
    		entityService.save(account);
    		model.addAttribute("msg","密码重置成功！");
    	}
    	return "account/resetpwd";
    }
    @RequestMapping(value="/modInfo.html",method=RequestMethod.POST)
    public String modpwd(Account account,Model model){
    	
    	if (account.getId()==null||account.getId()==0) {
    		model.addAttribute("msg", "请求参数错误！");
    		return "account/modify";
    	}
    	
    	Account a = entityService.get(account.getId());
    	if (a==null) {
    		model.addAttribute("msg", "*帐号不存在！");
    	}else{
    		a.setAddress(account.getAddress());
    		a.setEmail(account.getEmail());
    		a.setName(account.getName());
    		a.setPhoneNum(account.getPhoneNum());
    		a.setLicenseNo(account.getLicenseNo());
    		a.setUpdateTime(new Date());
    		entityService.save(a);
    		model.addAttribute("msg","变更个人信息成功！");
    	}
    	return "account/resetpwd";
    }
    
    
}
