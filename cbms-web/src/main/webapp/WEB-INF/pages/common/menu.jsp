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
                            <span><a link="${ctx}user/index.html">用户管理</a></span>
                        </li>
                   </shiro:hasPermission>
                    <shiro:hasPermission name="system.role">
                        <li>
                            <span><a link="${ctx}role/index.html">角色管理</a></span>
                        </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="system.permission">
                        <li>
                            <span><a link="${ctx}permission/index.html">权限管理</a></span>
                        </li>
                    </shiro:hasPermission>
                </ul>
            </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="school">
          <div title="学校管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
               <shiro:hasPermission name="school.reg"><li><span><a link="${ctx}school/index.html">学校注册</a></span></li></shiro:hasPermission>
               <shiro:hasPermission name="school.accountGroup"><li><span><a link="${ctx}accountGroup/index.html">学校客户组管理</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="card">
          <div title="卡管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                 <shiro:hasPermission name="card.create"><li><span><a link="${ctx}card/batch/index.html">制卡管理</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="card.manager"><li><span><a link="${ctx}card/index.html">充值卡管理</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="card">
          <div title="营业管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                 <shiro:hasPermission name="card.create"><li><span><a link="${ctx}account/create.html">开户受理</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="card.manager"><li><span><a link="${ctx}card/index.html">受理激活</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="card.manager"><li><span><a link="${ctx}account/setpwd.html">重置密码</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="card.manager"><li><span><a link="${ctx}account/modify.html">客户资料变更</a></span></li></shiro:hasPermission>
                <shiro:hasPermission name="card.manager"><li><span><a link="${ctx}card/index.html">套餐变更</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="card">
          <div title="计费管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                <shiro:hasPermission name="card.create"><li><span><a link="${ctx}feePolicy/index.html">计费套餐策略</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
    <shiro:hasPermission name="card">
          <div title="系统管理" iconCls="icon-folder" style="overflow:auto;padding:6px;">
            <ul class="easyui-tree navlist">
                <shiro:hasPermission name="card.create"><li><span><a link="${ctx}feePolicy/index.html">管理员及学校查询</a></span></li></shiro:hasPermission>
            </ul>
        </div>
    </shiro:hasPermission>
</div>