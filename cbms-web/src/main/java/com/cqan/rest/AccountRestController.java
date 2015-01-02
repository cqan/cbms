package com.cqan.rest;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cqan.account.Account;
import com.cqan.account.AccountTask;
import com.cqan.account.AuthToken;
import com.cqan.account.FeePolicy;
import com.cqan.account.RechargeHistory;
import com.cqan.http.AppResp;
import com.cqan.http.InfoCode;
import com.cqan.school.School;
import com.cqan.service.AccountService;
import com.cqan.service.AccountTaskService;
import com.cqan.service.AuthTokenService;
import com.cqan.service.CardBatchService;
import com.cqan.service.CardService;
import com.cqan.service.FeePolicyService;
import com.cqan.service.RechargeHistoryService;
import com.cqan.service.SchoolService;
import com.cqan.system.Card;
import com.cqan.system.CardBatch;
import com.google.common.collect.Maps;

@RestController
@RequestMapping("/api")
public class AccountRestController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private FeePolicyService feePolicyService;
	
	@Autowired
	private AccountTaskService accountTaskService;
	
	@Autowired
	private CardService cardService;

	@Autowired
	private CardBatchService cardBatchService;
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private RechargeHistoryService rechargeHistoryService;
	
	private static final Integer expireIn = 30*60*1000;
	
	@Autowired
	private AuthTokenService authTokenService;
	
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	/**
	 * 认证接口
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/account/auth.html",method=RequestMethod.GET)
	public String auth(HttpServletRequest request){
		String username = request.getParameter("username");
		String patepolicy = request.getParameter("patepolicy");
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
			
			FeePolicy fp = feePolicyService.findBySerialNo(patepolicy);
			if (fp==null) {
				return new AppResp(InfoCode.FEEPOLICY_IS_ERROR).toString();
			}
			if (fp.getSchool()!=null&&fp.getSchool().getId().equals(account.getSchoolId())) {
				return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
			}
			Long total = rechargeHistoryService.countCurrMonthRechargeHistory(username);
			if (total!=null&&total>=2) {
				return new AppResp(InfoCode.RECHAREGE_LIMIT).toString();
			}
			//用户套餐是否一致
			if (account.getFeePolicyId()!=null) {
				if (account.getFeePolicyId()!=fp.getId()) {
					AccountTask at = accountTaskService.findByAccountId(account.getId());
					if (at!=null) {
						return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
					}
				}
			}
		return new AppResp(InfoCode.SUCCESS).toString();
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
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
				if (!account.getFeePolicyId().equals(fp.getId())) {
					AccountTask at = accountTaskService.findByAccountId(account.getId());
					if (at!=null) {
						return new AppResp(InfoCode.FEEPOLICY_NOT_MATCH).toString();
					}
				}
			}
			Long total = rechargeHistoryService.countCurrMonthRechargeHistory(username);
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
	
	/**
	 *  取消充值
	 * @param request
	 * @return
	 */
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
	
	
	/**
	 *  用户登录接口
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/account/login.html",method=RequestMethod.POST)
	public String login(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String,Object> result = Maps.newHashMap();
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(password)) {
				return new AppResp(InfoCode.PASSWORD_IS_NULL).toString();
			}
			Account account = accountService.findByUserName(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			if (!account.getPassword().equals(password)) {
				return new AppResp(InfoCode.USERNAME_OR_PASSWROD_IS_ERROR).toString();
			}
			AuthToken at = authTokenService.findByUserName(username);
			if (at==null) {
				at = new AuthToken();
				at.setCreateTime(new Date());
				at.setUpdateTime(new Date());
				at.setUserName(username);
				at.setAuthToken(getAuthToken());
			}
			at.setExpireTime(new Date(System.currentTimeMillis()+expireIn));
			result.put("token", at.getAuthToken());
			authTokenService.save(at);
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS,result).toString();
	}
	/**
	 *  找回用户密码接口
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/account/findPwd.html",method=RequestMethod.POST)
	public String findPwd(HttpServletRequest request){
		String username = request.getParameter("username");
		String licenseNo = request.getParameter("license_no");
		Map<String,Object> result = Maps.newHashMap();
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(licenseNo)) {
				return new AppResp(InfoCode.LICENSENO_IS_NULL).toString();
			}
			Account account = accountService.findByUserName(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			if (!account.getLicenseNo().equals(licenseNo)) {
				return new AppResp(InfoCode.LICENSENO_IS_NULL).toString();
			}
			result.put("pwd",account.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS,result).toString();
	}
	
	/**
	 *  查询用户基本信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/account/info.html",method=RequestMethod.GET)
	public String info(HttpServletRequest request){
		String username = request.getParameter("username");
		String token = request.getParameter("token");
		Map<String,Object> result = Maps.newHashMap();
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(token)) {
				return new AppResp(InfoCode.TOKEN_IS_NULL).toString();
			}
			AuthToken at = authTokenService.findByUserName(username);
			if (at==null) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (!token.equals(at.getAuthToken())) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (at.getExpireTime().getTime()<=System.currentTimeMillis()) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			Account account = accountService.findByUserName(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			
			Map<String,Object> info = Maps.newHashMap();
			Map<String,Object> change = Maps.newHashMap();
			info.put("name",account.getName());
			info.put("user_name",account.getUserName());
			info.put("mobile",account.getMobile());
			info.put("license_no",account.getLicenseNo());
			info.put("license_type",account.getLicenseType());
			if (account.getGroup()!=null) {
				info.put("group_name",account.getGroup().getName());
			}
			info.put("create_time",sdf.format(account.getCreateTime()));
			Long fpId = account.getFeePolicyId();
			if (fpId!=null) {
				FeePolicy fp = feePolicyService.get(fpId);
				info.put("package",fp.getName());
			}
			info.put("phone",account.getPhoneNum());
			info.put("addr",account.getAddress());
			info.put("expire_time",sdf.format(account.getExpireTime()));
			
			AccountTask accountTask = accountTaskService.findByAccountId(account.getId());
			if (accountTask!=null) {
				Long fpid = account.getFeePolicyId();
				if (fpid!=null) {
					FeePolicy fp = feePolicyService.get(fpid);
					change.put("name",fp.getName());
					change.put("time", fp.getTime());
					info.put("change", change);
				}
			}
			result.put("user",info);
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS,result).toString();
	}
	
	/**
	 *  查询用户基本信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/account/modify.html",method=RequestMethod.POST)
	public String modify(HttpServletRequest request){
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String token = request.getParameter("token");
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(token)) {
				return new AppResp(InfoCode.TOKEN_IS_NULL).toString();
			}
			AuthToken at = authTokenService.findByUserName(username);
			if (at==null) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (!token.equals(at.getAuthToken())) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (at.getExpireTime().getTime()<=System.currentTimeMillis()) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			Account account = accountService.findByUserName(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			
			if (StringUtils.isNotBlank(email)) {
				account.setEmail(email);
			}
			if (StringUtils.isNotBlank(name)) {
				account.setName(name);
			}
			if (StringUtils.isNotBlank(addr)) {
				account.setAddress(addr);
			}
			if (StringUtils.isNotBlank(phone)) {
				account.setPhoneNum(phone);
			}
			accountService.save(account);
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS).toString();
	}
	
	/**
	 *  查询用户基本信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/card/recharge.html",method=RequestMethod.POST)
	public String cardRecharge(HttpServletRequest request){
		String username = request.getParameter("username");
		String token = request.getParameter("token");
		String cardNo = request.getParameter("card_no");
		String password = request.getParameter("card_password");
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(token)) {
				return new AppResp(InfoCode.TOKEN_IS_NULL).toString();
			}
			AuthToken at = authTokenService.findByUserName(username);
			if (at==null) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (!token.equals(at.getAuthToken())) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (at.getExpireTime().getTime()<=System.currentTimeMillis()) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			Account account = accountService.findByUserName(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			Card card = cardService.findByCardNo(cardNo);
			if (card==null||card.getEndTime().getTime()<=System.currentTimeMillis()) {
				return new AppResp(InfoCode.INVALID_CARD).toString();
			}
			if (!card.getPwd().equals(password)) {
				return new AppResp(InfoCode.CARD_ERROR).toString();
			}
			CardBatch cb = card.getCardBatch();
			if (cb!=null&&cb.getSchools()!=null) {
				boolean flag = false;
				List<School> schools = cb.getSchools();
				if (schools!=null) {
					for (School s : schools) {
						if (account.getSchoolId()!=null&&account.getSchoolId().equals(s.getId())) {
							flag = true;
						}
					}
					if (!flag) {
						return new AppResp(InfoCode.NOT_USERABLED_CARD).toString();
					}
				}
			}
			//用户之前没有充值记录
			Calendar c = Calendar.getInstance();
			if (account.getFeePolicyId()==null) {
				account.setFeePolicyId(card.getFeePolicyId());
				FeePolicy fp = feePolicyService.get(card.getFeePolicyId());
				if (fp!=null) {
					account.setStatus(0);
					c.set(Calendar.MONTH, c.get(Calendar.MONTH)+fp.getTime());
					account.setExpireTime(c.getTime());
					accountService.save(account);
					saveHistroy(account, card, fp);
					return new AppResp(InfoCode.SUCCESS).toString();
				}
			}
			//用户之前充值过
			if (account.getFeePolicyId()!=null) {
				FeePolicy fp = feePolicyService.get(card.getFeePolicyId());
				if (fp!=null) {
					if (account.getFeePolicyId().equals(card.getFeePolicyId())) {
						account.setStatus(0);
						c.set(Calendar.MONTH, c.get(Calendar.MONTH)+fp.getTime());
						account.setExpireTime(c.getTime());
						accountService.save(account);
						saveHistroy(account, card, fp);
						return new AppResp(InfoCode.SUCCESS).toString();
					}else{
						AccountTask accountTask = new AccountTask();
						accountTask.setAccountId(account.getId());
						accountTask.setCreateTime(new Date());
						accountTask.setFeePolicyId(card.getFeePolicyId());
						accountTask.setUpdateTime(new Date());
						saveHistroy(account, card, fp);
						accountTaskService.save(accountTask);
						return new AppResp(InfoCode.SUCCESS).toString();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
	}
	/**
	 *  查询用户基本信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/card/modpwd.html",method=RequestMethod.POST)
	public String modpwd(HttpServletRequest request){
		String username = request.getParameter("username");
		String token = request.getParameter("token");
		String newpassword = request.getParameter("newpassword");
		try {
			if (StringUtils.isBlank(username)) {
				return new AppResp(InfoCode.USERNAME_IS_NULL).toString();
			}
			if (StringUtils.isBlank(token)) {
				return new AppResp(InfoCode.TOKEN_IS_NULL).toString();
			}
			AuthToken at = authTokenService.findByUserName(username);
			if (at==null) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (!token.equals(at.getAuthToken())) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			if (at.getExpireTime().getTime()<=System.currentTimeMillis()) {
				return new AppResp(InfoCode.USER_LOGOUT).toString();
			}
			Account account = accountService.findByUserName(username);
			if (account==null) {
				return new AppResp(InfoCode.NOTFOUND_USER).toString();
			}
			if (StringUtils.isNotBlank(newpassword)) {
				return new AppResp(InfoCode.PASSWORD_IS_NULL).toString();
			}
			if (newpassword.length()<6) {
				return new AppResp(InfoCode.PASSWORD_IS_NULL).toString();
			}
			account.setPassword(newpassword);
			accountService.save(account);
		} catch (Exception e) {
			e.printStackTrace();
			return new AppResp(InfoCode.SERVICE_UNAVAILABLE).toString();
		}
		return new AppResp(InfoCode.SUCCESS).toString();
	}

	private void saveHistroy(Account account, Card card, FeePolicy fp) {
		RechargeHistory rh = new RechargeHistory();
		rh.setCreateTime(new Date());
		rh.setFeePolicyId(card.getFeePolicyId());
		rh.setFeePolicyName(fp.getName());
		rh.setPrice(fp.getPrice());
		rh.setTime(fp.getTime());
		rh.setUpdateTime(new Date());
		rh.setUserName(account.getUserName());
		rh.setStatus(2);
		rh.setRechargeType(1);
		rh.setDescription("卡号："+card.getCardNo());
		rechargeHistoryService.save(rh);
	}
	
	
	private static String getAuthToken(){
		return UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
	}
	
	
	
	
}
