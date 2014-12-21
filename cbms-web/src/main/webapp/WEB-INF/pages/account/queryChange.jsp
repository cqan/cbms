<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
系统--><a href="${ctx}account/index.html">营业管理</a>-->变更查询
<div class="easyui-panel" title="开户信息" style="width:100%">
    <div style="text-align: center;">
         <table cellpadding="5" align="center" style="width:65%">
             <c:if test="${empty account}">
             	<tr>
             	<td colspan="4">无套餐变更记录</td>
             	</tr>
             </c:if>
             
             <c:if test="${!empty account}">
             	<tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">账号:</td>
                 <td style="text-align: left;padding-left: 10px;">${account.userName}</td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">姓名:</td>
                 <td style="text-align: left;padding-left: 10px;">${account.name}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">证件类型:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${account.licenseType eq 1?"身份证":account.licenseType eq 2?"学生证":account.licenseType eq 3?"军官证":account.licenseType eq 4?"护照":"其它"}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">证件编号:</td>
                 <td style="text-align: left;padding-left: 10px;">${account.licenseNo}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">电子邮箱:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${account.email}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">联系电话:</td>
                 <td style="text-align: left;padding-left: 10px;">${account.phoneNum}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">开户时间:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 		<fmt:formatDate value="${account.updateTime}" pattern="yyyy-MM-dd"/>
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">到期时间:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	<fmt:formatDate value="${account.expireTime}" pattern="yyyy-MM-dd"/>
                 </td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">变更套餐为:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${fp.name}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">上网类型:</td>
                 <td style="text-align: left;padding-left: 10px;">${fp.strategyType eq 1?"包月无上限":"其它"}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">变更时间:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${at.createTime}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;"></td>
                 <td style="text-align: left;padding-left: 10px;"></td>
             </tr>
             </c:if>
             
             <tr align="center">
                 <td colspan="4">
                 <c:if test="${flag eq 1}">
                 	<a href="${ctx}account/create.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
                 </c:if>
                 <c:if test="${!(flag eq 1)}">
                 	<a href="${ctx}account/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
                 </c:if>
                 </td>
             </tr>
         </table>
    </div>
</div>
</body>
</html>
