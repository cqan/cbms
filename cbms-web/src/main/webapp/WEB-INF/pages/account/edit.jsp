<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
学校客户组管理--><a href="${ctx}account/index.html">学校客户组管理</a>-->${empty entity?"添加":"修改"}学校客户组信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}学校客户组信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}account/save.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="code"  name="code" value="${entity.code}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">密码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="password" id="password" name="password"  value="${entity.password}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">确认密码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="password" id="password" name="password"  value="${entity.password}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">用户默认状态:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="active">
		                    <option value="0" ${entity.active?"selected":""}>欠费停机</option>
		                    <option value="1" ${!entity.active?"selected":""}>正常</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">姓名:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="name" name="name"  value="${entity.name}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">证件类型:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="licenseType">
		                    <option value="1" ${entity.licenseType eq 1?"selected":""}>身份证</option>
		                    <option value="2" ${entity.licenseType eq 2?"selected":""}>学生证</option>
		                    <option value="2" ${entity.licenseType eq 3?"selected":""}>军官证</option>
		                    <option value="3" ${entity.licenseType eq 4?"selected":""}>护照</option>
		                    <option value="4" ${entity.licenseType eq 5?"selected":""}>其它</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">证件编号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="licenseNo" name="licenseNo"  value="${entity.licenseNo}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">联系电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="phoneNum" name="phoneNum"  value="${entity.phoneNum}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">Email:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="email" name="email"  value="${entity.email}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">地址:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="address" name="address"  value="${entity.address}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">所在学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="schoolId">
                            <c:forEach items="${schools}" var="school">
                                <option value="${school.id}" ${entity.schoolId eq school.id?"selected":""}>${school.name}</option>
                            </c:forEach>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">客户组:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="group.id">
                            <option value="1">三四三</option>
                            <c:forEach items="${groups}" var="group">
                                <option value="${group.id}" ${entity.groupId eq group.id?"selected":""}>${group.name}</option>
                            </c:forEach>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">套餐:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="feePolicy.id">
                            <option value="1">三四三</option>
                            <c:forEach items="${feePolicys}" var="feePolicy">
                                <option value="${feePolicy.id}" ${entity.feePolicyId eq feePolicy.id?"selected":""}>${feePolicy.name}</option>
                            </c:forEach>
                       </select>
                    </td>
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
    	var $independentGroup = $("#independentGroup");
    	$independentGroup.click(function(){
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
