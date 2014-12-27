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
    public static final InfoCode FEEPOLICY_IS_ERROR = new InfoCode(40004, "套餐不存在");
    public static final InfoCode FEEPOLICY_NOT_MATCH = new InfoCode(40005, "套餐不与用户匹配");
    public static final InfoCode RECHAREGE_LIMIT = new InfoCode(40006, "本月充值超过2次，请下月再充值！");

    /****参数错误结束****/

    /****业务错误开始****/

    /****业务错误结束****/

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
    }
}
