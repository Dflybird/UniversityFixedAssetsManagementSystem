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
			<span><img src="../images/arror.gif" width="7" height="11"border="0" alt=""></span>&nbsp;仓库管理&nbsp; 
				<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="<%=path%>/items/Items_queryAll.action">资产列表</a>&nbsp;	
		</div>
	</div>
	<div id="tips">
		<div id="buttonGroup">
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'">
				<a href="<%=path%>/forms/forms_add.jsp">添加资产信息</a>
			</div>
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'">
				<a href="<%=path%>/items/Items_queryAll.action">查找资产信息</a>
			</div>
		</div>
	</div>
	<div id="mainContainer">
		<!-- 从session中获取表单集合 -->
		<table class="default" width="100%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
			<col width="10%">
			<col width="5%">
			<col width="8%">
			<col width="8%">
			<col width="19%">
			<col width="10%">
			<tr class="title">
				<td>表单号</td>
				<td>资产编号</td>
				<td>物品名</td>
				<td>规格</td>
				<td>数量</td>
				<td>单价</td>
				<td>总价</td>
				<td>备注</td>
				<td>操作</td>
			</tr>

			<!-- 遍历开始 -->
			<s:iterator value="#session.items_list" var="item">
				<tr class="list">
					<td><s:property value="#item.formId" /></td>
					<td><s:property value="#item.itemId" /></td>
					<td><s:property value="#item.itemName" /></td>
					<td><s:property value="#item.specification" /></td>
					<td><s:property value="#item.num" /></td>
					<td><s:property value="#item.price" /></td>
					<td><s:property value="#item.amount" /></td>
					<td><s:property value="#item.remark" /></td>
					<td>
						<a href="<%=path%>/items/Items_modify.action?itemId=<s:property value="#item.itemId"/>">&nbsp;修改&nbsp;</a>
						<a href="<%=path%>/items/Items_delete.action?itemId=<s:property value="#item.itemId"/>"
						onclick="javascript: return confirm('真的要删除吗？');">&nbsp;删除&nbsp;</a>
					</td>
				</tr>
			</s:iterator>
			<!-- 遍历结束 -->
		</table>
	</div>
</body>
</html>