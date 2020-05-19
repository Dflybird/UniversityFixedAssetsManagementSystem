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

</head>
<body style="text-align: center;margin-top: 10%;">
<%-- <img alt="找不到网页" src="<%=path %>/images/404.png" width="20%" height="20%"> --%>
	<div>
		请先<a href="<%=path%>/login/login.jsp">登录</a>。
	</div>

</body>
</html>