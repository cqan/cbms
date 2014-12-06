<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
	  #add_remove>div{
			float: left;
			margin-top: 11px;
			border-radius: 2px;
			border: 1px solid;
			cursor: pointer;
			height: 26px;
			background-color: #FFF;
			font-size: 12px;
			min-width: 50px;
			padding-left: 10px;
			padding-right: 10px;
			line-height: 26px;
			text-align: center
		}
	 </style>
</head>
<body>
<div style="margin:5px 0;"></div>
系统管理--><a href="${ctx}user/index.html">用户管理</a>-->${empty entity?"添加":"修改"}用户信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}用户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}userSchool/save.html" method="post">
        <input name="id" id="uid" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr align="center">
                    <td>
						  <div style="width: 390px;height: 300px;border: 0;aligin:center">
						        <div style="width: 390px;height: 250px;border: 0;">
						            <div style="width: 125px;border: 1px #5E6D81 solid;float: left;border-radius: 2px;margin-right: 5px;margin-left: 5px;">
						                 <div style="width: 125px;background: #757575;">
						                   <span style="color:#fff;font-weight: bold;font-size: 12px;font-family:'宋体';padding-left: 10px;">可分配地区</span>
						                 </div>
						                 <select multiple="multiple" style="height: 240px;width: 125px;border:0;background: #f7f7f7">
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="1">1</option>
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="2">2</option>
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="3">3</option>
						                 </select>
						            </div>
						            <div id="add_remove" style="width: 100px;height: 248px;float: left;margin-left: 10px;margin-right: 5px;padding-top: 40px;">
						                <div>添加&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;&nbsp;</div>
						                <div>删除&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;</div>
						                <div>添加全部&nbsp;&lt;&nbsp;</div>
						                <div>删除全部&nbsp;&gt;&gt;</div>
						            </div>
						            <div style="width: 125px;border: 1px #5E6D81 solid;float: left;border-radius: 2px;margin-right: 5px;margin-left: 5px;">
										<div style="width: 125px; background: #757575">
											<span style="color: #fff; font-weight: bold; font-size: 12px;padding-left: 10px;font-family:'宋体';">已分配地区</span>
										</div>
										<select multiple="multiple" style="height: 240px;width: 125px;border:0;">
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="5">5</option>
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="6">6</option>
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="7">7</option>
						                     <option style="border-bottom:1px #e2e2e2 solid;height: 25px;" value="8">8</option>
						                </select>
						            </div>
						        </div>
					        </div>
                    </td>
                </tr>
                <tr>
                    <td>
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
				userName: {
					required: true,
					 remote:{
						 url:'${ctx}user/checkUserName.html',
						 type:"post",
						 dataType:"json", 
						 data: {                    
							 userName: function(){return $("#userName").val()},
							 id:$("#uid").val()}
					 }
				},
				realName: {
					required: true
				},
				email:{
					required:true
				}
			},
			messages:{
				userName: {
					required:"*请输入用户名！",
					remote:"*用户名已存在！"
				},
				realName: {
					required:"*请输入姓名！"
				},
				email:{
					required:"*请输入email！"
				}
			}
		});
	   	
	   });
	   
	   
 function added(flag){
	var $left = $(".mulSeletedLeft select");
	var $right = $(".mulSeletedRight select");
	if(flag){
		var roptions = $($right).find("option:selected");
		var loptions = $($left).find("option:not(:disabled)");
		if(roptions.length <= 0 ){
            $("#errorTip").html("请选择添加的成员");
		}else if(roptions.length + loptions.length>15){
			roptions.each(function(index,element){
				var $element = $(element);
				$element.attr("selected",false);
			});
			$("#errorTip").html("添加成员数不能大于15个");
		}else{
			$("#errorTip").html("");
			roptions.each(function(index,element){
				var $element = $(element);
				var value = $element.val();
				var text = $element.text();
				$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($left);
				$(element).remove();
			});
		}
	}else{		
		var roptions = $($right).find("option:selected");
		if(roptions.length <= 0 ){
	        $("#errorTip").html("请选择添加的成员");
		}else{
			$("#errorTip").html("");
			roptions.each(function(index,element){
				var $element = $(element);
				var value = $element.val();
				var text = $element.text();
				$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($left);
				$(element).remove();
			});
		}
	}
}

function removed(flag){
	var $left = $(".mulSeletedLeft select");
	var $right = $(".mulSeletedRight select");
	if(flag){
		var loptions = $($left).find("option:selected");
		if(loptions.length <= 0 ){
			$("#errorTip").html("请选择删除的成员");
		}else{
			$("#errorTip").html("");
			loptions.each(function(index,element){
				var $element = $(element);
				var value = $element.val();
				var text = $element.text();
				$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($right);
				$(element).remove();
			});
		}
	}else{
		var loptions = $($left).find("option:selected");
		var roptions = $($right).find("option:not(:disabled)");
		if(loptions.length <= 0 ){
            $("#errorTip").html("请选择删除的成员");
		}else if(roptions.length + loptions.length>15){
			loptions.each(function(index,element){
				var $element = $(element);
				$element.attr("selected",false);
			});
			$("#errorTip").html("删除成员数不能大于15个");
		}else{
			$("#errorTip").html("");
			loptions.each(function(index,element){
				var $element = $(element);
				var value = $element.val();
				var text = $element.text();
				$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($right);
				$(element).remove();
			});
		}
	}
}
	</script>
</html>
