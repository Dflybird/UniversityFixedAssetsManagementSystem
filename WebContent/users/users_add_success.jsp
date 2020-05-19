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
<link rel="stylesheet" type="text/css" href="../css/default.css">
<link rel="stylesheet" type="text/css" href="../css/add.css">

<title>Insert title here</title>
</head>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="../images/arror.gif" width="7" height="11"border="0" alt=""></span>&nbsp;用户管理&nbsp; 
			<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
			<a href="<%=path%>/users/Users_queryAll.action">用户列表</a>&nbsp;	
			<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
			<a href="<%=path%>/users/Users_add.jsp">添加用户</a>&nbsp;	
		</div>
	</div>
	<div id="tips">
	</div>
	<div id="mainContainer">
		<strong>用户添加成功。</strong>
   		<!--数据表格空白 -->
   		<div class="button" style="margin: 100px auto;">
			<a href="<%=path%>/users/Users_queryAll.action">返回</a>
		</div>

	</div>
</body>
</html>