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
    <form id="inputForm" action="${ctx}user/index.html" method="post">
        <input type="hidden" name="page" id="page" value="${param['page']}">
        <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
        用户名:<input name="search_LIKES_userName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_userName']}">
        姓名:<input name="search_LIKES_realName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_realName']}">
        email:<input name="search_LIKES_email" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_email']}">
        状态： <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>
        创建时间:<input name="search_GTED_createTime" class="easyui-datetimebox" value="${param['search_GTED_createTime']}" style="width:155px">
        至<input name="search_LTD_createTime" class="easyui-datetimebox" value="${param[search_LTD_createTime]}" style="width:155px">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
    </form>
        <a href="${ctx}user/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px">添加</a>
    </div>
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
                <td>${entity.status eq 1?"正常":"禁用"}</td>
                <td>
                	<a href="${ctx}user/auth.html?id=${entity.id}">授权</a>&nbsp;
                	<a href="${ctx}user/edit.html?id=${entity.id}">修改</a>&nbsp;
                	<a href="#" onclick="disable('${entity.id}')">${entity.status eq 1?"禁用":"启用"}</a>&nbsp;
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
