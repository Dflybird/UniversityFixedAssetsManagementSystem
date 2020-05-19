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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../css/users_login_welcome.css">
<link rel="stylesheet" type="text/css" href="../css/default.css">
<title>Insert title here</title>
</head>
<body>

<div id="navi">
<div id='naviDiv'>
	<span><img src="../images/arror.gif" width="7" height="11"border="0" alt=""></span>&nbsp;仓库管理&nbsp;
</div>
</div>
<div id="bg">
<img src="../images/welcome.jpg">
<div id="tips">
</div>
<div id="mainContainer">
   <!--数据表格空白 -->
</div>
</div>
</body>
</html>