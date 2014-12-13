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
    <form id="inputForm" action="${ctx}card/batch/index.html" method="post">
        <input type="hidden" name="page" id="page" value="${param['page']}">
        <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
        名称:<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
        区域:<input name="search_LIKES_area" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_area']}">
        价格:<input name="search_GTEF_price" style="width: 100px;" class="easyui-textbox" value="${param['search_GTEF_price']}">
        -<input name="search_LTF_price" style="width: 100px;" class="easyui-textbox" value="${param['search_LTF_price']}">
        创建时间:<input name="search_GTED_createTime" class="easyui-datetimebox" value="${param['search_GTED_createTime']}" style="width:155px">
        至<input name="search_LTD_createTime" class="easyui-datetimebox" value="${param[search_LTD_createTime]}" style="width:155px">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
    </form>
    <shiro:hasPermission name="card.create.add">
    	<a href="${ctx}card/batch/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px">添加</a>
    </shiro:hasPermission>
    </div>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="15%">名称</th>
            <th field="name2" width="10%">区域</th>
            <th field="name3" width="10%">价格</th>
            <th field="name4" width="10%">数量</th>
            <th field="name5" width="10%">状态</th>
            <th field="name6" width="15%">失效时间</th>
            <th field="name7" width="15%">创建时间</th>
            <th field="name8" width="15%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td><a href="${ctx}card/index.html?search_EQL_cardBatch.id=${entity.id}">${entity.name}</a></td>
                <td>${entity.area}</td>
                <td>${entity.price}</td>
                <td>${entity.cardNum}</td>
                <td>${entity.status eq 0?"未制卡":entity.status eq 1?"正在制卡":"制卡完成"}</td>
                <td><fmt:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <shiro:hasPermission name="card.create.renew">
                    	<a href="#" onclick="resetCardBatch('${entity.id}')">重新生成卡</a>
                    	<a href="${ctx}card/batch/edit1.html?id=${entity.id}">修改</a>&nbsp;
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
  
 <script type="text/javascript">
  $(function(){
  	var msg = "${msg}";
  	if(msg!=''){
  		show("",msg);
  	}
  });
  
  function resetCardBatch(id){
	  jQuery.ajax({
		  		url: "${ctx}card/batch/operate.html",
		  		data:{id:id}, 
		  		type:"POST",
		  		success: function(data){
			        alert(data);
			        window.location.reload(true);
			  }});
  }
</script>
</html>
