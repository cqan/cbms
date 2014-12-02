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
计费管理--><a href="${ctx}feePolicy/index.html">计费套餐策略</a>-->${empty entity?"添加":"修改"}计费套餐策略信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}学校客户组信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}feePolicy/save.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">计费政策类型:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="strategyType"  name="strategyType" value="${entity.strategyType}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">计费策略名:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="name" name="name"  value="${entity.name}"/></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;"></td>
                    <td style="text-align: left;padding-left: 10px;">
                       <input type="text" id="price"  name="price" value="${entity.price}" style="width:53px;"/>&nbsp;元&nbsp;
                       <input type="text" id="time"  name="time" value="${entity.time}" style="width:53px;"/>月&nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">上行带宽控制:</td>
                    <td style="text-align: left;padding-left: 10px;">
                       <select class="easyui-combobox" data-options="panelHeight:'auto'" name="upControl">
                            <option value="0" ${entity.upControl eq 1?"selected":"0"}>无限制</option>
		                    <option value="1" ${entity.upControl eq 1?"selected":""}>512K</option>
		                    <option value="2" ${entity.upControl eq 2?"selected":""}>1M</option>
		                    <option value="3" ${entity.upControl eq 3?"selected":""}>2M</option>
		                    <option value="4" ${entity.upControl eq 4?"selected":""}>3M</option>
		                    <option value="5" ${entity.upControl eq 5?"selected":""}>4M</option>
		                    <option value="6" ${entity.upControl eq 6?"selected":""}>8M</option>
		                    <option value="7" ${entity.upControl eq 7?"selected":""}>10M</option>
		                    <option value="8" ${entity.upControl eq 8?"selected":""}>12M</option>
		                    <option value="9" ${entity.upControl eq 9?"selected":""}>20M</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">下行带宽控制:</td>
                    <td style="text-align: left;padding-left: 10px;">
                      <select class="easyui-combobox" data-options="panelHeight:'auto'" name="downControl">
                            <option value="0"  ${entity.downControl eq 1?"selected":"0"}>无限制</option>
		                    <option value="1" ${entity.downControl eq 1?"selected":""}>512K</option>
		                    <option value="2" ${entity.downControl eq 2?"selected":""}>1M</option>
		                    <option value="3" ${entity.downControl eq 3?"selected":""}>2M</option>
		                    <option value="4" ${entity.downControl eq 4?"selected":""}>3M</option>
		                    <option value="5" ${entity.downControl eq 5?"selected":""}>4M</option>
		                    <option value="6" ${entity.downControl eq 6?"selected":""}>8M</option>
		                    <option value="7" ${entity.downControl eq 7?"selected":""}>10M</option>
		                    <option value="8" ${entity.downControl eq 8?"selected":""}>12M</option>
		                    <option value="9" ${entity.downControl eq 9?"selected":""}>20M</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">适用地区:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="area">
                        <option value="1" ${entity.area eq 1?"selected":""}>北京1</option>
                        <option value="2"  ${entity.area eq 2?"selected":""}>北京2</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">适用学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="school.id">
		                    <option value="0" ${entity.school.id eq school.id?"selected":""}>全部</option>
		                    <c:forEach items="${schools}" var="school">
		                        <option value="${school.id}" ${entity.school.id eq school.id?"selected":""}>${school.name}</option>
		                    </c:forEach>
                       </select>
                    </td>
                </tr>
                <tr>
                     <td style="width:47%;text-align: right;padding-right: 10px;">开始日期：</td>
	                 <td style="text-align: left;padding-left: 10px;">
	                     <input name="startTime" class="easyui-datetimebox" value="${entity.startTime}" style="width:100px;">
	                 </td>
                </tr>
                <tr>
                     <td style="width:47%;text-align: right;padding-right: 10px;">
                     	 结束日期：
                     </td>
	                 <td style="text-align: left;padding-left: 10px;">
	                    <input name="endTime" class="easyui-datetimebox" value="${entity.endTime}" style="width:100px;">
	                 </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">
                   	              学生是否可见:
                    </td>
                    <td style="text-align: left;padding-left: 10px;">
	                    <select class="easyui-combobox" data-options="panelHeight:'auto'" name="stuVisible">
		                    <option value="0" ${entity.stuVisible eq 0?"selected":""}>全部</option>
		                    <option value="1" ${entity.stuVisible eq 1?"selected":""}>是</option>
		                    <option value="2" ${entity.stuVisible eq 2?"selected":""}>否</option>
		                </select>
	                </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">套餐解释:</td>
                    <td style="text-align: left;padding-left: 10px;">
	                    <textarea rows="3" cols="17" style="resize: none" id="description" name="description">${entity.description}</textarea>
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
