package com.cqan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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

	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
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
    public String save(Model model,HttpServletRequest request) throws Exception{
    	FeePolicy feePolicy = null;
    	School school =null;
    	String strId = request.getParameter("id");
    	if (StringUtils.isNotBlank(strId)) {
			Long id = Long.parseLong(strId);
			feePolicy = entityService.get(id);
		}
    	if (feePolicy==null) {
    		feePolicy = new FeePolicy();
    		feePolicy.setCreateTime(new Date());
    		request.setAttribute("msg","添加成功！");
    	}else{
    		request.setAttribute("msg","修改成功！");
    	}
    	String sid = request.getParameter("schoolId");
    	if(StringUtils.isNotBlank(sid)&&!sid.equals("全部")){
    		school = schoolService.get(Long.parseLong(sid));
    		feePolicy.setSchool(school);
    	}else{
    		feePolicy.setSchool(null);
    	}
    	feePolicy.setCreator(getCurrentUserName());
    	feePolicy.setCreatorId(getCurrentUser().getId());
    	String area = request.getParameter("area");
    	if (StringUtils.isNotBlank(area)) {
    		feePolicy.setArea(area);
		}
    	System.out.println(request.getParameter("area"));
    	feePolicy.setDescription(request.getParameter("description"));
    	String dc = request.getParameter("downControl");
    	if (StringUtils.isNotBlank(dc)) {
    		feePolicy.setDownControl(Integer.parseInt(dc));
    	}
    	String uc = request.getParameter("upControl");
    	if (StringUtils.isNotBlank(uc)) {
    		feePolicy.setUpControl(Integer.parseInt(uc));
    	}
    	String at = request.getParameter("startTime");
    	if (StringUtils.isNotBlank(at)) {
    		feePolicy.setStartTime(sdf.parse(at));
		}
    	String et = request.getParameter("endTime");
    	if (StringUtils.isNotBlank(et)) {
    		feePolicy.setEndTime(sdf.parse(et));
    	}
    	feePolicy.setName(request.getParameter("name"));
    	String p = request.getParameter("price");
    	if (StringUtils.isNotBlank(p)) {
    		feePolicy.setPrice(Float.parseFloat(p));
		}
    	String s = request.getParameter("strategyType");
    	if (StringUtils.isNotBlank(s)) {
    		feePolicy.setStrategyType(Integer.parseInt(s));
    	}
    	String sv = request.getParameter("stuVisible");
    	if (StringUtils.isNotBlank(sv)) {
    		feePolicy.setStuVisible(Integer.parseInt(sv));
    	}
    	String time = request.getParameter("time");
    	if (StringUtils.isNotBlank(time)) {
    		feePolicy.setTime(Integer.parseInt(time));
    	}
    	entityService.save(feePolicy);
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
