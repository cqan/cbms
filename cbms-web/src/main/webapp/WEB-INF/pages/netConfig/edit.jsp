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
                    <td style="width:47%;text-align: right;padding-right: 10px;">请选择学校:</td>
                    <td style="text-align: left;padding-left: 10px;">
                       <select class="easyui-combobox" data-options="panelHeight:'auto'" name="upControl">
                       </select>
                    </td>
                </tr>
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">客户组:</td>
                    <td style="text-align: left;padding-left: 10px;">
                      <select class="easyui-combobox" data-options="panelHeight:'auto'" name="downControl">
                       </select>
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
    	$("#price").blur(function(){
    	    if(/^\d+(\.\d+)?$/.test($(this).val())){
    	       $("#price_time_msg").removeAttr("color").html("");
    	    }else{
    	       $("#price_time_msg").css("color","red").html(" * 价格格式错误，请输入数值");
    	    }
    	});
    	
    	$("#time").blur(function(){
    	    if(/^\d+(\.\d+)?$/.test($(this).val())){
    	       $("#price_time_msg").removeAttr("color").html("");
    	    }else{
    	       $("#price_time_msg").css("color","red").html(" * 日期格式错误，请输入数值");
    	    }
    	});
    	
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