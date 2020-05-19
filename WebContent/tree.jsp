<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">

<title>导航栏</title>
<style type="text/css">
@import url('components/dtree/dtree.css');
</style>
<style>
* {
	background: none repeat scroll 0 0 transparent;
	border: 0 none;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	font-family: 微软雅黑;
	overflow: hidden;
}

#menuControll {
	width: 100%;
	position: relative;
	word-wrap: break-word;
	border-bottom: 1px solid #065FB9;
	margin: 0;
	padding: 0 10px;
	font-size: 14px;
	height: 40px;
	line-height: 40px;
	vertical-align: middle;
	background-image: -moz-linear-gradient(top, #EBEBEB, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}
</style>
<script type="text/javascript">
	var dtreeIconBasePath = "components/dtree";
</script>
<script type="text/javascript" src="components/dtree/dtree.js"></script>
</head>
<body>
	<script type="text/javascript">
		var treeMenu = [ {
			level : 1,
			name : "表单管理"
		}, {
			level : 2,
			name : "表单列表",
			ico : "images/icon_default.gif",
			link : "forms/Forms_queryAll.action"
		}, {
			level : 1,
			name : "资产管理"
		}, {
			level : 2,
			name : "资产列表",
			ico : "images/icon_default.gif",
			link : "items/Items_queryAll.action"
		}, {
			level : 1,
			name : "账号管理"
		}, {
			level : 2,
			name : "用户列表",
			ico : "images/icon_default.gif",
			link : "users/Users_queryAll.action"
		} ];
	</script>
	
	<div id="menuControll">
		导航栏:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			[<a href="#" onclick="tree.openAll();this.blur();return false;"
			style="color: #333333; text-decoration: none">展开  </a>
			<a href="#"onclick="tree.closeAll();this.blur();return false;"
			style="color: #333333; text-decoration: none">  收起</a>]
	</div>
	<div class="dtree" style="margin: 10px;">
		<script type="text/javascript">
			//建立新树
			tree = new dTree('tree');
			tree.config.target = "MainFrame";
			tree.config.useCookies = false;
			var selNum = -1;
			var link = "";
			//根目录
			tree.add(0, -1, '管理中心', null, null, null, '', '');
			var count = 0;
			var pLevelIdArray = new Array();
			pLevelIdArray[1] = 0;
			var currLevel = 1;
			for (var i = 0; i < treeMenu.length; i++) {
				var item = treeMenu[i];
				var itemLevel = item.level;
				pLevelIdArray[itemLevel + 1] = ++count;
				if (item.link != null && item.link != "") {
					if (item.ico != null) {
						tree.add(count, pLevelIdArray[itemLevel], item.name,
								item.link, null, null, item.ico, item.ico);
					} else {
						tree.add(count, pLevelIdArray[itemLevel], item.name,
								item.link);
					}
				} else {
					if (item.ico != null) {
						tree.add(count, pLevelIdArray[itemLevel], item.name,
								null, null, null, item.ico, item.ico);
					} else {
						tree.add(count, pLevelIdArray[itemLevel], item.name);
					}
				}
				if (item.select) {
					selNum = count;
					link = item.link;
				}
			}
			document.write(tree);
			tree.openAll();
			if (selNum != -1) {
				tree.openTo(selNum, true);
				top.document.frames["MainFrame"].location.href = link;
			}
		</script>
	</div>
</body>
</html>