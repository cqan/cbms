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
    <form id="inputForm" action="${ctx}feePolicy/index.html" method="post">
         <table width="98%">
	            <tr>
	            <td width="15%" align="right">
	       		<input type="hidden" name="page" id="page" value="${param['page']}">
	        	<input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
	      		 策略名称：<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
	      		</td>
	      		<td width="20%" align="right">      
	         	 策略类型：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_strategyType">
	                    <option value="">全部</option>
	                    <option value="1" ${param['search_EQI_strategyType'] eq 1?"selected":""}>计时</option>
	                    <option value="2" ${param['search_EQI_strategyType'] eq 2?"selected":""}>包时长</option>
	                    <option value="3" ${param['search_EQI_strategyType'] eq 3?"selected":""}>包天无上限</option>
	                    <option value="4" ${param['search_EQI_strategyType'] eq 4?"selected":""}>包天有时长上限</option>
	                    <option value="5" ${param['search_EQI_strategyType'] eq 5?"selected":""}>包天有流量上限</option>
	                    <option value="6" ${param['search_EQI_strategyType'] eq 6?"selected":""}>包月无上限</option>
	                    <option value="7" ${param['search_EQI_strategyType'] eq 7?"selected":""}>包月有时长上限</option>
	                    <option value="8" ${param['search_EQI_strategyType'] eq 8?"selected":""}>包月有流量上限</option>
	                    <option value="9" ${param['search_EQI_strategyType'] eq 9?"selected":""}>计流量</option>
	             </select>
	             </td>
	             <td width="20%" align="right">      
	         	 适用地区：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQS_area">
	                    <option value="">全省</option>
	                    <option value="1" ${param['search_EQS_area'] eq 1?"selected":""}>北京</option>
	             </select>
	             </td>
	             <td width="20%" align="right">
	           	 学校：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_school.id">
	                    <option value="">全部</option>
	                    <c:forEach items="${schools}" var="school">
	                        <option value="${school.id}" ${param['search_EQI_school.id'] eq school.id?"selected":""}>${school.name}</option>
	                    </c:forEach>
	             </select>
	             </td><td width="20%" align="right">
	           	 学生是否可见：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_stuVisible">
	                    <option value="">全部</option>
	                    <option value="1">是</option>
	                    <option value="2">否</option>
	             </select>
             </tr>
             <tr align=right>
                 <td>
                                                                 开始日期：<input name="search_GTED_startTime" class="easyui-datetimebox" value="${param['search_GTED_startTime']}" style="width:100px;">
                 </td>
                 <td>
                                                                 结束日期：<input name="search_LTD_endTime" class="easyui-datetimebox" value="${param[search_LTD_endTime]}" style="width:100px;">
                 </td>
	             </td><td width="20%" align="right" colspan=3>
	            		 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
	             </td>
             </tr>
         </table>
    </form>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <a href="${ctx}feePolicy/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">添加</a>
        <thead>
        <tr>
            <th field="name1" width="6%">计费策略名</th>
            <th field="name2" width="6%">地区</th>
            <th field="name3" width="6%">适用学校</th>
            <th field="name4" width="8%">计费政策类型</th>
            <th field="name5" width="6%">费率（元）</th>
            <th field="name6" width="8%">周期（分钟/天/月）</th>
            <th field="name7" width="8%">上限类型（N：无S：时间 L：流量）</th>
            <th field="name8" width="6%">超限费率</th>
            <th field="name9" width="6%">上限数值</th>
            <th field="name10" width="6%">客户组类型</th>
            <th field="name11" width="6%">创建人</th>
            <th field="name12" width="8%">学生是否可见（Y：是 N：否）</th>
            <th field="name13" width="8%">启动标志（Y：是  N：否）</th>
            <th field="name14" width="10%">套餐解释</th>
            <th field="name15" width="4%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.name}</td>
                <td>${entity.area}</td>
                <td>${entity.school.id eq null?"全部学校":entity.school.name}</td>
                <td>${entity.strategyType}</td>
                <td>${entity.price}</td>
                <td>${entity.time}</td>
                <td>${entity.time}</td>
                <td>${entity.time}</td>
                <td>${entity.time}</td>
                <td>${entity.time}</td>
                <td>${entity.time}</td>
                <td>${entity.stuVisible eq ""?"全部":(entity.stuVisible eq 1?"是":"否")}</td>
                <td>${entity.time}</td>
                <td>${entity.description}</td>
                <td><a href="${ctx}feePolicy/edit.html?id=${entity.id}">修改</a>&nbsp;</td>
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
