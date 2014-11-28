package com.cqan.shiro.exception;

import org.apache.shiro.authc.AuthenticationException;

/**
 * Created by wuhui on 2014/10/19.
 */
public class IncorrectAuthCodeException extends AuthenticationException {

    /**
	 * 
	 */
	private static final long serialVersionUID = 4048984203811080556L;

	public IncorrectAuthCodeException(String msg){
        super(msg);
    }
}
