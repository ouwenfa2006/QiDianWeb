<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
<style type="text/css">
.container-fluid {
	width: 100%;
	padding: 0px;
}

.container-fluid>div {
	padding: 0px;
	width: 98.7%;
}

#div_1 {
	line-height: 40px;
	visibility:hidden;
}

#div_1>i {
	color: red;
	margin-top: 12px;
	margin-left: 10px;
}

#div_2>img {
	width: 100%;
}

#div_3 {
	border: 1px solid silver;
	height: 102px;
	margin-top: 10px;
	border-bottom: 3px solid #F98D45;
}

#div_3>div {
	margin-top: 10px;
	margin-left: 10px;
	border-bottom: 1px dotted silver;
	height: 40px;
}

#div_3>div>label {
	margin-top: 4px;
}

#div_3>div>a {
	border: 0px;
	margin-left: 5px;
}

.div_3_div_a_active {
	background-color: #F98D45;
	color: white;
}

#div_3>div>a:HOVER {
	background-color: #F98D45;
	color: white;
}

#div_4 {
	width: 98.7%;
	height: 1139px;
}

#div_4>iframe {
	width: 100%;
	height: 100%;
}

#div_6 {
	margin-top: 20px;
}

#div_6>img {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="col-md-12" id="div_1">
			<i class="glyphicon glyphicon-play-circle pull-left"></i> <span
				class="pull-left">&nbsp;&nbsp;当前位置：</span> <a href="#"
				class="pull-left">启点教育&nbsp;&nbsp;</a> <span class="pull-left">&gt;&nbsp;&nbsp;</span>
			<a class="pull-left" style="color:black;">启点课程</a>
		</div>
		<div class="col-md-12" id="div_2">
			<img alt="" src="../plugins/img/head_1.jpg">
		</div>
		<div class="col-md-12" id="div_3">
			<div>
				<label class="pull-left">年级:</label> <a
					class="btn btn-default btn-sm pull-left div_3_div_a_active">全部</a>
					<a class="btn btn-default btn-sm pull-left">五年级</a>
					<a class="btn btn-default btn-sm pull-left">六年级</a> 
					<a class="btn btn-default btn-sm pull-left">初一</a> 
					<a class="btn btn-default btn-sm pull-left">初二</a>
					<a class="btn btn-default btn-sm pull-left">初三</a>
					<a class="btn btn-default btn-sm pull-left">中考</a>
					<a class="btn btn-default btn-sm pull-left">高一</a>
					<a class="btn btn-default btn-sm pull-left">高二</a>
					<a class="btn btn-default btn-sm pull-left">高三</a>
					<a class="btn btn-default btn-sm pull-left">高考</a>
			</div>
			<div style="border: 0px;">
				<label class="pull-left">科目:</label> <a
					class="btn btn-default btn-sm pull-left div_3_div_a_active">全部</a>
				<a class="btn btn-default btn-sm pull-left">语文</a> <a
					class="btn btn-default btn-sm pull-left">数学</a> <a
					class="btn btn-default btn-sm pull-left">英语</a> <a
					class="btn btn-default btn-sm pull-left">物理</a> <a
					class="btn btn-default btn-sm pull-left">化学</a> <a
					class="btn btn-default btn-sm pull-left">生物</a> <a
					class="btn btn-default btn-sm pull-left">政治</a> <a
					class="btn btn-default btn-sm pull-left">历史</a> <a
					class="btn btn-default btn-sm pull-left">地理</a>
			</div>
		</div>
		<div class="col-md-12" id="div_4">
			<iframe id="course_iframe" name="course_iframe" frameborder="0" scrolling="no"
				src="../course/search"></iframe>
		</div>
		
		<div class="col-md-12" id="div_6">
			<img alt="" src="../plugins/img/head_1.jpg">
		</div>
	</div>
	<script type="text/javascript">
		
		$(function(){
			findCourses();
		});	
		//根据条件查询课程
		function findCourses(){
			$("#div_3>div:eq(0)").find("a").click(function(){
				$("#div_3>div:eq(0)").find("a").removeClass("div_3_div_a_active");
				$(this).addClass("div_3_div_a_active");
				var url="../course/search";
				createFormAndSubmit(url);
			});
			$("#div_3>div:eq(1)").find("a").click(function(){
				$("#div_3>div:eq(1)").find("a").removeClass("div_3_div_a_active");
				$(this).addClass("div_3_div_a_active");
				var url="../course/search";
				createFormAndSubmit(url);
			});
		}
		//创建临时提交表单
		function createFormAndSubmit(url){
			var grade=$("#div_3>div:eq(0)").find(".div_3_div_a_active").html();
			var courseName=$("#div_3>div:eq(1)").find(".div_3_div_a_active").html();
			var string='';
			string+='<form id="fm" action="'+url+'" method="post" target="course_iframe" style="displasy:none;">';
			string+='<input name="grade" value="'+grade+'">';
			string+='<input name="courseName" value="'+courseName+'">';
			string+='</form>';
			$("body").append(string);
			$("#fm").submit();
			$("#fm").remove();
		}
	</script>
</body>
</html>
