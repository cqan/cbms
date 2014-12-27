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
    <div style="margin:5px 0;"></div>  
    系统-->营业管理-->充值历史
    <form id="inputForm" action="${ctx}rechargeHistory/index.html" method="post">
        <input type="hidden" name="page" id="page" value="${param['page']}">
        <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
        帐号:<input name="search_LIKES_userName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_userName']}">
        套餐名称：<input name="search_LIKES_feePolicyName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_feePolicyName']}">
         <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_rechargeType">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_rechargeType'] eq 1?"selected":""}>卡充值</option>
                    <option value="2" ${param['search_EQI_rechargeType'] eq 2?"selected":""}>短信充值</option>
             </select>
         <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>待充值</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>充值成功</option>
                    <option value="2" ${param['search_EQI_status'] eq 3?"selected":""}>取消充值</option>
             </select>
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
        </form>
    </div>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="15%">帐号</th>
            <th field="name2" width="15%">套餐名称</th>
            <th field="name3" width="10%">充值类型</th>
            <th field="name4" width="15%">创建时间</th>
            <th field="name5" width="15%">充值时间</th>
            <th field="name6" width="10%">状态</th>
            <th field="name7" width="20%">备注</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.userName}</td>
                <td>${entity.feePolicyName}</td>
                <td>${entity.rechargeType eq 1?"卡充值":"短信充值"}</td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${entity.status eq 1 ?"待充值":entity.status eq 2?"充值成功":entity.status eq 3?"取消充值":"其它"}</td>
                <td>${entity.description}</td>
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
