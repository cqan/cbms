package com.cqan.http;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

/**
 * Created by huiwu on 2014/9/20.
 */
public class InfoCode implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -4181865758935309876L;
	private int code;
    private String msg;

    private InfoCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public static final InfoCode SUCCESS = new InfoCode(0, "成功");

    /**
     * *系统级错误开始***
     */
    public static final InfoCode SERVICE_UNAVAILABLE = new InfoCode(10000, "系统错误");

    public static final InfoCode UNAUTHORIZED = new InfoCode(20000, "用户没有取得授权或授权已过期");

    /****系统级错误结束****/

    /****参数错误开始****/
    public static final InfoCode USERNAME_IS_NULL = new InfoCode(40000, "用户名为空");
    public static final InfoCode NOTFOUND_USER = new InfoCode(40001, "用户不存在");
    public static final InfoCode STREAMNUMBER_IS_NULL = new InfoCode(40002, "流水号不能为空");
    public static final InfoCode FEEPOLICY_IS_NULL = new InfoCode(40003, "套餐编号不能为空");
    public static final InfoCode LICENSENO_IS_NULL = new InfoCode(40004, "请输入开户时的证件号");
    public static final InfoCode FEEPOLICY_IS_ERROR = new InfoCode(40005, "套餐不存在");
    public static final InfoCode FEEPOLICY_NOT_MATCH = new InfoCode(40006, "套餐不与用户匹配");
    public static final InfoCode RECHAREGE_LIMIT = new InfoCode(40007, "本月充值超过2次，请下月再充值！");
    public static final InfoCode PASSWORD_IS_NULL = new InfoCode(40008, "无效的密码");
    public static final InfoCode TOKEN_IS_NULL = new InfoCode(40009, "请输入授权码");
    public static final InfoCode USER_LOGOUT = new InfoCode(40010, "用户没有登录或登录已过期");
    public static final InfoCode USERNAME_OR_PASSWROD_IS_ERROR = new InfoCode(40011, "用户或密码不正确！");
    public static final InfoCode INVALID_CARD = new InfoCode(40012, "卡号不存在或卡号已过期！");
    public static final InfoCode CARD_ERROR = new InfoCode(40012, "卡号或密码不正确！");
    
    public static final InfoCode NOT_USERABLED_CARD = new InfoCode(40013, "用户不能使用此卡！");

    /****参数错误结束****/

    /****业务错误开始****/

    /****业务错误结束****/

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
    }
}
