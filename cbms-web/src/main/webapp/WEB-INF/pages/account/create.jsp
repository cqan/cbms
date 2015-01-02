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
系统--><a href="${ctx}account/index.html">营业管理</a>-->开户受理<div class="easyui-panel" title="开户受理" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}account/save.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="userName" name="userName" value="${entity.userName}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">密码:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="password" name="password"  value=""/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">用户默认状态:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="status">
		                    <option value="0" ${entity.status?"selected":""}>欠费停机</option>
		                    <option value="1" ${!entity.status?"selected":""}>正常</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">姓名:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="name" name="name"  value="${entity.name}"/>*请输入用户的真实姓名</td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">证件类型:
                    </td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" style="width:75px;" name="licenseType" id="licenseType">
		                    <option value="1" ${entity.licenseType eq 1?"selected":""}>身份证</option>
		                    <option value="2" ${entity.licenseType eq 2?"selected":""}>学生证</option>
		                    <option value="2" ${entity.licenseType eq 3?"selected":""}>军官证</option>
		                    <option value="3" ${entity.licenseType eq 4?"selected":""}>护照</option>
		                    <option value="4" ${entity.licenseType eq 5?"selected":""}>其它</option>
                       </select>证件编号:<input type="text" id="licenseNo" name="licenseNo"  value="${entity.licenseNo}"/>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;"></td>
                    <td style="text-align: left;padding-left: 10px;"></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">绑定手机:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="mobile" name="mobile"  value="${entity.mobile}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">联系电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="phoneNum" name="phoneNum"  value="${entity.phoneNum}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">Email:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="email" name="email"  value="${entity.email}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">地址:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="address" name="address"  value="${entity.address}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">所在学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox"  id="school" data-options="valueField:'schoolId', textField:'schoolName',panelHeight:'auto',editable:false" name="schoolId"> </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">客户组:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="valueField:'groupId', textField:'groupName',panelHeight:'auto',editable:false" id="group" name="group.id"> </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
                            <shiro:hasPermission name="business.account.add">
                            	<a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">保存</a>&nbsp;&nbsp;&nbsp;
				            </shiro:hasPermission>
				            <a href="${ctx}account/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
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
	    	var $independentGroup = $("#independentGroup");
	    	$independentGroup.click(function(){
		    	if($(this).attr("checked")=="checked"){
		    	   $(this).val(1);
		    	}else{
		    	   $(this).val(2);
		    	}
	    	});
	    	if(msg!=''){
	    		show("",msg);
		    }
	    	
			jQuery.validator.addMethod("licenseNo", function(value, element) {
				var licenseType = $('#licenseType').combobox('getValue'); 
			    if(licenseType==1){
					var licenseNo = $('#licenseNo').val(); 
			    	if(licenseNo.length!=15&&licenseNo.length!=18){
					       return false;
					 }
			    }
			    return true;
	    	 }, "*身份证号码长度必须是15位或18位！");
			
			
			jQuery.validator.addMethod("mobile", function(value, element) {
				var mobile = $('#mobile').val(); 
				//132、130、131、156、155、185、186，176
				var reg = /^((130|132|131|156|155|185|186|176[0-9])+\d{8})$/;
		    	if(!reg.test(mobile)){
				       return false;
				 }
			    return true;
	    	 }, "*请输入正确的手机号！");
	    	
	    	$("#inputForm").validate({
				rules: {
					userName: {
						required: true,
						 remote:{
							 url:'${ctx}account/checkUserName.html',
							 type:"post",
							 dataType:"json", 
							 data: {                    
								 userName: function(){return $("#userName").val()},
								 id:$("#uid").val()}
						 }
					},
					password: {
						required: true,
						minlength:6
					},
					name:{
						required:true
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
					licenseNo:{
						 licenseNo:true,
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
					userName: {
						required:"*请输入帐号名！",
						remote:"*帐号已存在！"
					},
					password: {
						required:"*请输入密码！",
						minlength:"*密码最小长度不应少于6个字符"
						
					},
					name:{
						required:"*请输入姓名"
					},
					mobile:{
						remote:"*此手机号已存在！"
					},
					licenseNo:{
						required:"*请输入证件号码",
						licenseNo:"*身份号必须是15位或18位！",
						remote:"*证件号已存在！"
					}
				}
			});
	    	
	    	
	   	  var _school = $('#school').combobox({
	             url: '${ctx}account/select.html?name=school',
	             editable: false,
	             valueField: 'schoolId',
	             textField: 'schoolName',
	             onSelect: function (record) {
	           	  _group.combobox({
	                     disabled: false,
	                     url: '${ctx}account/select.html?name=group&schoolId=' + record.schoolId,
	                     valueField: 'groupId',
	                     textField: 'groupName'
	                 }).combobox('clear');
	             }
	         });
	         var _group = $('#group').combobox({
	             disabled: true,
	             valueField: 'groupId',
	             textField: 'groupName'
	         });
	    	
	    });
	    
	    function verifyForm(){
	    	var school = $('#school').combobox('getValue'); 
	    	var group = $('#group').combobox('getValue'); 
	    	if(school==''){
	    		msgShow("提示","请选择学校！","warning");
	    		return false;
	    	}
	    	if(group==''){
	    		msgShow("提示","请选择用户组！","warning");
	    		return false;
	    	}
	    	$("#inputForm").submit();
	    }
	</script>
</html>
