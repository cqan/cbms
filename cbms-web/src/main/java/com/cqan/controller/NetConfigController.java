package com.cqan.controller;

import java.util.ArrayList;
import java.util.List;

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
    	model.addAttribute("entity", model);
    	model.addAttribute("ag", ag);
    	model.addAttribute("groupId", groupId);
    	model.addAttribute("netConfigs", netConfigs);
    	return "netConfig/edit";
    }
    
    
    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(NetConfig[] netConfigs,Model model){
    	NetConfig nc =null;
//    	if (netConfig.getId()==null||netConfig.getId()==0) {
//    		netConfig.setCreateTime(new Date());
//    		nc = netConfig;
//			model.addAttribute("msg","添加成功！");
//		}else{
//			nc = entityService.get(netConfig.getId());
//			
//			model.addAttribute("msg","修改成功！");
//		}
//    	netConfig.setUpdateTime(new Date());
    	System.out.println("hhh"+netConfigs.length);
    	model.addAttribute("entity", nc);
    	entityService.save(nc);
    	return "netConfig/edit";
    }

    
}
