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
.zixun_div_font{
	font-size: 20px;
	margin-top: 10px;
	text-align:center;
	border-radius:10px;
	
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
		<jsp:include page="plugins/jsp/index_6.jsp"></jsp:include>
		<div class="col-md-12" style="height:100px;"></div>
	</div>
	<!-- 遮盖层 -->
	<div class="bg-primary pull-left" id="top_bg_div"
		style="width:100%;height:100%;position:fixed;top:0px;z-index:98;background-color:black;opacity:0.5;display: none;"></div>
	<!-- 菜单底层 -->
	<div class="bg-primary pull-left" id="bg_div"
		style="height:34px;position:absolute;top:95px;z-index:-1;"></div>
	<!-- 新信息提示 -->
	<jsp:include page="plugins/jsp/index_7.jsp"></jsp:include>
	<!-- 购买信息模态框-->
	<jsp:include page="plugins/jsp/index_8.jsp"></jsp:include>
    <!-- 咨询模态框 -->
	<div id="zixun_div"
	style="position: fixed;top:0;left:0;z-index: 999; background-color: white; float: left;/* display: none; */">
	<div style="width: 580px; height: 403px; border: 3px solid #31B0D5;background-color:#31B0D5; ">
		<form action="" method="post">
			<div
				style="width: 100%; background-color: #31B0D5; color: white; line-height: 25px;">
				&nbsp;在线咨询/报名
				<div style="float: right; margin-right: 1%; cursor: pointer;"
					id="zixun_div_close">关闭</div>
			</div>
			<div class="col-md-12" style="border-radius:15px;background-color: white;height:372px;padding: 0px; ">
				<div class="col-md-7" style="height: 100%;">
					<div style="margin-top: 10px;text-align: center;">
						<span style="font-size: 30px;font-weight: bold;letter-spacing: 10px;">开设课程</span>
					</div>
					<div class="zixun_div_font bg-primary">
						一对一个性化快速提分课程
					</div>
					<div class="zixun_div_font bg-info">
						同步一对二小组课程
					</div>
					<div class="zixun_div_font bg-warning">
						艺考生冲刺课程
					</div>
					<div class="zixun_div_font bg-success">
						中考专题课程
					</div>
					<div class="zixun_div_font bg-danger">
						 小升初专题课程
					</div>
					<div class="col-md-12" style="margin-top: 10px;">
						<span class="pull-left" style="margin-top: 3px;">所在年级:</span>
						<input class="pull-left" list="zixun_div_grade" style="width: 60px;margin-left: 4px;">
						<datalist id="zixun_div_grade">
							<option>小学</option>
							<option>初中</option>
							<option>高中</option>
						</datalist>
						<span class="pull-left" style="margin-left: 15px;margin-top: 3px;">报读科目:</span>
						<input class="pull-left" list="zixun_div_course" style="width: 60px;">
						<datalist id="zixun_div_course">
							<option>语文</option>
							<option>数学</option>
							<option>英语</option>
							<option>物理</option>
							<option>化学</option>
							<option>地理</option>
							<option>政治</option>
							<option>历史</option>
							<option>生物</option>
						</datalist>
					</div>
					<div style="margin-top: -9px;float: left;margin-left:15px; ">
						<span style="margin-left: 15px;">联系电话:</span>
						<input type="text">
					</div>
					<div style="margin-top: 10px;text-align:center;width: 100%;float: left;">
						<button type="button" class="btn btn-info">报名</button>
						<button type="button" class="btn btn-danger" style="margin-left: 10px;">在线咨询</button>
					</div>
				</div>
				<div class="col-md-5" style="height: 100%;">
					<img alt="" src="plugins/img/scancode.png" style="width: 213px;margin-top: 71px;">
				</div>
			</div>	
		</form>
	</div>
</div>
	<!-- javaScript -->
	<script type="text/javascript" src="plugins/js/index.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#zixun_div_close").click(function(){
				$("#zixun_div").hide();
			});
			var zixun_div_width=$("#zixun_div").width();
			var zixun_div_height=$("#zixun_div").height();
			$("#zixun_div").css({
				"left":(browerWidth-zixun_div_width)/2,
				"top":(browerHeight-zixun_div_height)/2
			});
			/* setTimeout(function(){
				$("#zixun_div").show();
			},5000); */	
		});
	
	</script>
</body>
</html>
