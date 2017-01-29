<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	height:1087px;
}

#div_4>div>a {
	margin-top: 20px;
	width: 163px;
	height: 232px;
	border: 1px solid silver;
	padding: 10px;
}

#div_4>div>a:HOVER {
	box-shadow: 0px 0px 5px 0px silver;
}

#div_4>div>a>img {
	width: 141px;
	height:211.5px;
}

#div_4>div>a>span {
	background-color: black;
	opacity: 0.6;
	height: 54px;
	margin-top: -79px;
	color: white;
	padding-top: 6px;
}

#div_4_right {
	width: 22.5%;
	border: 1px solid silver;
	height: 1087px;
	margin-top: -1087px;
	float: right;
	margin-right: 13px;
}

#div_5 {
	margin-top: 10px;
	height: 35px;
}

#div_5>div {
	width: 500px;
}

#div_5>div>div {
	width: 190px;
	margin-top: 5px;
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
    			<i class="glyphicon glyphicon-play-circle pull-left"></i>
    			<span class="pull-left">&nbsp;&nbsp;当前位置：</span>
    			<a href="#" class="pull-left">启点教育&nbsp;&nbsp;</a>
    			<span class="pull-left">&gt;&nbsp;&nbsp;</span>
    			<a href="#" class="pull-left">启点老师</a>
    		</div>
    		<div class="col-md-12" id="div_2">
    			<img alt="" src="../plugins/img/head_1.jpg">
    		</div>
    		<div class="col-md-12" id="div_3">
    			<div>
    				<label class="pull-left">年级:</label>
    				<a class="btn btn-default btn-sm pull-left div_3_div_a_active">全部</a>
    				<a class="btn btn-default btn-sm pull-left">高中老师</a>
    				<a class="btn btn-default btn-sm pull-left">初中老师</a>
    				<a class="btn btn-default btn-sm pull-left">小学老师</a>	
    			</div>
    			<div style="border: 0px;">
    				<label class="pull-left">科目:</label>
    				<a class="btn btn-default btn-sm pull-left div_3_div_a_active">全部</a>
    				<a class="btn btn-default btn-sm pull-left">语文</a>
    				<a class="btn btn-default btn-sm pull-left">数学</a>
    				<a class="btn btn-default btn-sm pull-left">英语</a>	
    				<a class="btn btn-default btn-sm pull-left">物理</a>	
    				<a class="btn btn-default btn-sm pull-left">化学</a>	
    				<a class="btn btn-default btn-sm pull-left">生物</a>	
    				<a class="btn btn-default btn-sm pull-left">政治</a>	
    				<a class="btn btn-default btn-sm pull-left">历史</a>	
    				<a class="btn btn-default btn-sm pull-left">地理</a>	
    			</div>
    		</div>
		<div class="col-md-8" id="div_4">
			<c:forEach begin="0" end="3" varStatus="i">
				<div class="col-md-12">
					<c:forEach items="${page_list }" var="teacher"
						begin="${i.index*4 }" end="${i.index*4+3 }">
						<a href="#" class="thumbnail pull-left"> <img alt=""
							src="..${teacher.images[0].relativePath }"> <span
							class="col-md-12"> ${teacher.nickName }<br>
								科目：${teacher.courseName }老师
						</span> <span class="col-md-12"> <i
								class="glyphicon glyphicon-user"></i> 在线咨询
						</span>
						</a>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<div class="col-md-12" id="div_4_right">	
    		</div>
    		<div class="col-md-12" id="div_5">
    			<div class="pull-left">
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="index()">首页</a>
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="prePage()">上一页</a>
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="nextPage()">下一页</a>
    				<span class="pull-left" style="margin-left: 5px;margin-top: 5px;">跳转:</span>
    				<input id="inputPage" class="form-control pull-left" name="page" value="${page }" style="width:55px;">
    				<div class="pull-left">
    						<span class="pull-left">页&nbsp;&nbsp;第</span>
    						<span class="pull-left" style="color: red;">${page }</span>
    						<span class="pull-left">页</span>
    						<span class="pull-left">&nbsp;&nbsp;共</span>
    						<span class="pull-left" style="color: red;">${fn:length(list) }</span>
    						<span class="pull-left">条记录</span>
    						<span class="pull-left">&nbsp;&nbsp;共</span>
    						<span class="pull-left" style="color: red;">${totalPage }</span>
    						<span class="pull-left">页</span>
    				</div>
    			</div>
    		</div>
    		<div class="col-md-12" id="div_6">
    			<img alt="" src="../plugins/img/head_1.jpg">
    		</div>
    	</div>
    	<script type="text/javascript">
    	var page="${page}";//当前页
		var pPage="${page-1}";//前一页
		var nPage="${page+1}";//下一页
    	var size="${fn:length(page_list)}";//每一页的数量
    	var totalPage=parseInt("${totalPage}");//总共的页数
    	var iurl="../teacherInfoController/getTeachersFromList?page=1";//首页url
    	var purl="../teacherInfoController/getTeachersFromList?page="+pPage;//上一页url
    	var nurl="../teacherInfoController/getTeachersFromList?page="+nPage;//下一页url
    	var pageUrl="../teacherInfoController/getTeachersFromList?page=";//页面跳转url
    	</script>
    	<script type="text/javascript" src="../plugins/js/teachersInfo.js"></script>
    	<script type="text/javascript" src="../plugins/js/findByPage.js"></script>
    	
  </body>
</html>
