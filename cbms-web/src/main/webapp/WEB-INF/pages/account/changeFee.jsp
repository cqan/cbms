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
系统-->营业管理-->变更套餐
<div class="easyui-panel" title="变更套餐" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}account/changeFee.html" method="post" onsubmit="return verifyForm();">
    		<input name=id id="id" type="hidden" value="${account.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号:</td>
                    <td style="text-align: left;padding-left: 10px;">${account.userName}</td>
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
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="button" class="button" value="修改" onclick="verifyForm()">&nbsp;&nbsp;&nbsp;
				            <a href="${ctx}account/change.html"><input type="button" class="button" value="取消"></a>
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
	    	
	    	 var _school = $('#school').combobox({
	             url: '${ctx}account/select.html?name=school',
	             editable: false,
	             valueField: 'schoolId',
	             textField: 'schoolName',
	             onLoadSuccess: function (data) {
	            	 //设置黑认值
	            	 $('#school').combobox('setValue','${account.schoolId}');
	            	 _group.combobox({
	                     disabled: false,
	                     url: '${ctx}account/select.html?name=group&schoolId=${account.schoolId}',
	                     valueField: 'groupId',
	                     textField: 'groupName',
	                     onLoadSuccess: function (data) {
	                    	 _group.combobox('setValue','${account.group.id}');
	    	             }
	                 }).combobox('clear');
	           	  _feePolicy.combobox({
	                     disabled: false,
	                     url: '${ctx}account/select.html?name=feePolicy&schoolId=${account.schoolId}',
	                     valueField: 'feePolicyId',
	                     textField: 'feePolicyName',
	                     onLoadSuccess: function (data) {
	                    	 _feePolicy.combobox('setValue','${account.feePolicyId}');
	    	             }
	                 }).combobox('clear');
	             },
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
	    	var fee = $('#feePolicy').combobox('getValue'); 
	    	if(school==''){
	    		msgShow("提示","请选择学校！","warning");
	    		return false;
	    	}
	    	if(group==''){
	    		msgShow("提示","请选择用户组！","warning");
	    		return false;
	    	}
	    	if(fee==''){
	    		fee("提示","请选择套餐！","warning");
	    		return false;
	    	}
	    	return true;
	    }
	</script>
</html>
