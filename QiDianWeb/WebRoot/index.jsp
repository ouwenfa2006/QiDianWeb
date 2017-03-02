<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/plugins/jsp/base1.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
<style type="text/css">
.container-fluid {
	width: 100%;
	padding: 0px;
}

.container-fluid div {
	padding: 0px;
}

#menus>button {
	padding-left: 2.8%;
	padding-right: 2.8%;
}

a[role='qq']:HOVER {
	color: red;
}
</style>
</head>
<jsp:include page="plugins/jsp/base3.jsp"></jsp:include>
<body style="overflow: visible;/* width:1400px; */">
	<div class="container-fluid" style="width:1007px;">
		
		<jsp:include page="plugins/jsp/index_1.jsp"></jsp:include>
		<iframe width="100%" src="${basePath }plugins/jsp/iframe_init.jsp"
			id="mainIframe" name="mainIframe" frameborder="0" scrolling="no"
			style="height: 1600px;overflow:hidden;"></iframe>
		<!-- 左侧固定模板 -->
		<jsp:include page="plugins/jsp/index_5.jsp"></jsp:include>

		<!-- 弹窗 -->
		<div id="upload_div"
			style="position: fixed;z-index: 999;background-color: white;display: none;">
			<div style="width:380px;height: 269px;border: 3px solid #31B0D5;">
				<form action="${basePath }uploadFileAndDownController/uploadFile"
					method="post" enctype="multipart/form-data" target="uploadIframe">
					<div
						style="width: 100%;background-color: #31B0D5;color: white;line-height: 25px;">
						&nbsp;文件上传
						<div style="float:right;margin-right: 1%;cursor: pointer;"
							id="close_upload_btn">关闭</div>
					</div>
					<div id="fileContent" style="width: 100%;">
						<div style="margin-top:15px;">
							<div style="margin-left:8.5%;float:left">
								<label>年级:&nbsp;</label> <select name="grade">
									<option value="小学">小学</option>
									<option value="初一">初一</option>
									<option value="初二">初二</option>
									<option value="初三">初三</option>
									<option value="高一">高一</option>
									<option value="高二">高二</option>
									<option value="高三">高三</option>
								</select>

							</div>
							<div style="margin-left:9%;float:left">
								<label>科目:&nbsp;</label> <select name="courseName">
									<option value="语文">语文</option>
									<option value="数学">数学</option>
									<option value="英语">英语</option>
								</select>
							</div>
						</div>
					</div>
					<br>
					<div style="width:100%;margin-top: 15px; ">
						<input type="file" style="display: none;" name="file" id="file">
						<div>
							<label style="float: left;margin-left: 1%;">文件名称:</label><input
								type="text"
								style="width: 247px;float: left;margin-left: 1%;border: 1px solid #ccc;"
								disabled="disabled">
						</div>
						<button class="btn btn-sm btn-info" type="button"
							style="float: right;margin-right: 2%;line-height:1;">上传</button>
					</div>
					<div style="width:100%;margin-top: 35px; ">
						<label class="control-label" style="float: left;margin-left: 1%;">上传进度:</label>
						<div class="controls">
							<div class="progress progress-success progress-striped"
								style="width:65.5%;margin-left:1%;float:left;">
								<div id="proBar" class="bar"
									style="width: 0%;background-color: #62C462;height: 100%;"></div>
							</div>
						</div>
					</div>
				</form>
				<iframe id="uploadIframe" name="uploadIframe" style="displasy:none;"
					frameborder="0" height="0"></iframe>
			</div>
		</div>
		<div class="col-md-12" style="height:100px;"></div>
	</div>
	<!-- 遮盖层 -->
	<div class="bg-primary pull-left" id="top_bg_div"
		style="width:100%;height:100%;position:fixed;top:0px;z-index:98;background-color:black;opacity:0.5;display: none;"></div>
	<!-- 菜单底层 -->
	<div class="bg-primary pull-left" id="bg_div"
		style="height:34px;position:absolute;top:95px;z-index:-1;"></div>
	<!-- 新信息提示 -->
	<div id="message" style="position:fixed;z-index: 9999;background-color: white;border:3px solid #31B0D5;">
		<div style="width:300px;height: 186px;">
			<div id="message_title" role="title"
				style="width: 100%;background-color: #31B0D5;color: white;line-height: 25px;">
				&nbsp;新信息提醒
				<div style="float:right;margin-right: 1%;cursor: pointer;"
					id="close_btn">关闭</div>
			</div>
			<div id="messageContent" style="width: 100%;overflow:auto;height:181.4px;">
			</div>
		</div>
	</div>
	<!-- javaScript -->
	<script type="text/javascript" src="plugins/js/index.js"></script>
	<script type="text/javascript">
		$(function(){
			
		});
	
	</script>
</body>
</html>
