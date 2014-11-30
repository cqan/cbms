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
    <a href="${ctx}card/batch/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px">添加</a>
    </div>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="15%">名称</th>
            <th field="name2" width="15%">区域</th>
            <th field="name3" width="10%">价格</th>
            <th field="name4" width="10%">数量</th>
            <th field="name5" width="20%">失效时间</th>
            <th field="name6" width="20%">创建时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.name}</td>
                <td>${entity.area}</td>
                <td>${entity.price}</td>
                <td>${entity.cardNum}</td>
                <td><fmt:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
</script>
</html>
