package com.cqan.controller;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqan.service.CardService;
import com.cqan.system.Card;

@Controller
@RequestMapping("/card")
public class CardController extends BaseController<Card, Long, CardService> {

	@Override
	@Autowired
	public void setEntityService(CardService entityService) {
		this.entityService = entityService;
	}

	@ResponseBody
	@RequestMapping(value = "/disable.html", method = RequestMethod.POST)
	public String disable(Long id) {
		if (id == null || id == 0) {
			return "请求参数错误！";
		}
		Card card = entityService.get(id);
		if (card == null) {
			return "卡号不存在！";
		}
		if (card.getStatus() == 4) {
			card.setStatus(1);
			entityService.save(card);
			return "卡号启用成功！";
		} else {
			card.setStatus(4);
			entityService.save(card);
			return "卡号冻结成功！";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/resetPwd.html", method = RequestMethod.POST)
	public String resetPwd(Long id){
		if (id == null || id == 0) {
			return "请求参数错误！";
		}
		Card card = entityService.get(id);
		if (card == null) {
			return "卡号不存在！";
		}
		String pwd  = RandomStringUtils.random(8, false, true);
		card.setPwd(pwd);
		entityService.save(card);
		return "密码重置成功！";
	}
	
}
