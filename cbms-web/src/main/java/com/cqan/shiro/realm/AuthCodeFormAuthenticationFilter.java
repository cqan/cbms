package com.cqan.shiro.realm;

import com.cqan.shiro.exception.IncorrectAuthCodeException;
import com.cqan.util.Constant;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2014/10/19.
 */
public class AuthCodeFormAuthenticationFilter extends FormAuthenticationFilter {

    public static final Logger logger = LoggerFactory.getLogger(AuthCodeFormAuthenticationFilter.class);

    public static final String DEFAULT_CAPTCHA_PARAM = "authCode";

    private String captchaParam =DEFAULT_CAPTCHA_PARAM;

    public String getCaptchaParam() {
        return captchaParam;
    }

    protected String getCaptcha(ServletRequest request) {
        return WebUtils.getCleanParam(request, getCaptchaParam());

    }
    @Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        AuthCodeUsernamePasswordToken token = createAuthCodeUsernamePasswordToken(request,response);
        try {
            doAuthCodeValidate((HttpServletRequest) request,token);
            Subject subject = getSubject(request, response);
            subject.login(token);//正常验证
            logger.info(token.getUsername()+"，登录成功");
            return onLoginSuccess(token, subject, request, response);
        } catch (AuthenticationException e) {
            logger.debug("登录失败",e);
            return onLoginFailure(token, e, request, response);
        }
    }

    private AuthCodeUsernamePasswordToken createAuthCodeUsernamePasswordToken(ServletRequest request, ServletResponse response){
        String username = getUsername(request);
        String password = getPassword(request);
        String captcha =getCaptcha(request);
        boolean rememberMe = isRememberMe(request);
        String host = getHost(request);
        return new AuthCodeUsernamePasswordToken(username,  password.toCharArray(), rememberMe, host, captcha);
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        if(request.getAttribute(getFailureKeyAttribute()) != null) {
            return true;
        }
        return super.onAccessDenied(request, response, mappedValue);
    }

    // 验证码校验
    protected void doAuthCodeValidate(HttpServletRequest request,
                                     AuthCodeUsernamePasswordToken token) throws IncorrectAuthCodeException {
        //session中的图形码字符串
        String auhCode = (String) request.getSession().getAttribute(Constant.SESSION_AUTH_CODE);
        //比对
        if (StringUtils.isNotBlank(auhCode) && !auhCode.equalsIgnoreCase(token.getAuthCode())) {
            throw new IncorrectAuthCodeException("验证码错误！");
        }
    }
    protected void setFailureAttribute(ServletRequest request,AuthenticationException ae) {
        request.setAttribute(getFailureKeyAttribute(), ae);
    }
}
