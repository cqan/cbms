<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<div style="margin:5px 0;"></div>
系统管理--><a href="${ctx}role/index.html">角色管理</a>-->给角色[${entity.name}]授权
<div class="easyui-panel" title="用户授权" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}role/auth.html" method="post">
        <input name="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" style="width: 100%">
                <tr>
                    <td style="width:30%;text-align: right;padding-right: 10px;">权限名称:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<c:forEach items="${auths}" var="auth" varStatus="rowCounter">
					<c:set var="isDoing" value="0" />
		      	<c:forEach items="${entity.permissions}" var="auth1">
		      	     <c:if test="${auth.id eq auth1.id}">
			         	<input type="checkbox" checked="checked" name="auth" value="${auth1.id}"> ${auth1.name}
			           	<c:set var="isDoing" value="1"/>
			         </c:if>
		      	</c:forEach>
		           	<c:if test="${isDoing!=1}">
		            	 <input type="checkbox" name="auth" value="${auth.id}"> ${auth.name}
		           	</c:if>
		           	<c:if test="${rowCounter.index % 4 == 0}">
		       		<br/>
		      		</c:if> 
				</c:forEach>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">
				            <a href="${ctx}role/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
				        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script lang="text/javascript">   
	$(function(){
		var msg = "${msg}";
		if(msg!=''){
			show("",msg);
	}
	
	$("#inputForm").validate({
		rules: {
			name: {
				required: true
			},
			roleCode: {
				required: true,
				 remote:{
					 url:'${ctx}role/checkRoleCode.html',
					 type:"post",
					 dataType:"json", 
					 data: {                    
						 userName: function(){return $("#roleCode").val()},
						 id:$("#rid").val()}
				 }
			}
		},
		messages:{
			name: {
				required:"*请输入角色名称！"
			},
			roleCode: {
				required:"*请输入角色代码！",
				remote:"*角色代码已存在！"
			}
		}
	});
	
});
</script>
</html>
