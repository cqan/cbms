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
    <shiro:hasPermission name="system">
          <div title="学校管理" iconCls="icon-folder" style="padding:10px;">
            <ul class="easyui-tree">
                <li><span><a link="${ctx}school/index.html">学校注册</a></span></li>
                <li><span><a link="${ctx}group/index.html">学校客户组管理</a></span></li>
            </ul>
        </div>
    </shiro:hasPermission>
</div>