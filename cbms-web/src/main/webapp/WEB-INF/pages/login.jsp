<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>北京联通校园网运营后台管理系统</title>
  	<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	 <style type="text/css">
      	a{text-decoration:none;color:black;}
      	body{background-color:#DDD;}
  	 </style>
     <script>
          function check_f(){
              var name=document.login_f.username.value;
              var pwd=document.login_f.password.value;
              var code=document.login_f.authcode.value;
              if(!name||!pwd||!code){alert('请如入完整信息！');return false;}
                 document.login_f.submit();
          }
     </script>
  <body>
    <div style="margin:0 auto;width:800px;">
            <div id="win" class="easyui-window" minimizable="false" closable="false" maximizable="false"  collapsible="false"  title="北京联通校园网运营管理平台" style="width:300px;height:250px;">
                <form action="${ctx}login.html" method="post" style="padding:10px 20px 10px 40px;" name="login_f">
                    <p>${error}</p>
                    <p>用户名: <input class="easyui-validatebox" type="text" id="username" name="username" required="true"/></p>
                    <p>密&nbsp;&nbsp;码: <input class="easyui-validatebox"  id="pwd" type="password" name="password" required="true"></p>
                    <p>验证码: <input class="easyui-validatebox" type="text" id="authcode" name="authCode" required="true" style="width:80px;"/><img src="${ctx}authcode.html" style="top:5px;position:relative;" width="70" height="20"/></p>
                    <div style="padding:5px;text-align:center;">
                        <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="check_f()">登录</a>
                        <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="document.login_f.reset()">重置</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
  </body>
</html>
