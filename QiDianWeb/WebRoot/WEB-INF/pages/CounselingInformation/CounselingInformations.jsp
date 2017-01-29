<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <jsp:include page="/plugins/jsp/base1.jsp"></jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${basePath }bootstrap-3.3.5-dist/js/jquery-2.2.2.js"></script>
<link rel="stylesheet"
	href="${basePath }plugins/other/zTree_v3-master/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath }plugins/other/zTree_v3-master/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${basePath }plugins/other/zTree_v3-master/js/jquery.ztree.core.js"></script>
<style type="text/css">
.search {
	width: 168px;
	margin-left:10px;
	padding: 6px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	font-family: inherit;
}
.search:FOCUS{
	border-color: #31B0D5;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #31B0D5;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #31B0D5;
}
.btn{
display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}
.btn-sm{
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
  border-radius: 3px;
}
.btn-info {
  color: #fff;
  background-color: #5bc0de;
  border-color: #46b8da;
}
.btn-info:focus,
.btn-info.focus {
  color: #fff;
  background-color: #31b0d5;
  border-color: #1b6d85;
}
.btn-info:hover {
  color: #fff;
  background-color: #31b0d5;
  border-color: #269abc;
}
</style>
</head>

<body>
	<div class="content_wrap">
		<div class="zTreeDemoBackground left" style="width:183px;">
			<ul id="tree" class="ztree" style="height:1576px;width:144px;"></ul>
		</div>
		<div class="right">
			<div style="margin-top:9px;margin-left:-76px;">
				<button class="btn btn-sm btn-info" type="button" style="float:left;" id="upload_btn">上传文件</button>
				<input id="search" type="text" class="search" style="float:left;margin-top:1px;">
				<button id="search_btn" class="btn btn-sm btn-info" style="float:left;margin-left:8px;" type="button">搜索</button>
			</div>
			<iframe id="rightIframe" name="rightIframe" scrolling="no"
				frameborder="0"
				style="width: 807px;height: 1600px;margin-left: -76px;margin-top: 9px;float: left;" src="${basePath }/systemController/getAllLeanrningMaterials"></iframe>
		</div>
	</div>
	<script type="text/javascript">
		var session_user="${session_user}";
	</script>
	<script type="text/javascript" src="../plugins/js/CounselingInformations.js"></script>
</body>
</html>
