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
            <td align="right">
       		<input type="hidden" name="page" id="page" value="${param['page']}">
        	<input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
      		  学校名：<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
      		</td>
      		<td align="right">
        	地区：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_city">
        	        <option value="">全部</option>
        	        <option value="2"   ${param['search_EQI_city'] eq 2?"selected":""}>二区</option>
                    <option value="3"   ${param['search_EQI_city'] eq 3?"selected":""}>三区</option>
                    <option value="4"   ${param['search_EQI_city'] eq 4?"selected":""}>四区</option>
                    <option value="5"   ${param['search_EQI_city'] eq 5?"selected":""}>五区</option>
                    <option value="7"   ${param['search_EQI_city'] eq 7?"selected":""}>七区</option>
                    <option value="8"   ${param['search_EQI_city'] eq 8?"selected":""}>八区</option>
                    <option value="9"   ${param['search_EQI_city'] eq 9?"selected":""}>昌平</option>
                    <option value="10"  ${param['search_EQI_city'] eq 10?"selected":""}>房山</option>
                    <option value="11"  ${param['search_EQI_city'] eq 11?"selected":""}>密云</option>
             </select>  
             </td>
            <td align="right">
          分成类型： <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_rateType">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_rateType'] eq 1?"selected":""}>计时</option>
                    <option value="2" ${param['search_EQI_rateType'] eq 2?"selected":""}>包月</option>
             </select>
             </td>
                <td align="right">
                可信标志：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_trusted">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_trusted'] eq 1?"selected":""}>可信</option>
                    <option value="2" ${param['search_EQI_trusted'] eq 0?"selected":""}>不可信</option>
             </select>
             </td><td align="right">
             上网方式：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_netType">
	                    <option value="">全部</option>
	                    <option value="1" ${param['search_EQI_netType'] eq 1?"selected":""}>虚拟ADSL</option>
	                    <option value="2" ${param['search_EQI_netType'] eq 2?"selected":""}>PPPOE</option>
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
    	    <shiro:hasPermission name="school.reg.add">
    	    	<a href="${ctx}school/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">添加</a>
	        </shiro:hasPermission>
	        <thead>
	        <tr>
	            <th field="name1" width="8%">名称</th>
	            <th field="name2" width="8%">编码</th>
	            <th field="name3" width="8%">上网方式</th>
	            <th field="name4" width="8%">分成类型</th>
	            <th field="name5" width="8%">学校分成比例</th>
	            <th field="name6" width="8%">所在地区</th>
	            <th field="name9" width="8%">可信标志</th>
	            <th field="name10" width="8%">虚拟学校标志</th>
	            <th field="name11" width="8%">激活帐号数</th>
	            <th field="name13" width="12%">操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${page.content}" var="entity">
	            <tr>
	                <td>${entity.name}</td>
	                <td>${entity.schoolCode}</td>
	                <td>${entity.netType eq 1?"虚拟ADSL":"PPPOE"}</td>
	                <td>${entity.rateType eq 1?"计时":"包月"}</td>
	                <td>${entity.rate}</td>
	                <td>${entity.city eq 2 ?"二区":entity.city eq 3 ?"三区":entity.city eq 4 ?"四区":entity.city eq 5?"五区":entity.city eq 7?"七区":entity.city eq 8?"八区":entity.city eq 9?"昌平":entity.city eq 10?"房山":entity.city eq 11?"密云":""}</td>
	                <td>${entity.trusted eq 1?"可信":"不可信"}</td>
	                <td>${entity.virtualFlag eq '1'?"是":"否"}</td>
	                <td>${entity.activeNum}</td>
	                <td>
	                    <shiro:hasPermission name="school.reg.modify">
	                    	<a href="${ctx}school/edit.html?id=${entity.id}">修改</a>&nbsp;
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
