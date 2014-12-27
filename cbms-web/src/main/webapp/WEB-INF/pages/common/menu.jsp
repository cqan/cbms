<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/10/19
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div id="nav" class="easyui-accordion"  border="false">
       <shiro:hasPermission name="system">
           <div title="系统管理" iconCls="icon-light" selected="true" style="overflow:auto;padding:6px;">
                <ul class="easyui-tree navlist">
                   <shiro:hasPermission name="system.user">
                        <li>
                            <span><a link="${ctx}user/index.html?sid=<%=session.getId()%>">用户管理</a></span>
                        </li>
                   </shiro:hasPermission>
                    <shiro:hasPermission name="system.role">
                        <li>
                            <span><a link="${ctx}role/index.html?sid=<%=session.getId()%>">角色管理</a></span>
                        </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="system.permission">
                        <li>
                            <span><a link="${ctx}permission/index.html?sid=<%=session.getId()%>">权限管理</a></span>
                        </li>
                    </shiro:hasPermission>
                </ul>
            </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="school">
          <div title="学校管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
               <shiro:hasPermission name="school.reg"><li><span><a link="${ctx}school/index.html?sid=<%=session.getId()%>">学校管理</a></span></li></shiro:hasPermission>
               <shiro:hasPermission name="school.accountGroup"><li><span><a link="${ctx}accountGroup/index.html?sid=<%=session.getId()%>">学校客户组管理</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="card">
          <div title="卡管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                 <shiro:hasPermission name="card.create"><li><span><a link="${ctx}card/batch/index.html?sid=<%=session.getId()%>">制卡管理</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="card.manager"><li><span><a link="${ctx}card/index.html?sid=<%=session.getId()%>">充值卡管理</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="business">
          <div title="营业管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                <shiro:hasPermission name="business.account"><li><span><a link="${ctx}account/index.html?sid=<%=session.getId()%>">帐户信息</a></span></li></shiro:hasPermission>
                <!--<shiro:hasPermission name="business.active"><li><span><a link="${ctx}account/active.html">受理激活</a></span></li></shiro:hasPermission>-->
                <shiro:hasPermission name="business.reset"><li><span><a link="${ctx}account/setpwd.html?sid=<%=session.getId()%>">重置密码</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="business.accountchange"><li><span><a link="${ctx}account/modify.html?sid=<%=session.getId()%>">客户资料变更</a></span></li></shiro:hasPermission>
                <!--<shiro:hasPermission name="business.policychange"><li><span><a link="${ctx}account/change.html?sid=<%=session.getId()%>">套餐变更</a></span></li></shiro:hasPermission>-->
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="fee">
          <div title="计费管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                <shiro:hasPermission name="fee.policy"><li><span><a link="${ctx}feePolicy/index.html?sid=<%=session.getId()%>">计费套餐策略</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="netConfig">
          <div title="上网控制" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                <shiro:hasPermission name="netConfig.deploy"><li><span><a link="${ctx}netConfig/step1.html?sid=<%=session.getId()%>">上网时间段配置</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
</div>