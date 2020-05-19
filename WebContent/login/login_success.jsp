<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" type="text/css" href="../css/users_login_success.css">
<title>后台管理</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div id="logo"></div>
			<div id="title">后&nbsp;&nbsp;台&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;系&nbsp;&nbsp;统</div>

			<div id="user_info">
				<div id="welcome">欢迎${sessionScope.loginUserName}(${sessionScope.loginUserAccount})使用本系统</div>
				<div id="logout">
					<a href="<%=path%>/login/Login_logout.action"
						onclick="javascript: return confirm('是否要回到登录界面？');">安全退出</a>
				</div>
			</div>
		</div>
		<div id="navigator">
			<iframe src="../tree.jsp"></iframe>
		</div>
		<div id="main">
			<iframe name="MainFrame" src="login_welcome.jsp"></iframe>
		</div>
		<div id="footer">高&nbsp;校&nbsp;固&nbsp;定&nbsp;资&nbsp;产&nbsp;管&nbsp;理&nbsp;系&nbsp;统</div>
	</div>
</body>
<script type="text/javascript">
	function screenAdapter() {
		document.getElementById('footer').style.top = document.documentElement.scrollTop
				+ document.documentElement.clientHeight
				- document.getElementById('footer').offsetHeight + "px";
		document.getElementById('navigator').style.height = document.documentElement.clientHeight
				- 100 + "px";
		document.getElementById('main').style.height = document.documentElement.clientHeight
				- 100 + "px";
	}

	window.onscroll = function() {
		screenAdapter();
	};
	window.onresize = function() {
		screenAdapter();
	};
	window.onload = function() {
		screenAdapter();
	};
</script>
</html>