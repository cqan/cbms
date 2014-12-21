package com.cqan.controller;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cqan.school.AccountGroup;
import com.cqan.school.School;
import com.cqan.service.AccountGroupService;
import com.cqan.service.SchoolService;
import com.cqan.service.UserSchoolService;
import com.cqan.system.UserSchool;
import com.google.common.collect.Sets;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/accountGroup")
public class AccountGroupController extends BaseController<AccountGroup,Long,AccountGroupService>{

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private UserSchoolService userSchoolService;
	
    @Override
    @Autowired
    public void setEntityService(AccountGroupService groupService) {
        this.entityService = groupService;
    }

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(AccountGroup accountGroup,Model model,HttpServletRequest request){
    	AccountGroup ag;
    	System.out.println("school id:"+accountGroup.getSchool().getId());
    	School school = schoolService.get(accountGroup.getSchool().getId());
    	System.out.println("independent:"+accountGroup.getIndependentGroup());
    	System.out.println("kick:"+accountGroup.getKick());
    	System.out.println("school:"+school);
    	System.out.println("school name:"+school.getName());
    	if (accountGroup.getId()==null||accountGroup.getId()==0) {
    		accountGroup.setCreateTime(new Date());
    		accountGroup.setSchool(school);
    		ag = accountGroup;
			model.addAttribute("msg","添加成功！");
		}else{
			ag = entityService.get(accountGroup.getId());
			ag.setGroupCode(accountGroup.getGroupCode());
			ag.setDescription(accountGroup.getDescription());
			ag.setIndependentGroup(accountGroup.getIndependentGroup());
			ag.setName(accountGroup.getName());
			ag.setKick(accountGroup.getKick());
			ag.setNasIp(accountGroup.getNasIp());
			ag.setNasPort(accountGroup.getNasPort());
			ag.setNasPortId(accountGroup.getNasPortId());
			ag.setVlanBindTag(accountGroup.getVlanBindTag());
			ag.setVlanID1(accountGroup.getVlanID1());
			ag.setVlanID2(accountGroup.getVlanID2());
			ag.setIpBindTag(accountGroup.getIpBindTag());
			ag.setSharedBandRate(accountGroup.getSharedBandRate());
			ag.setPassAddedPin(accountGroup.getPassAddedPin());
			ag.setPcMaxSession(accountGroup.getPcMaxSession());
			ag.setMoMaxSession(accountGroup.getMoMaxSession());
			ag.setSchool(school);
			ag.setType(accountGroup.getType());
			model.addAttribute("msg","修改成功！");
		}
    	accountGroup.setUpdateTime(new Date());
    	model.addAttribute("entity", ag);
    	entityService.save(ag);
    	return this.page("", "", 1, 10, model, request);
    }
    
	@Override
	@RequestMapping("/index.html")
	 public String page(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,String sortField,
             @RequestParam(value = "page", defaultValue = "1") int pageNumber,@RequestParam
             (value = "pageSize", defaultValue = PAGESIZE) int pageSize, Model model,HttpServletRequest request) {
		Set<School> schools = Sets.newHashSet();
		List<UserSchool> userSchools = userSchoolService.findByUserId(getCurrentUser().getId());
		if (userSchools!=null) {
			for (UserSchool us : userSchools) {
				School school = schoolService.get(us.getSchoolId());
				schools.add(school);
			}
		}
        model.addAttribute("schools",schools);
		return super.page(sortType, sortField, pageNumber, pageSize, model, request);
	}

	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		Set<School> schools = Sets.newHashSet();
		List<UserSchool> userSchools = userSchoolService.findByUserId(getCurrentUser().getId());
		if (userSchools!=null) {
			for (UserSchool us : userSchools) {
				School school = schoolService.get(us.getSchoolId());
				schools.add(school);
			}
		}
        model.addAttribute("schools",schools);
        return super.edit(id, model);
	}

}
