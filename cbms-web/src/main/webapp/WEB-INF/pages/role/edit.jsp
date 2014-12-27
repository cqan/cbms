<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
系统管理--><a href="${ctx}role/index.html">角色管理</a>-->${empty entity?"添加":"修改"}角色信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}角色信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}role/save.html" method="post">
        <input id="rid" name="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">角色名称:</td>
                    <td style="text-align: left;padding-left: 10px;"><input  type="text"  name="name" value="${entity.name}"/></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">角色代码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input id="roleCode" type="text" ${empty entity?"":"readonly"} name="roleCode" value="${entity.roleCode}"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">保存</a>&nbsp;&nbsp;&nbsp;
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
	
	 function verifyForm(){
	    	$("#inputForm").submit();
	    }
</script>
</html>
