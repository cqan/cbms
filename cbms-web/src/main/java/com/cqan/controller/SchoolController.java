package com.cqan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSON;
import com.cqan.school.School;
import com.cqan.service.SchoolService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/school")
public class SchoolController extends BaseController<School,Long,SchoolService>{

    @Override
    @Autowired
    public void setEntityService(SchoolService schoolService) {
        this.entityService = schoolService;
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(School school,Model model,HttpServletRequest request){
    	School s;
    	if (school.getId()==null||school.getId()==0) {
    		school.setCreateTime(new Date());
    		s = school;
			model.addAttribute("msg","添加成功！");
		}else{
		    s = entityService.get(school.getId());
			s.setActiveNum(school.getActiveNum());
			s.setAddr(school.getAddr());
			s.setCity(school.getCity());
			s.setCmPhone(school.getCmPhone());
			s.setSchoolCode(school.getSchoolCode());
			s.setCustomerManager(school.getCustomerManager());
			s.setDescription(school.getDescription());
			s.setDistrict(school.getDistrict());
			s.setMaintenance(school.getMaintenance());
			s.setmPhone(school.getmPhone());
			s.setName(school.getName());
			s.setNetLeader(school.getNetLeader());
			s.setNetLeaderPhone(school.getNetLeaderPhone());
			s.setNetType(school.getNetType());
			s.setRate(school.getRate());
			s.setRateType(school.getRateType());
			s.setServerIp(school.getServerIp());
			s.setServerPort(school.getServerPort());
			s.setSubDistrict(school.getSubDistrict());
			s.setTrusted(school.getTrusted());
			s.setVirtualFlag(school.getVirtualFlag());
			model.addAttribute("msg","修改成功！");
		}
    	school.setUpdateTime(new Date());
    	model.addAttribute("entity", s);
    	entityService.save(s);
    	return page("", "", 1, 10, model, request);
    }
    
    @RequestMapping(value="/listAll.html",method=RequestMethod.POST)
    public String listAll(Model model){
    	List<School> schools = entityService.listAll();
    	model.addAttribute("entity",schools);
    	return null;
    }
    
    @RequestMapping(value="/listById.html",method=RequestMethod.GET)
    public String findById(long id ,Model model){
    	List<School> schools = entityService.listAll();
    	model.addAttribute("entity",schools);
    	return null;
    }
    
    @ResponseBody
    @RequestMapping(value="/select.html")
    public String select(String areaId){
    	List<Map<String,Object>> data = Lists.newArrayList();
        List<School> schools = new ArrayList<School>();
        Map<String,Object> map = Maps.newHashMap();
		map.put("schoolId", "");
		map.put("schoolName","全部");
		data.add(map);
	    schools = entityService.listByAreaId(areaId);
		for (School school : schools) {
			map = Maps.newHashMap();
    		map.put("schoolId", school.getId());
    		map.put("schoolName", school.getName());
    		data.add(map);
		}
    	return JSON.toJSONString(data);
    }

}
