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
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" style="width:75px;" name="licenseType">
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
                    <td  style="width:47%;text-align: right;padding-right: 10px;">联系电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="phoneNum" name="phoneNum"  value="${entity.phoneNum}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">Email:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="email" name="email"  value="${entity.email}"/>*相关资料或验证信息会发送到此邮箱，请正确填写</td>
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
                    <td  style="width:47%;text-align: right;padding-right: 10px;">套餐:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" id="feePolicy" name="feePolicyId" data-options="valueField:'feePolicyId', textField:'feePolicyName',panelHeight:'auto',editable:false">
                       </select>
                    </td>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="button" class="button" value="保存" onclick="verifyForm()">&nbsp;&nbsp;&nbsp;
				            <a href="${ctx}account/create.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
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
					email:{
						required:true,
						email:true	
					},
					phoneNum:{
						required:true
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
					email:{
						required:"*请输入email！",
						email:"*请输入正确的email地址"
					},
					phoneNum:{
						required:"*请输入联系电话"
					},
					address:{
						required:"*请输入联系地址"    
					},
					licenseNo:{
						required:"*请输入证件号码",
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
	           	  _feePolicy.combobox({
	                     disabled: false,
	                     url: '${ctx}account/select.html?name=feePolicy&schoolId=' + record.schoolId,
	                     valueField: 'feePolicyId',
	                     textField: 'feePolicyName'
	                 }).combobox('clear');
	             }
	         });
	         var _group = $('#group').combobox({
	             disabled: true,
	             valueField: 'groupId',
	             textField: 'groupName'
	         });
	         var _feePolicy = $('#feePolicy').combobox({
	             disabled: true,
	             valueField: 'feePolicyId',
	             textField: 'feePolicyName'
	         });
	    	
	    });
	    
	    function verifyForm(){
	    	var school = $('#school').combobox('getValue'); 
	    	var group = $('#group').combobox('getValue'); 
	    	var feePolicy = $('#feePolicy').combobox('getValue'); 
	    	if(school==''){
	    		msgShow("提示","请选择学校！","warning");
	    		return false;
	    	}
	    	if(group==''){
	    		msgShow("提示","请选择用户组！","warning");
	    		return false;
	    	}
	    	if(feePolicy==''){
	    		msgShow("提示","请选择套餐！","warning");
	    		return false;
	    	}
	    	$("#inputForm").submit();
	    }
	</script>
</html>