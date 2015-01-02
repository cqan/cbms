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
	系统管理--><a href="${ctx}card/batch/index.html">制卡管理</a>-->充值制卡
	<div class="easyui-panel" title="添加制卡" style="width:100%">
	    <div style="text-align: center;">
	        <form id="inputForm" action="${ctx}card/batch/save.html" method="POST">
	            <table cellpadding="5" align="center" style="width: 100%">
	                <tr>
	                    <td style="width:47%;text-align: right;padding-right: 10px;">名称:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" id="name"  name="name" value="${entity.name}" />
	                    </td>
	                </tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">价格:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" id="price" name="price" value="${entity.price}"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">制卡前辍:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" id="cardPrefix" name="cardPrefix" value="${entity.cardPrefix}"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">制卡后辍:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" id="cardSuffix" name="cardSuffix" value="${entity.cardSuffix}"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">数量:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" id="cardNum" name="cardNum" value="${entity.cardNum}"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">失效时间:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" class="easyui-datetimebox" id="endTime" name="endTime" value="${entity.endTime}"/>
	                    </td>
	                </tr>
	                 <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">套餐:</td>
	                    <td style="text-align: left;padding-left: 10px;">        
	                        <select class="easyui-combobox" id="feePolicy" name="feePolicyId" data-options="valueField:'feePolicyId', textField:'feePolicyName',panelHeight:'auto',editable:false">
	                       </select>
	                    </td>
                	<tr>
	                 <tr>
	                    <td align="center" colspan="2">
	                    	<div>
		                    	<table>
		                    		<tr>
		                    			<td>所有学校:</td>
		                    			<td></td>
		                    			<td>选择学校：</td>
		                    		</tr>
		                    		<tr>
		                    			<td>
		                    				<select id="allSchools" multiple="multiple" size="6">
		                    					<c:forEach var="school" items="${allSchools}">
		                    						<option value="${school.id}" ondblclick="selectOne()">${school.name}</option>
		                    					</c:forEach>
		                    				</select>
		                    			</td>
		                    			<td>
			                    			<div><input value=">" type="button" onclick="selectOne()"></div>
			                    			<div><input value=">>" type="button" onclick="selectAll()"></div>
			                    			<div><input type="button" onclick="removeOne()" value="<"></div>
			                    			<div><input type="button" onclick="removeAll()" value="<<"/></div>
			                    		</td>
		                    			<td>
		                    				<select id="cardSchools" name="cardSchools" multiple="multiple" size="6">
		                    				</select>
		                    			</td>
		                    		</tr>
		                    	</table>
	                    	</div>
	                    </td>
                	<tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">描述:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<textarea rows="3" cols="20" name="decription"></textarea>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="2">
	                      <div style="text-align:center;padding:5px">
					            <a href="#" class="easyui-linkbutton" style="margin-right: 20px;width: 80px" icon="icon-ok" onclick="verifyForm()">保存</a>&nbsp;
					            <a href="${ctx}card/batch/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
					        </div>
	                    </td>
	                </tr>
	            </table>
	        </form>
	    </div>
	</div>
	<script type="text/javascript">   
	
		function selectOne(){
			$("#allSchools option:selected").each(function(){
				 $("#cardSchools").append("<option  ondblclick='removeOne()' value='"+$(this).val()+"'>"+$(this).text()+"</option");  
	　　　　　　　　$(this).remove();　
			});
		}
		function selectAll(){
			$("#allSchools option").each(function(){
				 $("#cardSchools").append("<option  ondblclick='removeOne()' value='"+$(this).val()+"'>"+$(this).text()+"</option");  
	　　　　　　　　$(this).remove();　
			});
		}
		function removeOne(){
			$("#cardSchools option:selected").each(function(){
				 $("#allSchools").append("<option  ondblclick='selectOne()' value='"+$(this).val()+"'>"+$(this).text()+"</option");  
	　　　　　　　　$(this).remove();　
			});
		}
		function removeAll(){
			$("#cardSchools option").each(function(){
				 $("#allSchools").append("<option  ondblclick='selectOne()' value='"+$(this).val()+"'>"+$(this).text()+"</option");  
	　　　　　　　　$(this).remove();　
			});
		}
	    $(function(){
	    	var msg = "${msg}";
	    	if(msg!=''){
	    		show("",msg);
	    }
	    	var _feePolicy = $('#feePolicy').combobox({
	             url: '${ctx}card/batch/feePolicys.html',
	             editable: false,
	             textField: 'feePolicyName',
	             onLoadSuccess: function (data) {
	            	 //设置黑认值
	            	 $('#feePolicy').combobox('setValue','${account.schoolId}');
	             }
	         });
		    	
		    	
		    	
		   	$("#inputForm").validate({
				rules: {
					name: {
						required: true
					},
					price:{
						required:true,
						number:true
					},
					cardPrefix:{
						required:true
					},
					cardSuffix:{
						required:true
					},
					cardNum:{
						required:true,
						digits:true 
					}
				},
				messages:{
					name: {
						required:"*请输入名称！"
					},
					price:{
						required:"*请输入价格！",
						number:"请正确的价格！"
					},
					cardPrefix:{
						required:"*请输入前辍！"
					},
					cardSuffix:{
						required:"*请输入后辍！"
					},
					cardNum:{
						required:"请输入数量！",
						digits:"请输入正确的数量！"
					}
				}
			});
		   });
		    
		    function verifyForm(){
		    	var feePolicy = $("#feePolicy").combobox('getValue'); 
		    	if(feePolicy==''){
		    		msgShow("提示","请选择套餐！","warning");
		    		return false;
		    	}
		    	$("#cardSchools option").each(function(){
		    		$(this).attr("selected",true);
				});
		    	$("#inputForm").submit();
		    }
			
		</script>
	</body>
</html>
