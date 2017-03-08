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
	width: 76.5%;
	height: 1139px;
}

#div_4>iframe {
	width: 100%;
	height: 100%;
}

#div_4_right {
	width: 22.5%;
	height: 1087px;
	margin-top: -1140px;
	float: right;
	margin-right: 13px;
}

#div_4_right>div {
	margin-top: 20px;
}

#div_4_right>div>div>h3 {
	color: white;
}

#div_4_images>div {
	
}
#div_4_infos>div{
	margin-top:10px;
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
			<a class="pull-left" style="color:black;">启点老师</a>
		</div>
		<div class="col-md-12" id="div_2">
			<img alt="" src="../plugins/img/head_1.jpg">
		</div>
		<div class="col-md-12" id="div_3">
			<div>
				<label class="pull-left">年级:</label> <a
					class="btn btn-default btn-sm pull-left div_3_div_a_active">全部</a>
				<a class="btn btn-default btn-sm pull-left">高中</a> <a
					class="btn btn-default btn-sm pull-left">初中</a> <a
					class="btn btn-default btn-sm pull-left">小学</a>
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
		<div class="col-md-8" id="div_4">
			<iframe id="t_iframe" name="t_iframe" frameborder="0" scrolling="no"
				src="../teacherInfoController/getDatas"></iframe>
		</div>
		<div class="col-md-12" id="div_4_right">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">启点优秀老师</h3>
				</div>
				<div class="panel-body" id="div_4_images">
					<div style="width:195px;height:283px;">
						
					</div>
					<div class="col-md-12" id="div_4_infos">
						<div class="col-md-12">
							<label class="pull-left">所在年级:&nbsp;</label> <select name="grade" class="pull-left">
								<option value="小学">小学</option>
								<option value="初一">初一</option>
								<option value="初二">初二</option>
								<option value="初三">初三</option>
								<option value="高一">高一</option>
								<option value="高二">高二</option>
								<option value="高三">高三</option>
							</select>
						</div>
						<div class="col-md-12">
							<label class="pull-left">报读科目:&nbsp;</label> <select name="courseName" class="pull-left">	
									<option value="语文">语文</option>
									<option value="数学">数学</option>
									<option value="英语">英语</option>
							</select>
						</div>
						<div class="col-md-12">
							<label class="pull-left" style="margin-top: 3px;">家长姓名:</label>
							<input id="parentName" type="text" class="pull-left form-control" style="width:123px;height: 30px;">
						</div>
						<div class="col-md-12">
							<label class="pull-left" style="margin-top: 3px;">联系电话:</label>
							<input id="parentPhone" type="text" class="pull-left form-control" style="width:123px;height: 30px;">
						</div>
						<div class="col-md-12">
							<button id="submit" class="pull-left btn btn-danger btn-xs" style="margin-left: 47px;width: 100px;">立即报名</button>			
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12" id="div_6">
			<img alt="" src="../plugins/img/head_1.jpg">
		</div>
	</div>
	<script type="text/javascript" src="../plugins/js/teachersInfo.js"></script>
	<script type="text/javascript">
		$(function(){
			//报名科目选择
			$("#div_4_infos").find("select[name='grade']").change(function(){
				$("#div_4_infos").find("select[name='courseName']").empty();
				var string='';
				if($(this).val()=="小学"){
					string+='<option value="语文">语文</option>';
					string+='<option value="数学">数学</option>';
					string+='<option value="英语">英语</option>';
				}else{
					string+='<option value="语文">语文</option>';
					string+='<option value="数学">数学</option>';
					string+='<option value="英语">英语</option>';
					string+='<option value="物理">物理</option>';
					string+='<option value="化学">化学</option>';
					string+='<option value="生物">生物</option>';
					string+='<option value="政治">政治</option>';
					string+='<option value="历史">历史</option>';
					string+='<option value="地理">地理</option>';	
				}
				$("#div_4_infos").find("select[name='courseName']").append(string);
			});
			$("#submit").click(function(){
				var parentName=$("#parentName").val();
				var parentPhone=$("#parentPhone").val();
				var pattern1=/[^\u0000-\u00FF]{2,4}/;
				var result1=pattern1.test(parentName);
				if(result1==false){
					alert("请输入正确的名字!");
					return;
				}
				if(parentName.length==1||parentName.length>4){
					alert("请输入正确的名字!");
					return;
				}
				var pattern2=/^[0-9]{11}$/;
				var result2=pattern2.test(parentPhone);
				if(result2==false){
					alert("联系方式有误，请输入正确的手机号码!");
					return;
				}
				var parms={parentName:parentName,parentPhone:parentPhone,grade:$("select[name='grade']").val(),courseName:$("select[name='courseName']").val()};
				$.post("../messageController/addMessage",parms,function(data){
					if(data=="success"){
						alert("报名成功!");
						$("#parentName").val("");
						$("#parentPhone").val("");
						//window.parent.findLastNewMessage();
					}else{
						alert("报名失败!");
					}
				});
			});
			//初始化样式
			$("#div_4_infos>div").css({
				"width":"217px",
				"margin-left":"-26px"
			});
			//优秀老师
			$.get("../teacherInfoController/findFineTeachers",function(data){
				var fine_teachers=eval(data);
				var string='';
				$(fine_teachers).each(function(){
					string+='<div class="pull-left fineTeachers" role="fineTeachers" userId="'+this.userId+'" style="margin-left:18px;cursor:pointer;">';
					string+='<img alt="" src="..'+this.relativePath+'" style="height:106.25px;">';
					string+='<h5 style="padding-left: 18px;">'+this.nickName+'</h5>';
					string+='</div>';			
				});
				$("#div_4_images>div:eq(0)").append(string);
				$("div[role='fineTeachers']").click(function(){
					var userId=$(this).attr("userId");
					window.open(basePath+"teacherInfoController/getTeacherInfosById?userId="+userId,"t_iframe");
				});
				$("div[role='fineTeachers']").mouseover(function(){
					$(this).find("h5").css({
						"color":"red"
					});
				}).mouseout(function(){
					$(this).find("h5").css({
						"color":"black"
					});
				});
				
			});
		});
		
	</script>
</body>
</html>
