package com.cqan.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cqan.school.FeePolicy;
import com.cqan.service.FeePolicyService;


@Controller
@RequestMapping("/feePolicy")
public class FeePolicyController extends BaseController<FeePolicy,Long,FeePolicyService>{

	@Override
	public void setEntityService(FeePolicyService entityService) {
		this.entityService = entityService;
	}
	

    @RequestMapping(value="/save.html",method=RequestMethod.POST)
    public String save(FeePolicy feePolicy,Model model){
    	FeePolicy fp;
    	if (feePolicy.getId()==null||feePolicy.getId()==0) {
    		fp = feePolicy;
		}else{
			fp = entityService.get(feePolicy.getId());
			model.addAttribute("msg","修改成功！");
		}
    	feePolicy.setUpdateTime(new Date());
    	model.addAttribute("entity", feePolicy);
    	entityService.save(fp);
    	return "feePolicy/edit";
    }

}
