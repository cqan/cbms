<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理系统</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<body>
    <form id="inputForm" action="${ctx}feePolicy/index.html" method="post">
    		<input type="hidden" name="page" id="page" value="${param['page']}">
     	<input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
   		 策略名称：<input name="search_LIKES_name" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_name']}">
      	 策略类型：<select class="easyui-combobox"  data-options="panelHeight:'auto'" name="search_EQI_strategyType">
                 <option value="">全部</option>
                 <option value="1" ${param['search_EQI_strategyType'] eq 1?"selected":""}>计时</option>
                 <option value="2" ${param['search_EQI_strategyType'] eq 2?"selected":""}>包时长</option>
                 <option value="3" ${param['search_EQI_strategyType'] eq 3?"selected":""}>包天无上限</option>
                 <option value="4" ${param['search_EQI_strategyType'] eq 4?"selected":""}>包天有时长上限</option>
                 <option value="5" ${param['search_EQI_strategyType'] eq 5?"selected":""}>包天有流量上限</option>
                 <option value="6" ${param['search_EQI_strategyType'] eq 6?"selected":""}>包月无上限</option>
                 <option value="7" ${param['search_EQI_strategyType'] eq 7?"selected":""}>包月有时长上限</option>
                 <option value="8" ${param['search_EQI_strategyType'] eq 8?"selected":""}>包月有流量上限</option>
                 <option value="9" ${param['search_EQI_strategyType'] eq 9?"selected":""}>计流量</option>
          </select>
      	 适用地区：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQS_area">
                 <option value="">全省</option>
                 <option value="1" ${param['search_EQS_area'] eq 1?"selected":""}>北京</option>
          </select>
        	 学校：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_school.id">
                 <option value="">全部</option>
                 <c:forEach items="${schools}" var="school">
                     <option value="${school.id}" ${param['search_EQI_school.id'] eq school.id?"selected":""}>${school.name}</option>
                 </c:forEach>
          </select>
        	 学生是否可见：<select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_stuVisible">
                 <option value="">全部</option>
                 <option value="1">是</option>
                 <option value="2">否</option>
          </select>
    </form>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <shiro:hasPermission name="fee.policy.add">
        	<a href="${ctx}feePolicy/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px;margin-bottom:5px;">添加</a>
        </shiro:hasPermission>
        <thead>
        <tr>
            <th field="name1" width="6%">计费策略名</th>
            <th field="name2" width="6%">地区</th>
            <th field="name3" width="6%">适用学校</th>
            <th field="name4" width="8%">计费政策类型</th>
            <th field="name5" width="6%">费率（元）</th>
            
            
            
            
            <th field="name11" width="6%">创建人</th>
            <th field="name12" width="8%">学生是否可见（Y：是 N：否）</th>
           
           
            
            
            <th field="name14" width="10%">套餐解释</th>
            <th field="name15" width="4%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.name}</td>
                <td>${entity.area eq 2?'二区':entity.area eq 3?'三区':entity.area eq 4?'四区':entity.area eq 5?'五区':entity.area eq 7?'七区':entity.area eq 8?'八区':entity.area eq 9?'昌平':entity.area eq 10?'房山':entity.area eq 11?'密云':''}</td>
                <td>${entity.school.id eq null?"全部学校":entity.school.name}</td>
                <td>${entity.strategyType eq 1?'包月无上限':''}</td>
                <td>${entity.price}</td>



                <td>${entity.creator}</td>
                <td>${entity.stuVisible eq ""?"全部":(entity.stuVisible eq 1?"是":"否")}</td>




                <td>${entity.description}</td>
                <td>
                   <shiro:hasPermission name="fee.policy.modify">
                       <a href="${ctx}feePolicy/edit.html?id=${entity.id}">修改</a>&nbsp;
                   </shiro:hasPermission>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%">
        <div id="pagination" class="easyui-pagination" data-options="
					total: ${page.totalElements},
					pageSize:${page.size},
					pageNumber:${page.number+1},
					showPageList: true,
					pageList:[10,20,30],
					showRefresh: false,
					onSelectPage:selectPage,
					beforePageText:'第',
					afterPageText:'页，共{pages}页',
					displayMsg: '显示{from} - {to} 条数据，共{total}条'"></div>
    </div>
  </body>
  <script type="text/javascript">   
	    $(function(){
	    	var msg = "${msg}";
	    	if(msg!=''){
	    		show("",msg);
		    }
	    });
	</script>
</html>
