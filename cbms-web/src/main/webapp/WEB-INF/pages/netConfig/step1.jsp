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
上网控制--><a href="${ctx}netConfig/step1.html">上网时间段配置</a>
<div class="easyui-panel" title="${empty entity?"添加":"修改"}上网时间段配置" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}netConfig/edit.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">请选择学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox"  id="school" data-options="valueField:'schoolId', textField:'schoolName',panelHeight:'auto',editable:false"> </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">客户组:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="valueField:'groupId', textField:'groupName',panelHeight:'auto',editable:false" name="groupId" id="group"></select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
                             <a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">下一步</a>&nbsp;
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
