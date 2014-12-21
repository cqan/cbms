<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
系统--><a href="${ctx}account/index.html">营业管理</a>-->重置密码
<div class="easyui-panel" title="重置密码" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}account/setpwd.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号或证件编号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="name" name="name"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">下一步</a>&nbsp;&nbsp;&nbsp;
				            <a href="${ctx}account/modpwd.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
				        </div>
                    </td>
                </tr>
            </table>
        </form>
        
    </div>
</div>
</body>
	<script type="text/javascript">   
	    $(function(){
	    	var msg = "${msg}";
	    	if(msg!=''){
	    		show("",msg);
		    }
	    	
	    	$("#inputForm").validate({
				rules: {
					name: {
						required: true
					}
				},
				messages:{
					name: {
						required:"*请输入帐号名或证件名称！"
					}
				}
			});
	    });
	    
	    function verifyForm(){
    		$("#inputForm").submit();
    	}
	</script>
</html>
