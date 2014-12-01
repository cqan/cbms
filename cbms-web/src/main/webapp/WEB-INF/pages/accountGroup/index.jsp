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
    <form id="inputForm" action="${ctx}accountGroup/index.html" method="post">
         <table width="98%">
            <tr>
            <td width="15%" align="right">
       		<input type="hidden" name="page" id="page" value="${param['page']}">
        	<input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
      		  客户组编号：<input name="search_LIKES_code" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_code']}">
      		</td><td width="20%" align="right">
        	客户组名称：<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
             </td><td width="20%" align="right">      
         	 客户组类型：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_type">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_type'] eq 1?"selected":""}>学生</option>
                    <option value="2" ${param['search_EQI_type'] eq 2?"selected":""}>家属区</option>
                    <option value="3" ${param['search_EQI_type'] eq 3?"selected":""}>办公区</option>
                    <option value="4" ${param['search_EQI_type'] eq 4?"selected":""}>其它</option>
             </select>
             </td><td width="20%" align="right">
           	 所在学校：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>学校1</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>学校2</option>
             </select>
             </td><td width="20%" align="right">
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
             </td>
             </tr>
         </table>
    </form>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <a href="${ctx}accountGroup/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">添加</a>
        <thead>
        <tr>
            <th field="name1" width="15%">客户组编号</th>
            <th field="name2" width="15%">客户组名称</th>
            <th field="name3" width="15%">客户组类型</th>
            <th field="name4" width="15%">学校</th>
            <th field="name5" width="15%">自动绑定</th>
            <th field="name6" width="15%">备注</th>
            <th field="name7" width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.code}</td>
                <td>${entity.name}</td>
                <td>${entity.type}</td>
                <td>${entity.school.name}</td>
                <td></td>
                <td>${entity.description}</td>
                <td><a href="${ctx}accountGroup/edit.html?id=${entity.id}">修改</a>&nbsp;</td>
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
