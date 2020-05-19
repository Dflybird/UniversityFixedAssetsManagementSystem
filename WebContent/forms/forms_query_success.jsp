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
				<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;
				<a href="<%=path%>/forms/Forms_queryAll.action">表单列表</a>&nbsp;	
		</div>
	</div>
	<div id="tips">
		<div id="buttonGroup">
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'">
				<a href="<%=path%>/forms/forms_add.jsp">添加表单</a>
			</div>
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'">
				<a href="<%=path%>/forms/Forms_queryAll.action">查找表单</a>
			</div>
		</div>
	</div>
	<div id="mainContainer">
		<!-- 从session中获取表单集合 -->
		<table class="default" width="100%">
			<col width="20%">
			<col width="25%">
			<col width="15%">
			<col width="30%">
			<col width="10%">
			<tr class="title">
				<td>表单号</td>
				<td>入库时间</td>
				<td>办理人</td>
				<td>备注</td>
				<td>操作</td>
			</tr>

			<!-- 遍历开始 -->
			<s:iterator value="#session.forms_list" var="form">
				<tr class="list">
					<td><s:property value="#form.formId" /></td>
					<td><s:date name="#form.warehouseEntryTime" format="yyyy-MM-dd" /></td>
					<td><s:property value="#form.transactorName" /></td>
					<td><s:property value="#form.remark" /></td>
					<td>
						<a href="<%=path%>/forms/Forms_modify.action?formId=<s:property value="#form.formId"/>">&nbsp;修改&nbsp;</a>
						<a href="<%=path%>/forms/Forms_delete.action?formId=<s:property value="#form.formId"/>"
						onclick="javascript: return confirm('真的要删除吗？');">&nbsp;删除&nbsp;</a>
					</td>
				</tr>
			</s:iterator>
			<!-- 遍历结束 -->
		</table>
	</div>
</body>
</html>