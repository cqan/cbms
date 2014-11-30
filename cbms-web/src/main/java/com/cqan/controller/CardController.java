package com.cqan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
