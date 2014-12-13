package com.cqan.controller;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cqan.account.FeePolicy;
import com.cqan.school.School;
import com.cqan.service.FeePolicyService;
import com.cqan.service.SchoolService;
import com.cqan.service.UserSchoolService;
import com.cqan.system.UserSchool;
import com.google.common.collect.Sets;


@Controller
@RequestMapping("/feePolicy")
public class FeePolicyController extends BaseController<FeePolicy,Long,FeePolicyService>{

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private UserSchoolService userSchoolService;
	
	@Override
	@Autowired
	public void setEntityService(FeePolicyService entityService) {
		this.entityService = entityService;
	}
	
	@Override
	@RequestMapping("/index.html")
	 public String page(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,String sortField,
             @RequestParam(value = "page", defaultValue = "1") int pageNumber,@RequestParam
             (value = "pageSize", defaultValue = PAGESIZE) int pageSize, Model model,HttpServletRequest request) {
		Set<School> schools = Sets.newHashSet();
		List<UserSchool> userSchools = userSchoolService.findByUserId(getCurrentUser().getId());
		for (UserSchool us : userSchools) {
			School school = schoolService.get(us.getSchoolId());
			schools.add(school);
		}
        model.addAttribute("schools",schools);
		return super.page(sortType, sortField, pageNumber, pageSize, model, request);
	}
	
    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(FeePolicy feePolicy,Model model,HttpServletRequest request){
    	FeePolicy fp;
    	School school =null;
    	if(null != feePolicy.getSchool() && null !=feePolicy.getSchool().getId()){
    		school = schoolService.get(feePolicy.getSchool().getId());
    	}
    	feePolicy.setCreator(getCurrentUserName());
    	feePolicy.setCreatorId(1);
    	if (feePolicy.getId()==null||feePolicy.getId()==0) {
    		feePolicy.setCreateTime(new Date());
    		feePolicy.setSchool(school);
    		model.addAttribute("msg","添加成功！");
    		fp = feePolicy;
		}else{
			fp = entityService.get(feePolicy.getId());
			fp.setArea(feePolicy.getArea());
			fp.setDescription(feePolicy.getDescription());
			fp.setDownControl(feePolicy.getDownControl());
			fp.setEndTime(feePolicy.getEndTime());
			fp.setName(feePolicy.getName());
			fp.setPrice(feePolicy.getPrice());
			fp.setSchool(school);
			fp.setStartTime(feePolicy.getStartTime());
			fp.setStrategyType(feePolicy.getStrategyType());
			fp.setStuVisible(feePolicy.getStuVisible());
			fp.setTime(feePolicy.getTime());
			fp.setUpControl(feePolicy.getUpControl());
			model.addAttribute("msg","修改成功！");
		}
//    	feePolicy.setUpdateTime(new Date());
//    	model.addAttribute("entity", feePolicy);
//		List<School> schools = schoolService.listAll();
//        model.addAttribute("schools",schools);
    	entityService.save(fp);
    	return page("", "", 1, 10, model, request);
    }
    
	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
        return super.edit(id, model);
	}

}
