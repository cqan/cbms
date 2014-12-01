<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<div style="margin:5px 0;"></div>
系统管理--><a href="${ctx}school/index.html">学校管理</a>-->${empty entity?"添加":"修改"}学校信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}用户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}school/save.html" method="post">
        <input name="id" id="uid" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">名称:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="name"  name="name" value="${entity.name}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">学校编码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" name="code"  value="${entity.code}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">上网方式:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="netType">
                        <option value="1" ${entity.netType eq 1?"selected":""}>虚拟ADSL</option>
                        <option value="2"  ${entity.netType eq 2?"selected":""}>PPPOE</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">分层类型:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="rateType">
                        <option value="1" ${entity.rateType eq 1?"selected":""}>计时</option>
                        <option value="2"  ${entity.rateType eq 2?"selected":""}>包月</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">学校分层比例:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="rate"  name="rate" value="${entity.rate}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">所属地区:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="city">
                        <option value="1" ${entity.city eq 1?"selected":""}>北京</option>
                        <option value="2"  ${entity.city eq 2?"selected":""}>北京</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">区局:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="district">
                        <option value="1" ${entity.district eq 1?"selected":""}>昌平</option>
                        <option value="2"  ${entity.district eq 2?"selected":""}>昌平</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">调拨分局:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="subDistrict">
                        <option value="1" ${entity.subDistrict eq 1?"selected":""}>昌平</option>
                        <option value="2"  ${entity.subDistrict eq 2?"selected":""}>昌平</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">激活账号数:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="activeNum"  name="activeNum" value="${entity.activeNum}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">虚拟学校标志:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="virtualFlag">
                        <option value="1" ${entity.virtualFlag eq 1?"selected":""}>否</option>
                        <option value="2"  ${entity.virtualFlag eq 2?"selected":""}>是</option>
                       </select>
                    </td>
                </tr>
               <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">可信标示:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<input type="checkbox" id="trusted"  name="trusted"  ${entity.trusted eq 1?"checked":""} value="${entity.trusted eq null?2:entity.trusted}" /></td>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">网络负责人:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="netLeader"  name="netLeader" value="${entity.netLeader}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">网络负责人电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="netLeaderPhone"  name="netLeaderPhone" value="${entity.netLeaderPhone}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">维护人员:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="maintenance"  name="maintenance" value="${entity.maintenance}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">维护人员电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="mPhone"  name="mPhone" value="${entity.mPhone}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">客户经理:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="customerManager"  name="customerManager" value="${entity.customerManager}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">客户经理电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="cmPhone"  name="cmPhone" value="${entity.cmPhone}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">服务器IP:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="serverIp"  name="serverIp" value="${entity.serverIp}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">服务器端口:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="serverPort"  name="serverPort" value="${entity.serverPort}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">地址:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="addr"  name="addr" value="${entity.addr}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">描述:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="description"  name="description" value="${entity.description}" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">&nbsp;&nbsp;&nbsp;
				            <input type="reset" class="button" value="取消">
				        </div>
                    </td>
                </tr>
            </table>
        </form>
        
    </div>
</div>
</body>
<script lang="text/javascript">   
    $(function(){
    	var msg = "${msg}";
    	var $trusted = $("#trusted");
    	$trusted.click(function(){
	    	if($(this).attr("checked")=="checked"){
	    	   $(this).val(1);
	    	}else{
	    	   $(this).val(2);
	    	}
    	});
    	if(msg!=''){
    		show("",msg);
    	}
    	
    });
	
</script>
</html>
