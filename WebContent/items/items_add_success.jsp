<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../css/default.css">
<link rel="stylesheet" type="text/css" href="../css/add.css">
<title>Insert title here</title>
</head>
<body>
<% String formId = request.getParameter("formId");%>
<div id="navi">
	<!-- 导航空白 -->
	<div id='naviDiv'>
			<span><img src="../images/arror.gif" width="7" height="11"border="0" alt=""></span>&nbsp;仓库管理&nbsp; 
				<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
				<a href="<%=path%>/forms/Forms_queryAll.action">资产列表</a>&nbsp;	
				<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
				<a href="<%=path%>/items/items_add.jsp?formId=<%=formId %>">添加资产信息</a>&nbsp;
				<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;添加成功&nbsp;
		</div>
</div>
<div id="tips">
	<!-- 导航空白 -->
</div>
<div id="mainContainer">
   <strong>表单信息添加成功，<a href="<%=path%>/items/items_add.jsp?formId=<%=formId %>">继续添加资产信息</a>？</strong>
   <!--数据表格空白 -->
   <div class="button" style="margin: 100px auto;">
	<a href="<%=path%>/forms/Forms_queryAll.action">返回</a>
			</div>
</div>
</body>
</html>