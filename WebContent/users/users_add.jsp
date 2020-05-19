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
<link rel="stylesheet" type="text/css" href="../css/add.css">
<script type="text/javascript">
function judg()
{
	var password=document.getElementById("password").value
	//取出第一个文本框里输如的值密码一
	var pConfirm=document.getElementById("pConfirm").value
	//取出第二个文本框里输如的值密码二
	if(password == pConfirm)
	{
		document.getElementById("password").focus()
		return true;
	} else
	{
		alert("确认密码错误，请重新输入。")
		document.getElementById("password").focus()
		return false;
	}
}	
}
</script>

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
		<strong>添加用户信息</strong>
			<br/>
			<br/>
			<form name="addUser" action="<%=path%>/users/Users_insert.action" onsubmit="return judg();" method="post">
			<table width="100%" align="center" >
			  <tr>
			    <td align="right">用户名：</td>
			    <td align="left"><input name="name" style="text-align:right " type="text" />
			    </td>
			  </tr>
			  <tr>
			    <td width="45%" align="right">账号：</td>
			    <td align="left"><input type="text" style="text-align:right " name="account" /></td>
			  </tr>
			  <tr>
			    <td align="right">密码：</td>
			    <td align="left"><input id="password" type="password" style="text-align:right " name="password" /></td>
			  </tr>
			  <tr>
			    <td align="right">确认密码：</td>
			    <td align="left"><input id="pConfirm" type="password" style="text-align:right " name="pConfirm" /></td>
			  </tr>
			  <tr>
			    <td align="right">管理员：</td>
			    <td align="left">
			    	<input type="radio" style="text-align:right " name="isAdmin" value="true"/>是
			    	<input type="radio" style="text-align:right " name="isAdmin" value="false"/>否
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" align="center"><input class="button" type="submit" value="添加" >
			    <input class="button" type="button" value="返回" onclick="window.location='<%=path%>/users/Users_queryAll.action'"></td>
			  </tr>
			</table>
			</form>

	</div>
</body>
</html>