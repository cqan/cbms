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
系统管理--><a href="${ctx}user/index.html">用户管理</a>-->${empty entity?"添加":"修改"}用户信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}用户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}user/save.html" method="post">
        <input name="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center">
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text" name="userName" value="${entity.userName}"></input></td>
                </tr>
                <tr>
                    <td>姓名:</td>
                    <td><input class="easyui-textbox" type="text" name="realName"  value="${entity.realName}"></input></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text" name="email" value="${entity.email}"></input></td>
                </tr>
                <tr>
                    <td>状态:</td>
                    <td>
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="status">
                        <option value="1" ${entity.status eq 1?"selected":""}>正常</option>
                        <option value="2"  ${entity.status eq 2?"selected":""}>禁用</option>
                       </select>
                    </td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <input type="submit" value="保存">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
        </div>
    </div>
</div>
</body>
<script>   


    function clearForm(){
        $('#inputForm').form('clear');
    }
    
    $(function(){
    	var msg = "${msg}";
    	if(msg!=''){
    		show("",msg);
    	}
    	
    	$("#inputForm").validate({
	        rules: {
	        	   userName: {
	        		   required: true
	        	   },
	        	   realName: {
	        	    required: true,
	        	    minlength: 2
	        	   },
	        	   email: {
	        	    required: true,
	        	    email: true
	        	   }
	        	  },
	        messages: {
	        	userName: "请输入用户名",
	        	email: {
	        	    required: "请输入Email地址",
	        	    email: "请输入正确的email地址"
	        	 },
	        	 realName: {
	        	    required: "请输入姓名",
	        	    minlength:"姓名长度不能少于2个字符"
	        	 }
	        }
	   });
    });
	
</script>
</html>
