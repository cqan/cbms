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
import com.cqan.net.NetConfig;
import com.cqan.school.AccountGroup;
import com.cqan.school.School;
import com.cqan.service.AccountGroupService;
import com.cqan.service.NetConfigService;
import com.cqan.service.SchoolService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/netConfig")
public class NetConfigController extends BaseController<NetConfig,Long,NetConfigService>{
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private AccountGroupService accountGroupService;

	
    @Override
    @Autowired
    public void setEntityService(NetConfigService netConfigService) {
        this.entityService = netConfigService;
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
//	    			List<FeePolicy> fps = feePolicyService.findBySchool(school);
//	        		for (FeePolicy ag : fps) {
//	        			Map<String,Object> map = Maps.newHashMap();
//	        			map.put("feePolicyId", ag.getId());
//	        			map.put("feePolicyName", ag.getName());
//	        			data.add(map);
//	        		}
    			}
			}
    	}
    	
    	return JSON.toJSONString(data);
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(NetConfig netConfig,Model model){
    	NetConfig nc =null;
    	if (netConfig.getId()==null||netConfig.getId()==0) {
    		netConfig.setCreateTime(new Date());
    		nc = netConfig;
			model.addAttribute("msg","添加成功！");
		}else{
			nc = entityService.get(netConfig.getId());
			
			model.addAttribute("msg","修改成功！");
		}
    	netConfig.setUpdateTime(new Date());
    	model.addAttribute("entity", nc);
    	entityService.save(nc);
    	return "netConfig/edit";
    }
    


    
}
