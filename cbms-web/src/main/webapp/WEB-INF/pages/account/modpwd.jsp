<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
学校客户组管理--><a href="${ctx}account/index.html">学校客户组管理</a>-->${empty entity?"添加":"修改"}学校客户组信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}学校客户组信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}account/modpwd.html" method="post">
    		<input name=id id="id" type="hidden" value="${account.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号:</td>
                    <td style="text-align: left;padding-left: 10px;">${account.userName}</td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">证件编号:</td>
                    <td style="text-align: left;padding-left: 10px;">${account.licenseNo}</td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">密码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="pwd" name="pwd"></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">重复密码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" name="repwd"></td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="button" class="button" value="重置" onclick="verifyForm()">&nbsp;&nbsp;&nbsp;
				            <input type="reset" class="button" value="取消">
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
					pwd: {
						required: true,
						minlength:6
					},
					repwd:{
						equalTo:"#pwd"
					}
				},
				messages:{
					pwd: {
						required:"*请输入密码！",
						minlength:"密码长度致少6位！"
					},
					repwd:{
						equalTo:"重复密码与密码不一致！"
					}
				}
			});
	    });
	    
	    function verifyForm(){
	    	$.messager.confirm('系统提示', '确认要重置密码吗?', function(r){
	            if (r){
	                $("#inputForm").submit();
	            }
	        }); 
	    }
	</script>
</html>
