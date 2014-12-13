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
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="groupCode"  name="groupCode" value="${entity.groupCode}" /></td>
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
                    <td style="text-align: left;padding-left: 10px;"><input type="checkbox" id="independentGroup"  name="independentGroup"  ${entity.independentGroup eq 1?"checked":""} value="${entity.independentGroup eq null?0:entity.independentGroup}" /></td>
                </tr>
               <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">强制下线:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="checkbox" id="kick"  name="kick"  ${entity.kick eq 1?"checked":""} value="${entity.kick eq null?0:entity.kick}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">NAS-IP-Address 绑定:</td>
                    <td style="text-align: left;padding-left: 10px;">
                         <input type="radio" ${(empty entity || entity.ipBindTag eq 0 )?"checked='checked'":""}  name="ipBindTag"  value="0"/>
                                                                                        禁止绑定
                         <input type="radio" ${(entity.ipBindTag eq 1 )?"checked='checked'":""}  name="ipBindTag"  value="1"/>
                                                                                         需要绑定
                         <input type="radio" ${(entity.ipBindTag eq 3 )?"checked='checked'":""}  name="ipBindTag"  value="3"/>
                                                                                         已绑定
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">NAS-IP-Address BrasIP地址:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="nasId" name="nasId"  value="${entity.nasId}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">NAS-Port-Id:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="nasPortId" name="nasPortId"  value="${entity.nasPortId}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">NAS-Port:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="nasPort" name="nasPort"  value="${entity.nasPort}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">vlan绑定:</td>
                    <td style="text-align: left;padding-left: 10px;">
                         <input type="radio" onclick="checkVlan(0);"  ${(empty entity || entity.vlanBindTag eq 0 )?"checked='checked'":""}  name="vlanBindTag"  value="0"/>
                                                                                       禁止绑定
                         <input type="radio" onclick="checkVlan(1);"  ${(entity.vlanBindTag eq 1 )?"checked='checked'":""}  name="vlanBindTag"  value="1"/>
                                                                                       需要绑定
                         <input type="radio" onclick="checkVlan(2);"  ${(entity.vlanBindTag eq 2 )?"checked='checked'":""}  name="vlanBindTag"  value="2"/>
                                                                                       已绑定
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">内vlan:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="vlanID1" name="vlanID1" disabled=disabled  value="${entity.vlanID1}"/></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">外vlan:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="vlanID2" name="vlanID2" disabled=disabled value="${entity.vlanID2}"/></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">备注:</td>
                    <td style="text-align: left;padding-left: 10px;">
	                    <textarea rows="3" cols="17" style="resize: none" id="description" name="description">${entity.description}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">&nbsp;&nbsp;&nbsp;
				            <a href="${ctx}accountGroup/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
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
	    
	     var $independentGroup = $("#independentGroup");
	     $independentGroup.click(function(){
	         if($(this).attr("checked")=="checked"){
	            $(this).val(1);
	         }else{
	            $(this).val(0);
	         }
	     });
	     
	     var $kick = $("#kick");
	     $kick.click(function(){
	         if($(this).attr("checked")=="checked"){
	            $(this).val(1);
	         }else{
	            $(this).val(0);
	         }
	     });
 
    	$("#inputForm").validate({
			rules: {
				groupCode: {
					required: true
				},
				name: {
					required: true
				}
			},
			messages:{
				groupCode: {
					required: "*请填写服务组编码！"
				},
				name: {
					required: "*请填写服务组名称！"
				}
			}
		});
    	
    });
    
	function checkVlan(f){
	   var $vlanID1 = $("#vlanID1");
	   var $vlanID2 = $("#vlanID2");
	   if(f==2){
	     $vlanID1.removeAttr("disabled");
	     $vlanID2.removeAttr("disabled");
	   }else{
	     $vlanID1.val("");
	     $vlanID2.val("");
	     $vlanID1.attr("disabled","disabled");
	     $vlanID2.attr("disabled","disabled");
	   }
	}
	
</script>
</html>
