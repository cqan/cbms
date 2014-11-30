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
      		  学校名：<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
      		</td><td width="20%" align="right">
        	地区：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQS_city">
        	        <option value="">全部</option>
                    <option value="1" ${param['search_EQS_city'] eq '北京'?"selected":""}>北京</option>
             </select>  
             </td><td width="20%" align="right">      
         	 区局：       <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQS_district">
         	        <option value="">全部</option>
                    <option value="1" ${param['search_EQS_district'] eq '昌平'?"selected":""}>昌平</option>
             </select>
             </td><td width="20%" align="right">
           	 调拨区局：       <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQS_subDistrict">
           	        <option value="">全部</option>
                    <option value="1" ${param['search_EQS_subDistrict'] eq '昌平'?"selected":""}>昌平</option>
             </select>
             </td><td width="20%" align="right">
                                           分成类型：       <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_rateType">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_rateType'] eq 1?"selected":""}>计时</option>
                    <option value="2" ${param['search_EQI_rateType'] eq 2?"selected":""}>包月</option>
             </select>
             </td>
             </tr>
             <tr >
                <td align="right">
                                           可信标志：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_trusted">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_trusted'] eq 1?"selected":""}>可信</option>
                    <option value="2" ${param['search_EQI_trusted'] eq 2?"selected":""}>不可信</option>
             </select>
             </td><td align="right">
                                             上网方式：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_netType">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_netType'] eq 1?"selected":""}>虚拟ADSL</option>
                    <option value="2" ${param['search_EQI_netType'] eq 2?"selected":""}>PPPOE</option>
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
    	    <a href="${ctx}school/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">添加</a>
	        <thead>
	        <tr>
	            <th field="name1" width="8%">名称</th>
	            <th field="name2" width="8%">编码</th>
	            <th field="name3" width="8%">上网方式</th>
	            <th field="name4" width="8%">分成类型</th>
	            <th field="name5" width="8%">学校分成比例</th>
	            <th field="name6" width="8%">所在地区</th>
	            <th field="name7" width="8%">区局</th>
	            <th field="name8" width="8%">调拨区局</th>
	            <th field="name9" width="8%">可信标志</th>
	            <th field="name10" width="8%">虚拟学校标志</th>
	            <th field="name11" width="8%">激活帐号数</th>
	            <th field="name12" width="12%">操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${page.content}" var="entity">
	            <tr>
	                <td>${entity.name}</td>
	                <td>${entity.code}</td>
	                <td>${entity.netType eq 1?"虚拟ADSL":"PPPOE"}</td>
	                <td>${entity.rateType eq 1?"计时":"包月"}</td>
	                <td>${entity.rate}</td>
	                <td>${entity.city}</td>
	                <td>${entity.district}</td>
	                <td>${entity.subDistrict}</td>
	                <td>${entity.trusted eq 1?"可信":"不可信"}</td>
	                <td>${entity.virtualFlag eq '1'?"否":"是"}</td>
	                <td>${entity.activeNum}</td>
	                <td><a href="${ctx}school/edit.html?id=${entity.id}">修改</a>&nbsp;</td>
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
