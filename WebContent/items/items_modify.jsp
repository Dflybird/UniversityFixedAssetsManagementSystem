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
<script type="text/javascript" src="../js/Calendar.js"></script>
<div id="navi">
	<div id='naviDiv'>
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;仓库管理&nbsp;
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
		<a href="<%=path%>/forms/Forms_queryAll.action">资产列表</a>&nbsp;
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
		<a href="<%=path%>/items/Items_modify.action?itemId=<s:property value="#session.modify_item.itemId"/>">修改资产信息</a>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<strong>修改表单信息</strong>
<br>
<br>
<form name="addForm" action="<%=path%>/items/Items_update.action" method="post">
<table width="100%" align="center" >
<tr>
    <td width="45%" align="right">表单编号：</td>
    <td align="left"><input type="text" style="text-align:right " name="formId" readonly="readonly" value="<s:property value="#session.modify_item.formId"/>"/></td>
  </tr>
 <tr>
    <td width="45%" align="right">物品编号：</td>
    <td align="left"><input type="text" style="text-align:right " name="itemId" readonly="readonly" value="<s:property value="#session.modify_item.itemId"/>"/></td>
  </tr>
  <tr>
    <td align="right">物品名：</td>
    <td align="left"><input type="text" style="text-align:right " name="itemName" value="<s:property value="#session.modify_item.itemName"/>" /></td>
  </tr>
  <tr>
    <td align="right">规格：</td>
    <td align="left"><input type="text" style="text-align:right " name="specification" value="<s:property value="#session.modify_item.specification"/>" /></td>
  </tr>
  <tr>
    <td align="right">数量：</td>
    <td align="left"><input type="text" style="text-align:right " name="num"  value="<s:property value="#session.modify_item.num"/>"/></td>
  </tr>
  <tr>
    <td align="right">单价：</td>
    <td align="left"><input type="text" style="text-align:right " name="price" value="<s:property value="#session.modify_item.price"/>"/></td>
  </tr>
  <tr>
    <td align="right">备注：</td>
    <td align="left"><input type="text" style="text-align:right " name="remark"  value="<s:property value="#session.modify_item.remark"/>"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input class="button" type="submit" value="确认">
    <input class="button" type="button" value="返回" onclick="window.location='<%=path%>/items/Items_queryAll.action'"></td>
  </tr>
</table>
</form>


</div>
</body>
</html>