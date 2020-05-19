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
function judg(op)
{
	var oldPassword=document.getElementById("oldPassword").value
	var password=document.getElementById("password").value
	var pConfirm=document.getElementById("pConfirm").value
	if(oldPassword == op){
		if(password == pConfirm){
			alert("修改成功，返回登录界面。")
			document.getElementById("password").focus()
			return true;
		} else{
			alert("确认密码错误，请重新输入。")
			document.getElementById("password").focus()
			return false;
		}
	}else {
		alert("旧密码输入错误，请重新输入。")
		return false;
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
			<a href="<%=path%>/users/Users_modify.jsp">修改用户</a>&nbsp;	
		</div>
	</div>
	<div id="tips">
	</div>
	<div id="mainContainer">
		<strong>修改用户信息</strong>
			<br/>
			<br/>
			<form name="addUser" target="_parent" action="<%=path%>/users/Users_update.action" onsubmit="return judg(<s:property value="#session.modify_user.password"/>);" method="post">
			<table width="100%" align="center" >
			   <tr>
			    <td><input name="id" type="hidden" value="<s:property value="#session.modify_user.id"/>"/>
			    <td><input name="isAdmin" type="hidden" value="<s:property value="#session.modify_user.Admin"/>"/></td>
			    </td>
			  </tr>
			  <tr>
			    <td align="right">用户名：</td>
			    <td align="left"><input name="name" style="text-align:right " type="text" value="<s:property value="#session.modify_user.name"/>"/>
			    </td>
			  </tr>
			  <tr>
			    <td width="45%" align="right">账号：</td>
			    <td align="left"><input type="text" style="text-align:right " name="account" value="<s:property value="#session.modify_user.account"/>"/></td>
			  </tr>
			   <tr>
			    <td align="right">旧密码：</td>
			    <td align="left"><input id="oldPassword" type="password" style="text-align:right " name="oldPassword" /></td>
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
			    <s:if test="#session.modify_user.Admin">
			    	<input type="radio" style="text-align:right " checked="checked" disabled="disabled"/>是
			    	<input type="radio" style="text-align:right " disabled="disabled"/>否
			    </s:if>
			    <s:else>
			    	<input type="radio" style="text-align:right " disabled="disabled"/>是
				    <input type="radio" style="text-align:right " checked="checked" disabled="disabled"/>否
			    </s:else>
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