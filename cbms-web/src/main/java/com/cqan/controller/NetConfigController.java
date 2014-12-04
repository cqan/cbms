package com.cqan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqan.net.NetConfig;
import com.cqan.school.School;
import com.cqan.service.NetConfigService;
import com.cqan.service.SchoolService;

@Controller
@RequestMapping("/net")
public class NetConfigController extends
		BaseController<NetConfig, Long, NetConfigService> {

	@Autowired
	private SchoolService schoolService;
	
	@Override
	@Autowired
	public void setEntityService(NetConfigService entityService) {
		this.entityService = entityService;
	}

	@Override
	public String page(String sortType, String sortField, int pageNumber,
			int pageSize, Model model, HttpServletRequest request) {
		return null;
	}
	
	@RequestMapping(value="/index.html")
	public String home(Model model){
		List<School> schools = schoolService.listAll();
		model.addAttribute("schools", schools);
		return getView()+"/index";
	}
	
	
	
	

}
