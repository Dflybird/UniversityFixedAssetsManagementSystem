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
<% String formId = request.getParameter("formId");%>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;仓库管理&nbsp;
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
		<a href="<%=path%>/forms/Forms_queryAll.action">资产列表</a>&nbsp;
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
		<a href="<%=path%>/items/items_add.jsp?formId=<%=formId %>">添加资产信息</a>&nbsp;
		</div>
	</div>
	<div id="tips">
	</div>
	<div id="mainContainer">
		<strong>未知错误，资产添加失败。</strong>
   		<!--数据表格空白 -->
   		<div class="button" style="margin: 100px auto;">
			<a href="<%=path%>/items/Items_queryAll.action">返回</a>
		</div>

	</div>
</body>
</html>