package com.cqan.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqan.service.CardBatchService;
import com.cqan.system.CardBatch;

@Controller
@RequestMapping("/card/batch")
public class CardBatchController extends BaseController<CardBatch, Long, CardBatchService>{

	@Override
	@Autowired
	public void setEntityService(CardBatchService entityService) {
		this.entityService = entityService;
	}
	
	@RequestMapping(value="/save.html",method=RequestMethod.POST)
	public String save(CardBatch cardBatch,Model model){
		cardBatch.setCreateTime(new Date());
		entityService.save(cardBatch);
		model.addAttribute("msg","添加制卡成功！");
		return "cardBatch/edit";
	}
	
    @RequestMapping(value="/edit1.html",method=RequestMethod.GET)
    public String UpdateTime(Long id,Model model){
       if (id!=null){
           Object entity  = entityService.get(id);
           model.addAttribute("entity",entity);
       }
       return "cardBatch/edit1";
   }
    
	@RequestMapping(value="/save1.html",method=RequestMethod.POST)
	public String saveUpdateTime(CardBatch cardBatch,Model model){
		CardBatch c = cardBatch;
		if(null != cardBatch.getId()){
		    c = entityService.get(cardBatch.getId());
			c.setUpdateTime(new Date());
			c.setEndTime(cardBatch.getEndTime());
			entityService.save(c);
		}
		model.addAttribute("entity",c);
		model.addAttribute("msg","添加制卡成功！");
		return "cardBatch/edit1";
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
