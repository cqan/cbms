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
系统-->营业管理-->变更帐户信息
<div class="easyui-panel" title="变更帐户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}account/modInfo.html" method="post">
    		<input name=id id="uid" type="hidden" value="${account.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号:</td>
                    <td style="text-align: left;padding-left: 10px;">${account.userName}</td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">姓名:</td>
                    <td style="text-align: left;padding-left: 10px;"><input name="name" value="${account.name}"></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">证件编号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input name="licenseNo" value="${account.licenseNo}"></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">地址:</td>
                    <td style="text-align: left;padding-left: 10px;"><input name="address" value="${account.address}"></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">绑定手机:</td>
                    <td style="text-align: left;padding-left: 10px;"><input name="mobile" id="mobile" value="${account.mobile}"></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">联系电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input name="phoneNum" value="${account.phoneNum}"></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">email:</td>
                    <td style="text-align: left;padding-left: 10px;"><input name="email" value="${account.email}"></td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
                      <a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">修改</a>&nbsp;&nbsp;&nbsp;
				            <a href="${ctx}account/modify.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
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
	    	
	    	jQuery.validator.addMethod("mobile", function(value, element) {
				var mobile = $('#mobile').val(); 
				if (mobile=="") {
					return true;
				}
				//132、130、131、156、155、185、186，176
				var reg = /^((130|132|131|156|155|185|186|176[0-9])+\d{8})$/;
		    	if(!reg.test(mobile)){
				       return false;
				 }
			    return true;
	    	 }, "*请输入正确的手机号！");
	    	$("#inputForm").validate({
				rules: {
					name:{
						required:true
					},
					email:{
						email:true	
					},
					mobile:{
						mobile:true,
						remote:{
							 url:'${ctx}account/checkMobile.html',
							 type:"post",
							 dataType:"json", 
							 data: {                    
								 mobile: function(){return $("#mobile").val()},
								 id:$("#uid").val()}
						 }
					},
					address:{
						required:true
					},
					licenseNo:{
						required:true,
						 remote:{
							 url:'${ctx}account/checkLicenseNo.html',
							 type:"post",
							 dataType:"json", 
							 data: {                    
								 licenseNo: function(){return $("#licenseNo").val()},
								 id:$("#uid").val()}
						 }
					}
				},
				messages:{
					name:{
						required:"*请输入姓名"
					},
					email:{
						email:"*请输入正确的email地址"
					},
					address:{
						required:"*请输入联系地址"
					},mobile:{
						remote:"*此手机号已存在！"
					},
					licenseNo:{
						required:"*请输入证件号码",
						remote:"*证件号已存在！"
					}
				}
	    	});
   	});
	    
		    function verifyForm(){
		    	$.messager.confirm('系统提示', '确认要修改此帐号资料吗?', function(r){
		            if (r){
		                $("#inputForm").submit();
		            }
		        }); 
		    }
	</script>
</html>
