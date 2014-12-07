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
     <style type="text/css">
     #addConfigTable{
	     width:80%;
	     border:1px;
	     solid #eee;
     }
     #addConfig>tr>first-child{
     
     
     }
     </style>
</head>
<body>
<div style="margin:5px 0;"></div>
计费管理--><a href="${ctx}feePolicy/index.html">计费套餐策略</a>-->${empty entity?"添加":"修改"}计费套餐策略信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}请进行上网时间段配置" style="width:100%;height:100%;">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}netConfig/save.html" method="post">
    		<input name="id" id="id" type="hidden" value="${entity.id}">
            <table id="addConfigTable" cellpadding="5" align=center>
                <tr>
                    <td  style="text-align: center;padding-right: 10px;">序号</td>
                    <td style="text-align: center;padding-left: 10px;">
                                                                                                         上网时间
                    </td>
                    <td style="text-align: center;padding-left: 10px;">
                                                                                                        规则 (时间格式：如0830表示8:30；2030表示晚上20:30)
                    </td>
                </tr>
               <c:forEach items="${netConfigs}" var="netConfig" varStatus="status">
	                <tr>
	                    <td  style="text-align: center;padding-right: 10px;">
	                        ${status}
	                    </td>
	                    <td style="text-align: center;padding-left: 10px;">
	                                                                                                        星期三
	                           <input type="hidden" name="startWork" value="${netConfig.startWork}">
	                           <input type="hidden" name="endWork" value="${netConfig.startWork}">                                                                
	                    </td>
	                    <td style="text-align: center;padding-left: 10px;">
	                          <a href="#" onclick="del(this);">删除</a>
	                    </td>
	                </tr>
				</c:forEach>
                <tr>
                    <td  style="text-align: center;padding-right: 10px;">日期段</td>
                    <td style="text-align: center;padding-left: 10px;">
                       <select id="startWeek" class="easyui-combobox" data-options="panelHeight:'auto'" name="">
		                    <option value="1">星期一</option>
		                    <option value="2" >星期二</option>
		                    <option value="3" >星期三</option>
		                    <option value="4" >星期四</option>
		                    <option value="5" >星期五</option>
		                    <option value="6" >星期六</option>
		                    <option value="7" >星期日</option>
                       </select>  
                       ----
                      <select id="endWeek" class="easyui-combobox" data-options="panelHeight:'auto'" name="">
		                    <option value="1">星期一</option>
		                    <option value="2">星期二</option>
		                    <option value="3">星期三</option>
		                    <option value="4">星期四</option>
		                    <option value="5">星期五</option>
		                    <option value="6">星期六</option>
		                    <option value="7">星期日</option>
                       </select>                                                                              
                    </td>
                    <td style="text-align: center;padding-left: 10px;">
                                                                                                      时间段：<input type="text" name="" id="startTime">----<input type="text" name="" id="endTime"><input id="addConfig" type="button" class="button" value="增加">
                    </td>
                </tr>
            </table>
            <div style="text-align:center;padding:5px">
				  <input type="submit" class="button" value="保存">&nbsp;&nbsp;&nbsp;
	              <input type="reset" class="button" value="取消">
			</div>
        </form>
    </div>
</div>
</body>
<script lang="text/javascript">   
    $(function(){
	    	 var _school = $('#school').combobox({
	             url: '${ctx}account/select.html?name=school',
	             editable: false,
	             valueField: 'schoolId',
	             textField: 'schoolName',
	             onSelect: function (record) {
	            	 _group.combobox({
	                     disabled: false,
	                     url: '${ctx}account/select.html?name=group&schoolId=' + record.schoolId,
	                     valueField: 'groupId',
	                     textField: 'groupName'
	                 }).combobox('clear');
	             }
	         });
	         
	         var _group = $('#group').combobox({
	             disabled: true,
	             valueField: 'groupId',
	             textField: 'groupName'
	         });
	         
	         $addConfig = $("#addConfig").click(function(){
	            var $startWeek = $("#startWeek");
	            var $endWeek = $("#endWeek");
	            var soption = $startWeek.find("option:selected");
	            var eoption = $endWeek.find("option:selected");
	            var stext = soption.text();
	            var sval = soption.val();
	            var etext = eoption.text();
	            var eval = eoption.val();
	            var text = "";
	            if(sval>eval){
	              alert("");
	            }else if(sval==eval){
	               text=stext;
	            }else{
	                text=stext+etext;
	            }
	            var st = $("#startTime").val();
	            var et = $("#endTime").val();
	       	    $("#startTime").val("");
	       	    $("#endTime").val("");
	       	    var temp = "<tr><td style=\"text-align: center;padding-right: 10px;\">s</td><td style=\"text-align: center;padding-left: 10px;\">"+text+"<input name=\"startWork\" type=\"hidden\" value=\"+sval+\"><input name=\"endWork\" type=\"hidden\" value=\"+eval+\"><input name=\"startTime\" type=\"hidden\" value=\"+st+\"><input name=\"endTime\" type=\"hidden\" value=\"+et+\"></td><td style=\"text-align: center;padding-left: 10px;\"><a href=\"#\" onclick=\"del(this);\">删除</a></td></td></tr>";
	            var $temp = $(temp);
	            $(this).parent().parent("tr").before($temp);
	         });
    });
    
    function del(myself){
       $(myself).parent().parent("tr").remove();
    }
       
</script>
</html>
