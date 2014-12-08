<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
     .a{
     }
     </style>
</head>
<body>
<div style="margin:5px 0;"></div>
上网控制--><a href="${ctx}feePolicy/index.html">上网时间段配置</a>-->${fn:length(netConfigs)<=0?"添加":"修改"}
<div class="easyui-panel" title="${fn:length(netConfigs)<=0?"添加":"修改"}上网时间段配置" style="width:100%;height:100%;">
    <div style="text-align: center;height:100%;">
        <form id="inputForm" action="${ctx}netConfig/save.html" method="post">
    		<input name="groupId" type="hidden" value="${ag.id}">
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
	                <tr class="a">
	                    <td  style="text-align: center;padding-right: 10px;">${status.index+1}</td>
	                    <td style="text-align: center;padding-left: 10px;">
	                            <c:choose>
									<c:when test="${netConfig.startWork eq netConfig.endWork}">
	                                     ${netConfig.startWork eq 1?"星期一":netConfig.startWork eq 2?"星期二":netConfig.startWork eq 3?"星期三":netConfig.startWork eq 4?"星期四":netConfig.startWork eq 5?"星期五":netConfig.startWork eq 6?"星期五":"星期日"}
									</c:when>
									<c:otherwise>
	                                     ${netConfig.startWork eq 1?"星期一":netConfig.startWork eq 2?"星期二":netConfig.startWork eq 3 ?"星期三":netConfig.startWork eq 4 ?"星期四":netConfig.startWork eq 5?"星期五":netConfig.startWork eq 6?"星期六":"星期日"} 
	                                     &nbsp;&nbsp;--&nbsp;&nbsp;
	                                     ${netConfig.endWork eq 1?"星期一":netConfig.endWork eq 2?"星期二":netConfig.endWork eq 3 ?"星期三":netConfig.endWork eq 4 ?"星期四":netConfig.endWork eq 5?"星期五":netConfig.endWork eq 6?"星期六":"星期日"}
									</c:otherwise>
								</c:choose>
	                           <input type="hidden" name="startWork" value="${netConfig.startWork}">
	                           <input type="hidden" name="endWork" value="${netConfig.endWork}">  
	                           <input type="hidden" name="startTime" value="${netConfig.startTime}">
	                           <input type="hidden" name="endTime" value="${netConfig.endTime}"> 
	                    </td>
	                    <td style="text-align: center;padding-left: 10px;">
	                          <a href="#" onclick="del(this);">删除</a>
	                    </td>
	                </tr>
				</c:forEach>
                <tr>
                    <td  style="text-align: center;padding-right: 10px;">日期段</td>
                    <td style="text-align: center;padding-left: 10px;">
                       <select id="startWeek" onchange="checkWeek();">
		                    <option value="1">星期一</option>
		                    <option value="2" >星期二</option>
		                    <option value="3" >星期三</option>
		                    <option value="4" >星期四</option>
		                    <option value="5" >星期五</option>
		                    <option value="6" >星期六</option>
		                    <option value="7" >星期日</option>
                       </select>  
                       ----
                      <select id="endWeek" onchange="checkWeek();">
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
                                                                                                      时间段：<input type="text" id="startTime" onblur="checkTime();">----<input type="text" id="endTime" onblur="checkTime();"><input id="addConfig" type="button" class="button" value="增加">
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td style="text-align: center;padding-left: 10px;" colspan="3">
                            <span id="error" style="color:red;"></span>
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
             
             $("#startTime").blur(function(){
                if($(this)){
                }
             });
	         $addConfig = $("#addConfig").click(function(){
	            if(!checkWeek() || !checkTime()){
	              return null;
	            }
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
	              $("#error").html("* 日期段起始错误.");
	              return null;
	            }else if(sval==eval){
	               text=stext;
	            }else{
	                text=stext+"&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;"+etext;
	            }
	            var st = $("#startTime").val();
	            var et = $("#endTime").val();
	            var $before = $(this).parent().parent("tr");
	            var index = $("#addConfigTable").find("tr[class='a']").size();
	            index = index + 1;
	       	    $("#startTime").val("");
	       	    $("#endTime").val("");
	       	    var temp = "<tr class=\"a\"><td style=\"text-align: center;padding-right: 10px;\">"+index+"</td><td style=\"text-align: center;padding-left: 10px;\">"+text+"<input name=\"startWork\" type=\"hidden\" value=\""+sval+"\"><input name=\"endWork\" type=\"hidden\" value=\""+eval+"\"><input name=\"startTime\" type=\"hidden\" value=\""+st+"\"><input name=\"endTime\" type=\"hidden\" value=\""+et+"\"></td><td style=\"text-align: center;padding-left: 10px;\"><a href=\"#\" onclick=\"del(this);\">删除</a></td></td></tr>";
	            var $temp = $(temp);
	            $before.before($temp);
	         });
    });
    
    function del(myself){
       $(myself).parent().parent("tr").remove();
    }
    
    function checkWeek(){
        var $startWeek = $("#startWeek");
        var $endWeek = $("#endWeek");
        var soption = $startWeek.find("option:selected");
        var eoption = $endWeek.find("option:selected");  
        var sval = soption.val();
        var eval = eoption.val();
        if(sval>eval){
            $("#error").html("* 日期段起始错误.");
            return false;
        }else{
            $("#error").html("");
            return true;
        }
    }
    
    function checkTime(){
        var $startTime = $("#startTime");
        var $endTime = $("#endTime");
        var startVal  =  $startTime.val();
        var endVal  =  $endTime.val();
        if("" == startVal || "" == endVal){
           $("#error").html("* 起始时间不能为空.");
           return false;
        }else{
           $("#error").html("");
        }
        if(/^((1|0?)[0-9]|2[0-3])([0-5][0-9])$/.test(startVal)){
           $("#error").html("");
        }else{
           $("#error").html("* 时间格式错误.");
           return false;
        }
                if(/^((1|0?)[0-9]|2[0-3])([0-5][0-9])$/.test(endVal)){
           $("#error").html("");
        }else{
           $("#error").html("* 时间格式错误.");
           return false;
        }
        if(startVal>endVal){
           $("#error").html("* 起始时间错误。");
           return false;
        }else{
          $("#error").html("");
          return true;
        }
    }
    
    function vl(){
       return false;
    }
       
</script>
</html>
