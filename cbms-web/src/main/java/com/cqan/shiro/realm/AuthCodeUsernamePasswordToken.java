package com.cqan.shiro.realm;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Created by wuhui on 2014/10/19.
 */
public class AuthCodeUsernamePasswordToken extends UsernamePasswordToken {

    /**
	 * 
	 */
	private static final long serialVersionUID = -3033139739154383753L;
	private String authCode;

    public AuthCodeUsernamePasswordToken(String username, char[] password,
                                         boolean rememberMe, String host,String authCode) {
        super(username, password, rememberMe, host);
        this.authCode = authCode;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }
}
