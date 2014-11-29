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
    <form id="inputForm" action="${ctx}school/index.html" method="post">
         <table width="98%">
            <tr>
            <td width="15%" align="right">
       		<input type="hidden" name="page" id="page" value="${param['page']}">
        	<input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
      		  学校名：<input name="search_LIKES_userName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_userName']}">
      		</td><td width="20%" align="right">
        	地区：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>  
             </td><td width="20%" align="right">      
         	 区局：       <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>
             </td><td width="20%" align="right">
           	 调拨区局：       <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>
             </td><td width="20%" align="right">
                                           分成类型：       <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>
             </td>
             </tr>
             <tr >
                <td align="right">
                                           可信标志：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>
             </td><td align="right">
                                             上网方式：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
                    </td>
             </select>
                </td>
                <td colspan=2></td>
                <td align="right">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
                </td>
             </tr>
         </table>
    </form>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="9%">名称</th>
            <th field="name2" width="9%">编码</th>
            <th field="name3" width="9%">上网方式</th>
            <th field="name4" width="9%">分成类型</th>
            <th field="name5" width="9%">学校分成比例</th>
            <th field="name6" width="9%">所在地区</th>
            <th field="name6" width="9%">区局</th>
            <th field="name6" width="9%">调拨区局</th>
            <th field="name6" width="9%">可信标志</th>
            <th field="name6" width="9%">虚拟学校标志</th>
            <th field="name6" width="9%">激活帐号数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.name}</td>
                <td>${entity.code}</td>
                <td>${entity.netType}</td>
                <td>${entity.userName}</td>
                <td>${entity.userName}</td>
                <td>${entity.userName}</td>
                <td>${entity.realName}</td>
                <td>${entity.email}</td>
                <td>${entity.createTime}</td>
                <td>${entity.status eq 1?"正常":"禁用"}</td>
                <td>授权</td>
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
