<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
系统管理--><a href="${ctx}school/index.html">学校管理</a>-->${empty entity?"添加":"修改"}学校信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}用户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}school/save.html" method="post">
        <input name="id" id="uid" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">名称:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<input type="text" id="name"  name="name" value="${entity.name}" />
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">学校编码:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<input type="text" name="schoolCode"  value="${entity.schoolCode}"/>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">上网方式:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="netType">
                        <option value="1" ${entity.netType eq 1?"selected":""}>虚拟ADSL</option>
                        <option value="2"  ${entity.netType eq 2?"selected":""}>PPPOE</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">分层类型:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" id="rateType" name="rateType">
                        <option value="1" ${entity.rateType eq 1?"selected":""}>计时</option>
                        <option value="2"  ${entity.rateType eq 2?"selected":""}>包月</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">学校分成比例:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    <input type="text" id="rate"  name="rate" value="${entity.rate}"/>
                    <span id="rate_msg"></span></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">所属地区:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="city">
                        <option value="2"   ${entity.city eq 2?"selected":""}>二区</option>
                        <option value="3"   ${entity.city eq 3?"selected":""}>三区</option>
                        <option value="4"   ${entity.city eq 4?"selected":""}>四区</option>
                        <option value="5"   ${entity.city eq 5?"selected":""}>五区</option>
                        <option value="7"   ${entity.city eq 7?"selected":""}>七区</option>
                        <option value="8"   ${entity.city eq 8?"selected":""}>八区</option>
                        <option value="9"   ${entity.city eq 9?"selected":""}>昌平</option>
                        <option value="10"  ${entity.city eq 10?"selected":""}>房山</option>
                        <option value="11"   ${entity.city eq 11?"selected":""}>密云</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">虚拟学校标志:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="virtualFlag">
                        <option value="0" ${entity.virtualFlag eq 0?"selected":""}>否</option>
                        <option value="1"  ${entity.virtualFlag eq 1?"selected":""}>是</option>
                       </select>
                    </td>
                </tr>
               <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">可信标示:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<input type="checkbox" id="trusted"  name="trusted"  ${entity.trusted eq 1?"checked":""} value="${entity.trusted eq null?2:entity.trusted}" /></td>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">网络负责人:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="netLeader"  name="netLeader" value="${entity.netLeader}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">网络负责人电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="netLeaderPhone"  name="netLeaderPhone" value="${entity.netLeaderPhone}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">维护人员:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="maintenance"  name="maintenance" value="${entity.maintenance}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">维护人员电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="mPhone"  name="mPhone" value="${entity.mPhone}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">客户经理:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="customerManager"  name="customerManager" value="${entity.customerManager}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">客户经理电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="cmPhone"  name="cmPhone" value="${entity.cmPhone}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">服务器IP:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="serverIp"  name="serverIp" value="${entity.serverIp}" /><span id="serverIp_msg"></span></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">服务器端口:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="serverPort"  name="serverPort" value="${entity.serverPort}" /><span id="serverPort_msg"></span></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">地址:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="addr"  name="addr" value="${entity.addr}" /></td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">描述:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<textarea rows="3" cols="17" style="resize: none" id="description" name="description" >${entity.description}</textarea>
	                </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
                      		<a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">保存</a>&nbsp;&nbsp;&nbsp;
				           <a href="${ctx}school/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
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
    	
         var $trusted = $("#trusted");
	     $trusted.click(function(){
	         if($(this).attr("checked")=="checked"){
	            $(this).val(1);
	         }else{
	            $(this).val(0);
	         }
	     });
    	
    	jQuery.validator.addMethod("ip", function(value, element) {
    	    return this.optional(element) || (/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/.test(value) && (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256));
    	  }, "*请填写正确的IP地址！");
    	
    	$("#inputForm").validate({
			rules: {
				name: {
					required: true
				},
				schoolCode: {
					required: true
				},
				rate:{
					required:true,
					number:true,
					min:0,
					max:100
				}
			},
			messages:{
				name: {
					required: "*请填写学校名称！"
				},
				schoolCode: {
					required: "*请填写学校代码！"
				},
				rate:{
					required:"*请填写学校分成比率！",
					number:"*分成比率必须是数字！",
					min:"*必须大于0",
					max:"*必须小于100"
				}
			}
		});
    });
    
    function verifyForm(){
    	$("#inputForm").submit();
    }
	
</script>
</html>
