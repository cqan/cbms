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
计费管理--><a href="${ctx}feePolicy/index.html">计费套餐策略</a>-->${empty entity?"添加":"修改"}计费套餐策略信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}计费套餐策略信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}feePolicy/save.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
    		<input id="schoolId" type="hidden" value="${entity.school.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">计费策略名:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<input type="text" id="name" name="name"  value="${entity.name}"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;"></td>
                    <td style="text-align: left;padding-left: 10px;">
                       <input type="text" id="price"  name="price" value="${entity.price}" style="width:53px;"/>&nbsp;元&nbsp;
                       <input type="text" id="time"  name="time" value="${entity.time}" style="width:53px;"/>月&nbsp;<span id="price_time_msg"></span>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">计费政策类型:</td>
                    <td style="text-align: left;padding-left: 10px;">
	                    <select class="easyui-combobox" data-options="panelHeight:'auto'" name="strategyType">
	                             <option value="1" ${entity.strategyType eq 1?"selected":""}>包月无上限</option>
				                 <option value="2" ${entity.strategyType eq 2?"selected":""}>包时长</option>
				                 <option value="3" ${entity.strategyType eq 3?"selected":""}>包天无上限</option>
				                 <option value="4" ${entity.strategyType eq 4?"selected":""}>包天有时长上限</option>
				                 <option value="5" ${entity.strategyType eq 5?"selected":""}>包天有流量上限</option>
				                 <option value="6" ${entity.strategyType eq 6?"selected":""}>计时</option>
				                 <option value="7" ${entity.strategyType eq 7?"selected":""}>包月有时长上限</option>
				                 <option value="8" ${entity.strategyType eq 8?"selected":""}>包月有流量上限</option>
				                 <option value="9" ${entity.strategyType eq 9?"selected":""}>计流量</option>
	                     </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">上行带宽控制:</td>
                    <td style="text-align: left;padding-left: 10px;">
                       <select class="easyui-combobox" data-options="valueField:'upControl',
                            textField:'upControlName',panelHeight:'auto',editable:false,data:[{'upControl':1,'upControlName':'1M',selected:${entity.upControl eq 1}},
                      		{'upControl':2,'upControlName':'2M',selected:${entity.upControl eq 2}},
                      		{'upControl':4,'upControlName':'4M',selected:${entity.upControl eq 4}},
                      		{'upControl':8,'upControlName':'8M',selected:${entity.upControl eq 8}},
                      		{'upControl':10,'upControlName':'10M',selected:${entity.upControl eq 10}},
                      		{'upControl':20,'upControlName':'20M',selected:${entity.upControl eq 20}},
                      		{'upControl':30,'upControlName':'30M',selected:${entity.upControl eq 30}},
                      		{'upControl':50,'upControlName':'50M',selected:${entity.upControl eq 50}},
                      		{'upControl':100,'upControlName':'100M',selected:${entity.upControl eq 100}}]" name="upControl" id="upControl">
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">下行带宽控制:</td>
                    <td style="text-align: left;padding-left: 10px;">
                      <select class="easyui-combobox" data-options="valueField:'downControl',
                            textField:'downControlName',panelHeight:'auto',editable:false,data:[
                            {'downControl':1,'downControlName':'1M',selected:${entity.downControl eq 1}},
                      		{'downControl':2,'downControlName':'2M',selected:${entity.downControl eq 2}},
                      		{'downControl':4,'downControlName':'4M',selected:${entity.downControl eq 4}},
                      		{'downControl':8,'downControlName':'8M',selected:${entity.downControl eq 8}},
                      		{'downControl':10,'downControlName':'10M',selected:${entity.downControl eq 10}},
                      		{'downControl':20,'downControlName':'20M',selected:${entity.downControl eq 20}},
                      		{'downControl':30,'downControlName':'30M',selected:${entity.downControl eq 30}},
                      		{'downControl':50,'downControlName':'50M',selected:${entity.downControl eq 50}},
                      		{'downControl':100,'downControlName':'100M',selected:${entity.downControl eq 100}}]" name="downControl" id="downControl">
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">适用地区:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox"  data-options="valueField:'areaId',
                            textField:'areaName',panelHeight:'auto',editable:false,
                            data:[{'areaId':'','areaName':'全部',selected:${entity.area eq ''}},
                            {'areaId':2,'areaName':'二区',selected:${entity.area eq '2'}},
                            {'areaId':3,'areaName':'三区',selected:${entity.area eq '3'}},
                            {'areaId':4,'areaName':'四区',selected:${entity.area eq '4'}},
                            {'areaId':5,'areaName':'五区',selected:${entity.area eq '5'}},
                            {'areaId':7,'areaName':'七区',selected:${entity.area eq '7'}},
                            {'areaId':8,'areaName':'八区',selected:${entity.area eq '8'}},
                            {'areaId':9,'areaName':'昌平',selected:${entity.area eq '9'}},
                            {'areaId':10,'areaName':'房山',selected:${entity.area eq '10'}},
                            {'areaId':11,'areaName':'密云',selected:${entity.area eq '11'}}
                            ]" name="area" id="area">
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">适用学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox"  id="school" name="schoolId" data-options="valueField:'schoolId', textField:'schoolName',panelHeight:'auto',editable:false"></select>
                    </td>
                </tr>
                <tr>
                     <td style="width:47%;text-align: right;padding-right: 10px;">开始日期：</td>
	                 <td style="text-align: left;padding-left: 10px;">
	                     <input name="startTime" class="Wdate" type="text" onClick="WdatePicker()" value="<fmt:formatDate value="${entity.startTime}" pattern="yyyy-MM-dd"/>" style="width:100px;">
	                 </td>
                </tr>
                <tr>
                     <td style="width:47%;text-align: right;padding-right: 10px;">
                     	 结束日期：
                     </td>
	                 <td style="text-align: left;padding-left: 10px;">
	                    <input name="endTime" class="Wdate" type="text" onClick="WdatePicker()" value="<fmt:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd"/>" style="width:100px;">
	                 </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">
                   	              学生是否可见:
                    </td>
                    <td style="text-align: left;padding-left: 10px;">
	                    <select class="easyui-combobox" data-options="panelHeight:'auto'" name="stuVisible">
		                    <option value="" ${entity.stuVisible eq null?"selected":""}>全部</option>
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
				            <a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">保存</a>&nbsp;&nbsp;&nbsp;
				            <a href="${ctx}feePolicy/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
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
    
     var area_id = $('#area').combobox('getValue'); 
     $('#area').combobox({
             editable: false,
             onLoadSuccess: function (data) {
            	 for(var i=0;i<data.length;i++){
            		 for (var item in data[i]) {
  	                    if (data[i][item] == '${entity.area}') {
  	                        $(this).combobox("select", data[i][item]);
	              			var u = "${ctx}school/select.html?areaId="+data[i][item];
	              			_school = $('#school').combobox({
	              	            url: u,
	              	            editable: false,
	              	            valueField: 'schoolId',
	              	            textField: 'schoolName',
	              	            onLoadSuccess:function(){
	              	            	var data = $(this).combobox("getData");
	              	            	 for(var i=0;i<data.length;i++){
	              	            		 for (var item in data[i]) {
	                   	                    if (data[i][item] == '${entity.school.id}') {
	                   	                        $(this).combobox("select", data[i][item]);
	                   	                    }
	                   	                }
	              	            	 }
	              	            }
	              		       }).combobox('clear');
	  	                 }
  	                }
            	 }
	    	 },
             onSelect: function (record) {
           	 	_school = $('#school').combobox({
	            url: '${ctx}school/select.html?areaId='+record.areaId,
	            editable: false,
	            valueField: 'schoolId',
	            textField: 'schoolName'
		       }).combobox('clear');
             }
	   });
	   
       var _school = $('#school').combobox({
             url: '${ctx}school/select.html?areaId='+area_id,
             editable: false,
             valueField: 'schoolId',
             textField: 'schoolName'
             //,
            //onLoadSuccess:function(data){
                 //$('#school').combobox('setValue',$("#schoolId").val());
            //}
       });
         
	   	$("#inputForm").validate({
			rules: {
				price: {
					required: true,
					number:true,
					min:0,
					max:65535
				},
				name: {
					required: true
				},
				time:{
					required: true,
					digits:true,
					min:0,
					max:99
				}
			},
			messages:{
				price: {
					required:"*请输入价格！",
					number:"*价钱只能是数字！",
					min:"*价钱必须大于0",
					max:"价钱最大不能超过65535"
				},
				name: {
					required:"*请输入名称！"
				},
				time:{
					required:"*请填写时间！",
					digits:"*时间只能是正整数！",
					min:"*时间必须大于0",
					max:"*时间不能大于99"
				}
			}
		});
    	
	   	var msg = "${msg}";
    	if(msg!=''){
    		show("",msg);
	    }
    });
    
    function verifyForm(){
    	var upControl = $("#upControl").combobox('getValue'); 
    	if(upControl==''){
    		msgShow("提示","请选择上行带宽！","warning");
    		return false;
    	}
    	var downControl = $("#downControl").combobox('getValue'); 
    	if(downControl==''){
    		msgShow("提示","请选择下行带宽！","warning");
    		return false;
    	}
    	//var area = $('#area').combobox('getValue'); 
    	//if(area==''){
    	//	msgShow("提示","请选择地区！","warning");
    	//	return false;
    	//}
    	$("#inputForm").submit();
    }
</script>
</html>
