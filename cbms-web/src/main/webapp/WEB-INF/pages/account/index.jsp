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
    <form id="inputForm" action="${ctx}account/index.html" method="post">
        <input type="hidden" name="page" id="page" value="${param['page']}">
        <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
        用户姓名:<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
        帐号:<input name="search_LIKES_userName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_userName']}">
        绑定手机:<input name="search_LIKES_mobile" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_mobile']}">
        证件号:<input name="search_LIKES_licenseNo" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_licenseNo']}">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
    </form>
    </div>
    <div>
    	<a href="${ctx}account/create.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">开户</a>
    	<a href="${ctx}account/recharge.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">充卡充值</a>
    </div>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="10%">用户姓名</th>
            <th field="name2" width="10%">帐号</th>
            <th field="name3" width="10%">绑定手机</th>
            <th field="name4" width="10%">密码</th>
            <th field="name5" width="15%">证件号</th>
            <th field="name6" width="10%">创建时间</th>
            <th field="name7" width="10%">到期时间</th>
            <th field="name8" width="10%">状态</th>
            <th field="name9" width="15%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.name}</td>
                <td>${entity.userName}</td>
                <td>${entity.mobile}</td>
                <td>${entity.password}</td>
                <td>${entity.licenseNo}</td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${entity.expireTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${entity.status eq 0?"正常":"停机"}</td>
                <td>
                	<a href="${ctx}account/info.html?id=${entity.id}">详情</a>&nbsp;
                	<a href="${ctx}account/queryChange.html?id=${entity.id}">查询变更</a>&nbsp;
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
