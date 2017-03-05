<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
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
.div1{
	height:307px;
}
#teacherInfo>h5{
	padding-left:30px;
}
#teacherInfo>h3{
	padding-left:30px;
}
#teacherInfo>h3{
	color: #005EA6;
}
#teacherInfo>h5{
	height: 10px;
	font-family: "宋体",Arial,Helvetica,sans-serif;
	font-size: 12px;
	
}
#teacherInfo>h5>span{
	float: left;
}


</style>
</head>
<body>
	<div class="container-fluid">
		<br>
		<div class="div1 col-md-12">
			<div class="pull-left">
				<img class="img-thumbnail" alt="" src="../${teacher.images[0].relativePath }" style="width: 200px;">
			</div>
			<div class="pull-left" id="teacherInfo">
				<h3>${teacher.nickName }--骨干教师(${teacher.courseName })</h3>
				<h5><span>辅导科目:</span><span style="color: #005EA6;">&nbsp;&nbsp;${teacher.courseName }</span></h5>
				<h5><span>辅导年级:</span><span style="color: #005EA6;">&nbsp;&nbsp;${teacher.grade }</span></h5>
				<h5><span>辅导中心:</span><span style="color: #005EA6;">&nbsp;&nbsp;东建校区</span></h5>
				<h5 style="line-height: 18px;"><span>教学理念:</span><span style="width: 455px;">${teacher.idea }</span></h5>
				<h5 style="line-height: 25px;margin-top: 52px;"><span>受欢迎程度:</span><span>&nbsp;&nbsp;<i class="glyphicon glyphicon-star" style="color: red;font-size: 24px;"></i><i class="glyphicon glyphicon-star" style="color: red;font-size: 24px;"></i><i class="glyphicon glyphicon-star" style="color: red;font-size: 24px;"></i><i class="glyphicon glyphicon-star" style="color: red;font-size: 24px;"></i><i class="glyphicon glyphicon-star" style="color: red;font-size: 24px;"></i></span></h5>
				<hr style="margin-top: 24px;margin-left: 32px;">
				<button id="btn1" teacher="${teacher.userId }" class="pull-left btn btn-info" style="margin-left:6%;">在线咨询</button> <button class="btn btn-danger pull-left" style="margin-left:5%;">在线报名</button>
			</div>
		</div>
		<div id="div2" class="panel panel-info col-md-12" style="height:211px;">
				<div class="panel-heading">
					<h3 class="panel-title" style="font-weight:bold;">教学成果展示</h3>
				</div>
				<div class="panel-body" id="">
					<h5>${teacher.achievement }</h5>
				</div>
		</div>
		<div id="div3" class="panel panel-info col-md-12" style="height:132px;">
				<div class="panel-heading">
					<h3 class="panel-title" style="font-weight:bold;">教学特点</h3>
				</div>
				<div class="panel-body">
					<h5>${teacher.tFeatures }</h5>
				</div>
		</div>
		<div id="div4" class="panel panel-info col-md-12" style="height:132px;">
				<div class="panel-heading">
					<h3 class="panel-title" style="font-weight:bold;">教学经验</h3>
				</div>
				<div class="panel-body" id="">
					<h5>${teacher.tExperience }</h5>
				</div>
		</div>
		<div id="div4" class="panel panel-info col-md-12" style="height:132px;">
				<div class="panel-heading">
					<h3 class="panel-title" style="font-weight:bold;">教学荣誉</h3>
				</div>
				<div class="panel-body" id="">
					<h5>${teacher.tHonor}</h5>
				</div>
		</div>
		
	</div>
	<script type="text/javascript">
		$(function(){
			btn1Click();
		});
		function btn1Click(){
			$("#btn1").click(function(){
				var url="../chat/"+$(this).attr("teacher");
				window.open(url,"chat");
			});
		};
	</script>
</body>
</html>
