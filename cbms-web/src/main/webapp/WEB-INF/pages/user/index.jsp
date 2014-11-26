<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理系统</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<body>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="15%">用户名</th>
            <th field="name2" width="15%">姓名</th>
            <th field="name3" width="20%">email</th>
            <th field="name4" width="20%">创建时间</th>
            <th field="name5" width="10%">状态</th>
            <th field="name6" width="20%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.userName}</td>
                <td>${entity.realName}</td>
                <td>${entity.email}</td>
                <td>${entity.createTime}</td>
                <td>${entity.status}</td>
                <td>授权</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%">
        <div class="easyui-pagination" data-options="
					total: 114,
					showPageList: false,
					showRefresh: false,
					displayMsg: ''"></div>
    </div>
  </body>
</html>
