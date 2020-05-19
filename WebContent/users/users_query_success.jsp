<%@page import="java.nio.channels.SeekableByteChannel"%>
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
<link rel="stylesheet" type="text/css" href="../css/forms_query_success.css">

<title>Insert title here</title>
</head>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="../images/arror.gif" width="7" height="11"border="0" alt=""></span>&nbsp;用户管理&nbsp; 
				<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
				<a href="<%=path%>/users/Users_queryAll.action">用户列表</a>&nbsp;	
		</div>
	</div>
	<div id="tips">
		<div id="buttonGroup">
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'">
				<s:if test="#session.loginUserIsAdmin == 1">
				<a href="<%=path%>/users/users_add.jsp">添加用户</a>
				</s:if>
				<s:else>
				<a href="" onclick="javascript: return alert('不是管理员');">添加用户</a>
				</s:else>
			</div>
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'">
				<a href="<%=path%>/users/Users_queryAll.action">查找用户</a>
			</div>
		</div>
	</div>
	<div id="mainContainer">
		<!-- 从session中获取表单集合 -->
		<table class="default" width="100%">
			<col width="20%">
			<col width="25%">
			<col width="15%">
			<col width="40%">
			<tr class="title">
				<td>用户名</td>
				<td>账户</td>
				<td>管理员</td>
				<td>操作</td>
			</tr>

			<!-- 遍历开始 -->
			<s:iterator value="#session.users_list" var="user">
				<tr class="list">
					<td><s:property value="#user.name" /></td>
					<td><s:property value="#user.account" /></td>
					<td>
					<s:if test="#user.Admin">是</s:if>
					<s:else>否</s:else></td>
					<td>
					<s:if test="#user.account == #session.loginUserAccount">
					<a href="<%=path%>/users/Users_modify.action?id=<s:property value="#user.id"/>">&nbsp;修改&nbsp;</a>
					</s:if>
					<s:if test="#session.loginUserIsAdmin == 1">
						<s:if test="#user.id != 1">
						<a href="<%=path%>/users/Users_delete.action?id=<s:property value="#user.id"/>"
						onclick="javascript: return confirm('真的要删除吗？');">&nbsp;删除&nbsp;</a>
						</s:if>
					</s:if>
					</td>
				</tr>
			</s:iterator>
			<!-- 遍历结束 -->
		</table>
	</div>
</body>
</html>