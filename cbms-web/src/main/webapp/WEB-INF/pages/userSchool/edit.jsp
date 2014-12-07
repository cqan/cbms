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
		
		.selectbutton{
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
				
		.mulSeleted{
		    border: 0 none;
		    height: 400px;
		    padding-left: 45px;
		    text-align: left;
		    width: 820px;
		}
		
		.mulSeleted>div:nth-child(1){
			border: 0;
			height: 50px;
			line-height: 50px;
		}
		
		.mulSeleted>div:nth-child(2){
			height: 280px;
			width: 850px;
			border: 0;
		}
		.mulSeleted>div:nth-child(3){
			height: 20px;
			width: 390px;
		}
		
		.mulSeleted>div:nth-child(4){
			height: 20px;
			width: 730px;
			border: 0;
			text-align: center;
		}
		
		.mulSeleted span{
			color: #343434; 
			margin-left: 5px;
			font-weight: bold;
			font-size: 12px;
		 	font-family: '宋体';
		}
		
		.mulSeleted select {
			height: 242px;
			width: 300px;
			border:0;
			margin-top: -1px;
			background: #f7f7f7
		}
		
		.mulSeleted select>option{
			border-bottom:1px #e2e2e2 solid;
			height: 25px;
		}
		
		.mulSeletedLeft{
			width: 300px;
			border: 1px #0e2d5f solid;
			float: left;
			border-radius: 2px;
			margin-right: 5px;
			margin-left: 5px;
		}
		
		.mulSeletedCenter{
			width: 100px;
			height: 158px;
			float: left;
			margin-left: 15px;
			margin-top: 18px;
			text-align: center;
		}
		
		.mulSeletedRight{
			width: 300px;
			border: 1px #0e2d5f solid;
			float: left;
			border-radius: 2px;
			margin-right: 5px;
			margin-left: 5px;
		}
		
		.mulSeletedCenter .red{
			margin-top:30px;
		}
		
		.mulSeletedLeft>div{
			width: 300px;
			background: #757575;
		} 
		
		.mulSeletedRight>div{
			width: 300px;
			background: #757575;
		}
				
	    #currentMemSpan{
			color:#fff;
		}
	 </style>
</head>
<body>
<div style="margin:5px 0;"></div>
系统管理--><a href="${ctx}user/index.html">用户管理</a>-->${empty entity?"添加":"修改"}用户信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}用户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}userSchool/save.html" method="post" onsubmit="return submitForm();">
        <input name="schoolIds" id="schoolIds" type="hidden">
        <input name="userId" id="userId" type="hidden"  value="${user.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr align="center">
                    <td>
					      <div class="mulSeleted">
						           <div><span>当前用户：</span><span id="teamName">${user.userName}</span></div>
						           <div>
						               <div class="mulSeletedLeft">
							               <div>
							                  <span id="currentMemSpan" >可分配地区</span>
							               </div>
							               <select multiple="multiple" id="inOption">
							                   <c:forEach items="${schools}" var="school">
						                             <option value="${school.id}">${school.name}</option>
						                       </c:forEach>
							               </select>
							           </div>
							           <div class="mulSeletedCenter">
							               <div class="selectbutton" onclick="added(false);">添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加&nbsp;&gt;&nbsp;&nbsp;&nbsp;</div>
							               <div class="selectbutton" onclick="removed(false);">删&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除&nbsp;&lt;&nbsp;&nbsp;&nbsp;</div>
							               <div class="selectbutton" onclick="added(true);">添加所有&nbsp;&gt;&gt;&nbsp;</div>
							               <div class="selectbutton" onclick="removed(true);">删除所有&nbsp;&lt;&lt;&nbsp;</div>
							           </div>
							           <div class="mulSeletedRight">
							                <div>
							                   <span id="notCurrentMemSpan">已分配地区</span>
							                </div>
							                <select multiple="multiple" id="outOption">
							                   <c:forEach items="${inMySchools}" var="inMySchool">
						                             <option value="${inMySchool.id}">${inMySchool.name}</option>
						                       </c:forEach>
							                </select>
						                </div>
						           </div>
						           <div>
						               <span id="errorTip"></span>
						           </div>
						  </div>
                    </td>
                </tr>
                <tr>
                    <td>
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">&nbsp;&nbsp;&nbsp;
				           <a href="${ctx}user/index.html" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">返回</a>
				        
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
	   });
	   
	   function submitForm(){
	   var $right = $(".mulSeletedRight select");	
	   var $schools = $($right).find("option");
	   var schools = new Array();
	   $schools.each(function(index,element){
	      schools.push($(this).val());
	   });
	   var s = schools;
	   $("#schoolIds").val(s);
	   return true;
	   }
	   
	   
 function added(all){
	var $left = $(".mulSeletedLeft select");
	var $right = $(".mulSeletedRight select");	
	if(all){
	    var roptions = $($left).find("option");
		$("#errorTip").html("");
		roptions.each(function(index,element){
			var $element = $(element);
			var value = $element.val();
			var text = $element.text();
			$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($right);
			$(element).remove();
		});
	}else{
	    var roptions = $($left).find("option:selected");
		if(roptions.length <= 0 ){
	        $("#errorTip").html("请选择添加的成员");
		}else{
			$("#errorTip").html("");
			roptions.each(function(index,element){
				var $element = $(element);
				var value = $element.val();
				var text = $element.text();
				$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($right);
				$(element).remove();
			});
		}
	}
}

function removed(all){
	var $left = $(".mulSeletedLeft select");
	var $right = $(".mulSeletedRight select");	
	if(all){
	    var roptions = $($right).find("option");
		$("#errorTip").html("");
		roptions.each(function(index,element){
			var $element = $(element);
			var value = $element.val();
			var text = $element.text();
			$("<option class=\"short\" title=\""+text+"\" value='"+value+"'>"+text+"</option>").appendTo($left);
			$(element).remove();
		});
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
	</script>
</html>
