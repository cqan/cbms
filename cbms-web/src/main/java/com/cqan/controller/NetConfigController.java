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

import com.cqan.net.NetConfig;
import com.cqan.school.AccountGroup;
import com.cqan.service.AccountGroupService;
import com.cqan.service.NetConfigService;
import com.cqan.service.SchoolService;
import com.google.common.base.Splitter;

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
    
    @RequestMapping(value="/step1.html",method=RequestMethod.GET)
    public String step1(Model model){
    	return "netConfig/step1";
    }
    
    @Override
    @RequestMapping(value="/edit.html")
    public String edit(Long groupId,Model model){
    	AccountGroup ag  = accountGroupService.get(groupId);
    	List<NetConfig> netConfigs = new ArrayList<NetConfig>();
    	netConfigs = entityService.findByGroupId(groupId);
    	model.addAttribute("msg","修改成功！");
    	model.addAttribute("ag", ag);
    	model.addAttribute("groupId", groupId);
    	model.addAttribute("netConfigs", netConfigs);
    	return "netConfig/edit";
    }
    
    
    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(long groupId,String startWork,String endWork,String startTime,String endTime,Model model){
    	entityService.delByGroupId(groupId);
    	if (!StringUtils.isBlank(startWork)&&!StringUtils.isBlank(endWork)&&!StringUtils.isBlank(startTime)&&!StringUtils.isBlank(endTime)){
	    	List<String> sws = Splitter.on(",").trimResults().splitToList(startWork);
	    	List<String> ews = Splitter.on(",").trimResults().splitToList(endWork);
	    	List<String> sts = Splitter.on(",").trimResults().splitToList(startTime);
	    	List<String> ets = Splitter.on(",").trimResults().splitToList(endTime);
	    	for(int i = 0;i<sws.size();i++){
	    		NetConfig nc = new NetConfig();
	    		nc.setAgid(groupId);
	    		nc.setCreateTime(new Date());
	    		nc.setUpdateTime(new Date());
	    		nc.setStartTime(sts.get(i));
	    		nc.setEndTime(ets.get(i));
	    		nc.setStartWork(sws.get(i));
	    		nc.setEndWork(ews.get(i));
	    		entityService.save(nc);
	    	}
    	}
    	List<NetConfig> netConfigs = new ArrayList<NetConfig>();
    	netConfigs = entityService.findByGroupId(groupId);
    	AccountGroup ag  = accountGroupService.get(groupId);
    	model.addAttribute("netConfigs", netConfigs);
    	model.addAttribute("ag", ag);
    	return "netConfig/edit";
    }

    
}
