package com.cqan.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.cqan.account.FeePolicy;
import com.cqan.service.CardBatchService;
import com.cqan.service.CardService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.SchoolService;
import com.cqan.service.UserSchoolService;
import com.cqan.system.Card;
import com.cqan.system.CardBatch;
import com.cqan.system.UserSchool;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

@Controller
@RequestMapping("/card/batch")
public class CardBatchController extends BaseController<CardBatch, Long, CardBatchService>{
	
	@Autowired
	private CardService cardService;

	@Autowired
	private FeePolicyService feePolicyService;
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private UserSchoolService userSchoolService;
	
	
	
	@Override
	@Autowired
	public void setEntityService(CardBatchService entityService) {
		this.entityService = entityService;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/feePolicys.html")
	public String feePolicys(Model model) {
		List<UserSchool> userSchools = userSchoolService.findByUserId(getCurrentUser().getId());
		List<FeePolicy> feePolicys = null;
		if (userSchools==null||!userSchools.isEmpty()) {
			for (UserSchool us : userSchools) {
				feePolicys = feePolicyService.findBySchool(schoolService.get(us.getSchoolId()));
			}
		}
		if (feePolicys==null) {
			feePolicys = Lists.newArrayList();
		}
		List<FeePolicy> data = feePolicyService.findBySchoolIsNull();
		if (data!=null) {
			feePolicys.addAll(data);
		}
    	List<Map<String,Object>> json = Lists.newArrayList();
    	for (FeePolicy fp : feePolicys) {
    		Map<String,Object> map = Maps.newHashMap();
			map.put("feePolicyId", fp.getId());
			map.put("feePolicyName", fp.getName());
			json.add(map);
		}
		return JSON.toJSONString(json);
	}
	
	
	@RequestMapping(value="/download.html")
	public String download(Long id,HttpServletResponse response) {
		if (id==null||id==0) {
			return null;
		}
		BufferedInputStream in = null;  
        BufferedOutputStream out = null;
		response.setContentType("application/octet-stream");  
         response.setCharacterEncoding("UTF-8");  
         CardBatch cb = entityService.get(id);
         if (cb==null) {
			return null;
		 }
         String fileName = cb.getName()+".txt";
         List<Card> cards = cardService.findByCardBatch(cb);
         File file = null;
         try {
		     response.setHeader("Content-Disposition", "attachment; filename="+new String(fileName.getBytes("utf-8"),"ISO8859-1")); 
		     file = new File("./"+fileName);
		     if (!file.exists()) {
				file.createNewFile();
			 }
		     for (Card card : cards) {
				FileUtils.write(file, card.getCardNo()+"\t"+card.getPwd()+"\r\n", true);
			 }
	    	 response.setHeader("Content-Length",String.valueOf(file.length()));  
			 in = new BufferedInputStream(new FileInputStream(file));
		     out = new BufferedOutputStream(response.getOutputStream());  
		     byte[] data = new byte[1024];  
		     int len = 0;  
		     while (-1 != (len=in.read(data, 0, data.length))) {  
		         out.write(data, 0, len);  
	         }  
		     } catch (Exception e) {
		    	 e.printStackTrace();
		     }finally{
		    	 try {
		    		 if (in != null) {  
						in.close();
		            }  
		            if (out != null) {  
		                out.close();  
		            }  
		            if (file.exists()) {
						file.delete();
					}
		    	 } catch (IOException e) {
						e.printStackTrace();
					}
		     }  
		return null;
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
