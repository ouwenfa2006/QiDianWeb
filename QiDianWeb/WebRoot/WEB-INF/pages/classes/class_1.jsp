<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="col-md-12" style="height:1078px;width:100%;">
			<c:forEach items="${page_list }" varStatus="i" var="course">
			<div class="col-md-12">
					<div style="padding:1%;width: 200px;">
						<div class="btn btn-lg btn-warning btn-shadow" role="book"
							style="height:192px;width:98%;box-shadow:5px 5px 5px silver;">
							<img alt="" src="${basePath }plugins/img/logo.jpg"
								style="width:50%;">
							<div class="col-md-12" style="">
								<h2 class=".courseName" role="courseName"
									style="color:white;font-weight:600;">${course.grade }${course.courseName }</h2>
								<h4>辅导课程</h4>
								<div class="col-md-12" role=""
									style="background-color:#009999;width:178px;margin-left: -32px;height: 55px;">
									<h5 style="word-wrap:break-word;margin-top: 17px;">${course.adName }</h5>
								</div>
								
							</div>
						</div>
					</div>
			</div>
		</c:forEach>
		</div>
		
		<div class="col-md-12" id="div_5">
    			<div class="pull-left" style="width:100%;">
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="index()">首页</a>
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="prePage()">上一页</a>
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="nextPage()">下一页</a>
    				<span class="pull-left" style="margin-left: 5px;margin-top: 5px;">跳转:</span>
    				<input id="inputPage" class="form-control pull-left" name="page" value="${page }" style="width:55px;">
    				<div class="pull-left" style="width: 217px;">
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
	</div>
	<script type="text/javascript">
	var page="${page}";//当前页
	var pPage="${page-1}";//前一页
	var nPage="${page+1}";//下一页
	var size="${fn:length(page_list)}";//每一页的数量
	var totalPage=parseInt("${totalPage}");//总共的页数
	var iurl="../course/getCoursesFromList?page=1";//首页url
	var purl="../course/getCoursesFromList?page="+pPage;//上一页url
	var nurl="../course/getCoursesFromList?page="+nPage;//下一页url
	var pageUrl="../course/getCoursesFromList?page=";//页面跳转url
	var target=null;
	$(function(){
			 initCss();
	});
	function initCss(){
		var words=$("role='courseName'").html();
		if(words.length>4){
			$(".courseName").css({
				"margin-left":"-29px;"
			});
		}
	}
	</script>
	<script type="text/javascript" src="../plugins/js/findByPage.js"></script>
</body>
</html>
