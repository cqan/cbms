package com.cqan.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cqan.account.Account;
import com.cqan.account.FeePolicy;
import com.cqan.account.RechargeHistory;
import com.cqan.http.AppResp;
import com.cqan.http.InfoCode;
import com.cqan.service.AccountService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.RechargeHistoryService;

@RestController
@RequestMapping("/api")
public class AccountRestController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private FeePolicyService feePolicyService;
	
	@Autowired
	private RechargeHistoryService rechargeHistoryService;
	
	@RequestMapping(value="/account/auth.html")
	public String auth(HttpServletRequest request){
		String username = request.getParameter("username");
		String patepolicy = request.getParameter("patepolicy");
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(patepolicy)) {
				return new AppResp(InfoCode.FEEPOLICY_IS_NULL).toString();
			}
			Account account = accountService.findByMobile(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			
			FeePolicy fp = feePolicyService.get(Long.parseLong(patepolicy));
			if (fp==null) {
				return new AppResp(InfoCode.FEEPOLICY_IS_ERROR).toString();
			}
			if (fp.getSchool()!=null&&fp.getSchool().getId()!=account.getSchoolId()) {
				return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
			}
			//用户套餐是否一致
			if (account.getFeePolicyId()!=null) {
				if (account.getFeePolicyId()!=fp.getId()) {
					return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
				}
			}
			Long total = rechargeHistoryService.countCurrMonthRechargeHistory();
			if (total!=null&&total>=2) {
				return new AppResp(InfoCode.RECHAREGE_LIMIT).toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS).toString();
	}
	
	
	@RequestMapping(value="/account/recharge.html",method=RequestMethod.POST)
	public String recharge(HttpServletRequest request){
		String username = request.getParameter("username");
		String patepolicy = request.getParameter("patepolicy");
		String streamNumber = request.getParameter("streamNumber");
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(streamNumber)) {
				return new AppResp(InfoCode.STREAMNUMBER_IS_NULL).toString();
			}
			if (StringUtils.isBlank(patepolicy)) {
				return new AppResp(InfoCode.FEEPOLICY_IS_NULL).toString();
			}
			Account account = accountService.findByMobile(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			
			FeePolicy fp = feePolicyService.get(Long.parseLong(patepolicy));
			if (fp==null) {
				return new AppResp(InfoCode.FEEPOLICY_IS_ERROR).toString();
			}
			if (fp.getSchool()!=null&&fp.getSchool().getId()!=account.getSchoolId()) {
				return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
			}
			//用户套餐是否一致
			if (account.getFeePolicyId()!=null) {
				if (account.getFeePolicyId()!=fp.getId()) {
					return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
				}
			}
			Long total = rechargeHistoryService.countCurrMonthRechargeHistory();
			if (total!=null&&total>=2) {
				return new AppResp(InfoCode.RECHAREGE_LIMIT).toString();
			}
			rechargeHistoryService.saveHistory(username,fp.getId(),streamNumber, "短信充值："+streamNumber,2, 1);
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS).toString();
	}
	
	
	@RequestMapping(value="/account/cancelRecharge.html",method=RequestMethod.POST)
	public String cancelRecharge(HttpServletRequest request){
		String username = request.getParameter("username");
		String streamNumber = request.getParameter("streamNumber");
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			Account account = accountService.findByMobile(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			List<RechargeHistory> rhs = rechargeHistoryService.findByStreamNumber(username,streamNumber);
			if (rhs!=null) {
				for (RechargeHistory rh : rhs) {
					rh.setStatus(3);
					rechargeHistoryService.save(rh);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS).toString();
	}
	
	
	
}
