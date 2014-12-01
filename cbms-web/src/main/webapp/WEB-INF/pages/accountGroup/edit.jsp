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
学校客户组管理--><a href="${ctx}accountGroup/index.html">学校客户组管理</a>-->${empty entity?"添加":"修改"}学校客户组信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}学校客户组信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}accountGroup/save.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">客户组编号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="code"  name="code" value="${entity.code}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">客户组名称:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="name" name="name"  value="${entity.name}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">客户组类型:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="type">
		                    <option value="1" ${entity.type eq 1?"selected":""}>学生</option>
		                    <option value="2" ${entity.type eq 2?"selected":""}>家属区</option>
		                    <option value="3" ${entity.type eq 3?"selected":""}>办公区</option>
		                    <option value="4" ${entity.type eq 4?"selected":""}>其它</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="school.id">
                            <c:forEach items="${schools}" var="school">
                                <option value="${school.id}" ${entity.school.id eq school.id?"selected":""}>${school.name}</option>
                            </c:forEach>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">独立客户组:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="checkbox" id="independentGroup"  name="independentGroup"  ${entity.independentGroup eq 1?"checked":""} value="${entity.independentGroup eq null?2:entity.independentGroup}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">备注:</td>
                    <td style="text-align: left;padding-left: 10px;">
	                    <textarea rows="3" cols="17" style="resize: none" id="description" name="description" value="${entity.description}" >
	                    </textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">&nbsp;&nbsp;&nbsp;
				            <input type="reset" class="button" value="取消">
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
    	
    });
	
</script>
</html>
