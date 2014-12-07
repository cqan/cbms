package com.cqan.controller;

import java.util.Calendar;
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
import com.cqan.account.AccountTask;
import com.cqan.account.FeePolicy;
import com.cqan.school.AccountGroup;
import com.cqan.school.School;
import com.cqan.service.AccountGroupService;
import com.cqan.service.AccountService;
import com.cqan.service.AccountTaskService;
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
	
	@Autowired
	private AccountTaskService accountTaskService;
	
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
    	if (account.getId()==null||account.getId()==0) {
    		a = account;
    		a.setCreateTime(new Date());
    		a.setUserName(account.getUserName());
			a.setAddress(account.getAddress());
			a.setEmail(account.getEmail());
			a.setFeePolicyId(account.getFeePolicyId());
			AccountGroup ag = accountGroupService.get(account.getGroup().getId());
			a.setGroup(ag);
			a.setLicenseNo(account.getLicenseNo());
			a.setLicenseType(account.getLicenseType());
			a.setName(account.getName());
			a.setPassword(account.getPassword());
			a.setPhoneNum(account.getPhoneNum());
			a.setSchoolId(account.getSchoolId());
		}else{
			a = entityService.get(account.getId());
		}
    	a.setUpdateTime(new Date());
    	a.setStatus(0);
    	School school = schoolService.get(account.getSchoolId());
    	FeePolicy fp = feePolicyService.get(account.getFeePolicyId());
    	a.setCreater(getCurrentUserName());
    	account.setUpdateTime(new Date());
    	model.addAttribute("entity", a);
    	model.addAttribute("school",school);
    	Calendar c = Calendar.getInstance();
    	c.add(Calendar.MONTH, c.get(Calendar.MONTH)+fp.getTime());
    	model.addAttribute("endTime",c.getTime());
    	model.addAttribute("feePolicy",fp);
    	entityService.save(a);
    	return "account/accountInfo";
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
    
    @RequestMapping(value="/active.html")
    public String active(String name,Model model){
    	
    	if (StringUtils.isBlank(name)) {
    		return "account/active";
    	}
    	
    	Account account = entityService.findByLicenseNoOrUserName(name);
    	if (account==null) {
    		model.addAttribute("msg", "*帐号不存在！");
    	}else{
    		model.addAttribute("account", account);
    		FeePolicy feePolicy = feePolicyService.get(account.getFeePolicyId());
    		model.addAttribute("feePolicy", feePolicy);
    		return "account/activeAccount";
    	}
    	return "account/active";
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
    @RequestMapping(value="/activeAccount.html",method=RequestMethod.POST)
    public String activeAccount(Long id,Model model){
    	if (id==null||id==0) {
    		model.addAttribute("msg","请求参数错误！");
    		return "account/active";
		}
    	Account account = entityService.get(id);
    	if (account==null) {
    		model.addAttribute("msg","帐号不存在！");
    		return "account/active";
		}
    	saveTask(account, account.getFeePolicyId());
    	model.addAttribute("msg","激活成功！");
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
    
    @RequestMapping("/change.html")
    public String change(String name,Model model){
    	if (StringUtils.isBlank(name)) {
    		return "account/change";
    	}
    	
    	Account account = entityService.findByLicenseNoOrUserName(name);
    	if (account==null) {
    		model.addAttribute("msg", "*帐号不存在！");
    	}else{
    		model.addAttribute("account", account);
    		return "account/changeFee";
    	}
    	return "account/change";
    }
    @RequestMapping(value="/changeFee.html",method=RequestMethod.POST)
    public String changeFee(Long id,Long feePolicyId,Model model){
    	if (id==null||id==0||feePolicyId==null||feePolicyId==0) {
    		model.addAttribute("msg", "请求参数错误！");
    		return "account/change";
    	}
    	Account a = entityService.get(id);
    	FeePolicy feePolicy = feePolicyService.get(feePolicyId);
    	if (a==null||feePolicy==null) {
    		model.addAttribute("msg", "*帐号或套餐不存在！");
    	}else{
    		a.setUpdateTime(new Date());
    		entityService.save(a);
    		saveTask(a, feePolicy.getId());
    		model.addAttribute("msg","变更个人信息成功！");
    	}
    	return "account/change";
    }
    
    private void saveTask(Account account,Long feePolicyId){
    	AccountTask at = new AccountTask();
    	at.setAccountId(account.getId());
    	at.setCreateTime(new Date());
    	at.setFeePolicyId(account.getFeePolicyId());
    	accountTaskService.save(at);
    }
    
    
}
