package com.cqan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cqan.school.FeePolicy;
import com.cqan.school.School;
import com.cqan.service.FeePolicyService;
import com.cqan.service.SchoolService;


@Controller
@RequestMapping("/feePolicy")
public class FeePolicyController extends BaseController<FeePolicy,Long,FeePolicyService>{

	@Autowired
	private SchoolService schoolService;
	
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
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
		return super.page(sortType, sortField, pageNumber, pageSize, model, request);
	}
	
    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(FeePolicy feePolicy,Model model){
    	FeePolicy fp;
    	School school = schoolService.get(feePolicy.getSchool().getId());
    	if (feePolicy.getId()==null||feePolicy.getId()==0) {
    		feePolicy.setCreateTime(new Date());
    		feePolicy.setSchool(school);
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
    	feePolicy.setUpdateTime(new Date());
    	model.addAttribute("entity", feePolicy);
    	entityService.save(fp);
    	return "feePolicy/edit";
    }
    
	@Override
	@RequestMapping("/edit.html")
	public String edit(Long id, Model model) {
		List<School> schools = schoolService.listAll();
        model.addAttribute("schools",schools);
        return super.edit(id, model);
	}

}
