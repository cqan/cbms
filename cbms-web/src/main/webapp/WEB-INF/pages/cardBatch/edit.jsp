<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">区域:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" name="area"  value="${entity.area}"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">价格:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<input type="text" id="price" name="price" value="${entity.price}"/>
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
	                    <td  style="width:47%;text-align: right;padding-right: 10px;">描述:</td>
	                    <td style="text-align: left;padding-left: 10px;">
	                    	<textarea rows="decription" cols="20"></textarea>
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
		    	if(msg!=''){
		    		show("",msg);
		    }
		    	
		   	$("#inputForm").validate({
				rules: {
					name: {
						required: true
					},
					area: {
						required: true
					},
					price:{
						required:true,
						number:true
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
					area: {
						required:"*请输入区域！"
					},
					price:{
						required:"*请输入价格！",
						number:"请正确的价格！"
					},
					cardNum:{
						required:"请输入数量！",
						digits:"请输入正确的数量！"
					}
				}
			});
		   	
		   });
			
		</script>
</html>
