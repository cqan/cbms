package com.cqan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqan.service.CardBatchService;
import com.cqan.service.CardService;
import com.cqan.system.Card;
import com.cqan.system.CardBatch;

@Controller
@RequestMapping("/card/batch")
public class CardBatchController extends BaseController<CardBatch, Long, CardBatchService>{
	
	@Autowired
	private CardService cardService;

	@Override
	@Autowired
	public void setEntityService(CardBatchService entityService) {
		this.entityService = entityService;
	}
	
	@RequestMapping(value="/save.html",method=RequestMethod.POST)
	public String save(CardBatch cardBatch,Model model,HttpServletRequest request){
		cardBatch.setCreateTime(new Date());
		entityService.save(cardBatch);
		model.addAttribute("msg","添加制卡成功！");
		return page("", "", 1, 10, model, request);
	}
	
    @RequestMapping(value="/edit1.html",method=RequestMethod.GET)
    public String UpdateTime(Long id,Model model){
        System.out.println(id);
       if (id!=null){
           Object entity  = entityService.get(id);
           model.addAttribute("entity",entity);
       }
       return "cardBatch/edit1";
   }
    
	@RequestMapping(value="/save1.html",method=RequestMethod.POST)
	public String saveUpdateTime(CardBatch cardBatch,Model model,HttpServletRequest request){
		CardBatch c = cardBatch;
		System.out.println("cardBatch id"+cardBatch.getId());
		if(null != cardBatch.getId()){
		    c = entityService.get(cardBatch.getId());
			c.setUpdateTime(new Date());
			c.setEndTime(cardBatch.getEndTime());
			System.out.println("end Time:"+cardBatch.getEndTime());
			System.out.println("c:"+c);
			entityService.save(c);
			List<Card> cs  = cardService.listByCardBatchId(cardBatch.getId());
			for (int i = 0; i < cs.size(); i++) {
				Card cd = cs.get(i);
				cd.setEndTime(cardBatch.getEndTime());
				cd.setUpdateTime(new Date());
				cardService.save(cd);
			}
		}
		System.out.println(c.getEndTime());
		model.addAttribute("entity",c);
		model.addAttribute("msg","添加制卡成功！");
		return page("", "", 1, 10, model, request);
	}
	
	@ResponseBody
	@RequestMapping(value="/operate.html",method=RequestMethod.POST)
	public Object reset(HttpServletRequest request){
		String cbId = request.getParameter("id");
		if (StringUtils.isNotBlank(cbId)) {
			CardBatch cardBatch = entityService.get(Long.parseLong(cbId));
			cardBatch.setStatus(0);
			entityService.save(cardBatch);
			return "操作成功！";
		}
		return "操作失败";
	}

}
