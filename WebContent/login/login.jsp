<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../css/users_login.css" rel="stylesheet" type="text/css" media="all">

<title>Insert title here</title>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="logo"></div>
			<div id="headingBg">
				<div id="heading">
					<div id="title">高校固定资产管理系统</div>
					<div id="subTitle">Ver 1.0</div>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="mainBg">
				<div id="mainPanel">
					<div id="left">
						<div id="image"></div>
					</div>
					<div id="right">

						<form name="loginForm" action="<%=path%>/login/Login_login.action"
							method="post">
							<!-- start of login form -->
							<div id="welcome">
								<span id="welcome-text">管&nbsp;理&nbsp;登&nbsp;录</span>
							</div>
							<div id="user-name">
								<span class="item">账&nbsp;&nbsp;&nbsp;号:</span>
								<!-- 改账户 -->
								<span><input type="text" name="account"
									class="form-input"></span>
							</div>
							<div id="user-password">
								<span class="item">密&nbsp;&nbsp;&nbsp;码:</span> <span
									class="input"><input type="password" name="password"
									class="form-input"></span>
							</div>
							<div id="button-group">
								<input type="submit" class="btn" value="登录" /> 
								<input type="reset" class="res" value="重置" />
							</div>
							<div>
								<s:fielderror />
								<!-- 显示表单验证的出错信息 -->
							</div>
							<!-- end of form -->
						</form>

					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<div id="text">Copyright © 2017-2020 All Rights Reserved
				Powered By Dflybird</div>
		</div>
	</div>
</body>
</html>