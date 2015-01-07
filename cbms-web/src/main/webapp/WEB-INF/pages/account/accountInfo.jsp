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
系统--><a href="${ctx}account/index.html">营业管理</a>-->开户信息
<div class="easyui-panel" title="开户信息" style="width:100%">
    <div style="text-align: center;">
         <table cellpadding="5" align="center" style="width:65%">
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">账号:</td>
                 <td style="text-align: left;padding-left: 10px;">${entity.userName}</td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">姓名:</td>
                 <td style="text-align: left;padding-left: 10px;">${entity.name}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">证件类型:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${entity.licenseType eq 1?"身份证":entity.licenseType eq 2?"学生证":entity.licenseType eq 3?"军官证":entity.licenseType eq 4?"护照":"其它"}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">证件编号:</td>
                 <td style="text-align: left;padding-left: 10px;">${entity.licenseNo}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">所在学校:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${school.name}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">客户组:</td>
                 <td style="text-align: left;padding-left: 10px;">${entity.group.name}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">绑定手机:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${entity.mobile}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">联系电话:</td>
                 <td style="text-align: left;padding-left: 10px;">${entity.phoneNum}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">开户时间:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 		<fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd"/>
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">到期时间:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	<fmt:formatDate value="${entity.expireTime}" pattern="yyyy-MM-dd"/>
                 </td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">地址:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${entity.address}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">受理人:</td>
                 <td style="text-align: left;padding-left: 10px;">${entity.creater}</td>
             </tr>
             <tr>
                 <td style="width:20%;text-align: right;padding-right: 10px;">套餐:</td>
                 <td style="text-align: left;padding-left: 10px;">
                 	${feePolicy.name}
                 </td>
                 <td style="width:20%;text-align: right;padding-right: 10px;">上网类型:</td>
                 <td style="text-align: left;padding-left: 10px;">${feePolicy.strategyType eq 1?"包月无上限":"其它"}</td>
             </tr>
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
