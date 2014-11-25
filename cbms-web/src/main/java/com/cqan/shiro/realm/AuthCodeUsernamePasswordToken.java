package com.cqan.shiro.realm;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Created by Administrator on 2014/10/19.
 */
public class AuthCodeUsernamePasswordToken extends UsernamePasswordToken {

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
