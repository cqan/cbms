package com.cqan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqan.account.RechargeHistory;
import com.cqan.service.RechargeHistoryService;

@Controller
@RequestMapping("/rechargeHistory")
public class RechargeHistoryController extends
		BaseController<RechargeHistory, Long, RechargeHistoryService> {

	@Override
	@Autowired
	public void setEntityService(RechargeHistoryService entityService) {
		this.entityService = entityService;
	}

}
