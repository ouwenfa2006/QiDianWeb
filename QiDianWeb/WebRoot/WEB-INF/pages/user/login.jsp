<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="/plugins/jsp/base1.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="${basePath }plugins/other/assets/css/reset.css">
<link rel="stylesheet" href="${basePath }plugins/other/assets/css/supersized.css">
<link rel="stylesheet" href="${basePath }plugins/other/assets/css/style.css">
</head>
<jsp:include page="/plugins/jsp/base3.jsp"></jsp:include>
<body>
	<div class="page-container">
            <h1>佛山市启点教育</h1>
            <form action="${basePath }loginController/login" method="post">
                <input type="text" name="user.userName" class="username" placeholder="用户名">
                <input type="password" name="user.password" class="password" placeholder="密码">
                <button type="submit" style="width: 270px;">登陆</button>
                <div class="error"><span>+</span></div>
           		 <div style="padding-left: 14%;padding-right: 14%;margin-top: 6%;">
        		<span class="pull-left">忘记密码？</span>
        		<span class="pull-left"><a href="javaScript:alert('正在开发中，请联系管理员!')" title="首页">验证问题找回密码</a></span>  	
        </div>
            </form>  
        </div>
        <br><br>
       

        <!-- Javascript -->
        <script src="${basePath }plugins/other/assets/js/supersized.3.2.7.min.js"></script>
        <script src="${basePath }/plugins/other/assets/js/supersized-init.js"></script>
        <script src="${basePath }plugins/other/assets/js/scripts.js"></script>
</body>
</html>
