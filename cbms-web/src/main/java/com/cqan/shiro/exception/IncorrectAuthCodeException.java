package com.cqan.shiro.exception;

import org.apache.shiro.authc.AuthenticationException;

/**
 * Created by Administrator on 2014/10/19.
 */
public class IncorrectAuthCodeException extends AuthenticationException {

    public IncorrectAuthCodeException(String msg){
        super(msg);
    }
}
