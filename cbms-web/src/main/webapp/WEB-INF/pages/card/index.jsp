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
    <div>
    <form id="inputForm" action="${ctx}card/index.html" method="post">
        <input type="hidden" name="page" id="page" value="${param['page']}">
        <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
        <input type="hidden" name=search_EQL_cardBatch.id id="pageSize" value="${param['search_EQL_cardBatch.id']}">
        卡号:<input name="search_LIKES_cardNo" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_cardNo']}">
        状态： <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>未使用</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>已使用</option>
                    <option value="2" ${param['search_EQI_status'] eq 3?"selected":""}>过期</option>
                    <option value="2" ${param['search_EQI_status'] eq 4?"selected":""}>冻结</option>
             </select>
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
        </form>
    </div>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name2" width="15%">卡号名</th>
            <th field="name3" width="10%">密码</th>
            <th field="name4" width="15%">制卡批次</th>
            <th field="name5" width="15%">创建时间</th>
            <th field="name6" width="10%">状态</th>
            <th field="name7" width="20%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.cardNo}</td>
                <td>${entity.pwd}</td>
                <td>${entity.cardBatch.name}</td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${entity.status eq 1?"未使用":entity.status eq 2?"已使用":entity.status eq 3?"过期":"冻结"}</td>
                <td>
                	<c:if test="${entity.status eq 1}"><a href="${ctx}card/op.html?id=${entity.id}">冻结</a>&nbsp;</c:if>
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
  
  <script type="text/javascript">
  	function disable(id){
  		if( $.messager.confirm('系统提示', '确实要执行此操作吗?', function(r){
  			if (r){
  				$.ajax({
  		  			url:"${ctx}user/disable.html",
  		  			data:{id:id},
  		  			type:'POST',
  		  			success:function(data){
  		  				alert(data);
  		  				window.location.reload(true);
  		  			},
  		  			error:function(data){
  		  				alert(data);
  		  			}
  		  			});
  				}}));
  		
  	}
  </script>
</html>
