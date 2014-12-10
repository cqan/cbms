<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <form id="inputForm" action="${ctx}accountGroup/index.html" method="post">
    	 <input type="hidden" name="page" id="page" value="${param['page']}">
         <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
         <table>
            <tr>
      		<td align="right">
        		客户组名称：<input name="search_LIKES_name" style="width: 90px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
             </td>
            <td align="right">
      		  客户组编号：<input name="search_LIKES_groupCode" style="width: 90px;" class="easyui-textbox" value="${param['search_LIKES_groupCode']}">
      		</td>
             <td align="right">      
	         	 客户组类型：
	         	 <select class="easyui-combobox" style="width:90px;" data-options="panelHeight:'auto'" name="search_EQI_type">
	                    <option value="">全部</option>
	                    <option value="1" ${param['search_EQI_type'] eq 1?"selected":""}>学生</option>
	                    <option value="2" ${param['search_EQI_type'] eq 2?"selected":""}>家属区</option>
	                    <option value="3" ${param['search_EQI_type'] eq 3?"selected":""}>办公区</option>
	                    <option value="4" ${param['search_EQI_type'] eq 4?"selected":""}>其它</option>
	             </select>
             </td>
             <td  align="right">
	           	 所在学校：<select class="easyui-combobox" style="width:90px;" data-options="panelHeight:'auto'" name="search_EQI_school.id">
	                    <option value="">全部</option>
	                    <c:forEach items="${schools}" var="school">
	                        <option value="${school.id}" ${param['search_EQI_school.id'] eq school.id?"selected":""}>${school.name}</option>
	                    </c:forEach>
	             </select>
             </td>
             <td align="right">
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
             </td>
             </tr>
         </table>
    </form>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <shiro:hasPermission name="school.accountGroup.add">
        		<a href="${ctx}accountGroup/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">添加</a>
        </shiro:hasPermission>
        <thead>
        <tr>
            <th field="name1" width="15%">客户组编号</th>
            <th field="name2" width="15%">客户组名称</th>
            <th field="name3" width="15%">客户组类型</th>
            <th field="name4" width="15%">学校</th>
            <!--
            <th field="name5" width="15%">自动绑定</th>
            -->
            <th field="name6" width="15%">备注</th>
            <th field="name7" width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.groupCode}</td>
                <td>${entity.name}</td>
                <td>${entity.type eq 1?"学生":(entity.type eq 2?"家属区":(entity.type eq 3?"办公区":"其它"))}</td>
                <td>${entity.school.name}</td>
                <!--
                <td></td>
                -->
                <td>${entity.description}</td>
                <td>
                    <shiro:hasPermission name="school.accountGroup.modify">
                    	<a href="${ctx}accountGroup/edit.html?id=${entity.id}">修改</a>&nbsp;
                    </shiro:hasPermission>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%">
        <div id="pagination" class="easyui-pagination" data-options="
					total: ${page.totalElements},
					pageSize:${page.size},
					pageNumber:${page.number+1},
					showPageList: true,
					pageList:[10,20,30],
					showRefresh: false,
					onSelectPage:selectPage,
					beforePageText:'第',
					afterPageText:'页，共{pages}页',
					displayMsg: '显示{from} - {to} 条数据，共{total}条'"></div>
    </div>
  </body>
</html>
