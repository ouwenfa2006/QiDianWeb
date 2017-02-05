<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML >
<html>
<head>
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
<style type="text/css">
.container-fluid {
	width: 100%;
	padding: 0px;
}
#div_1 {
	height:1087px;
}
.container-fluid>div {
	padding: 0px;
}
#div_1>div>a {
	margin-top: 20px;
	width: 163px;
	height: 232px;
	border: 1px solid silver;
	padding: 10px;
}

#div_1>div>a:HOVER {
	box-shadow: 0px 0px 5px 0px silver;
}

#div_1>div>a>img {
	width: 141px;
	height:211.5px;
}

#div_1>div>a>span {
	float:left;
	background-color: black;
	opacity: 0.6;
	height: 54px;
	margin-top: -79px;
	color: white;
	padding-top: 6px;
	width: 141px;
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
		<div class="col-md-12" id="div_1">
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
	var target="t_iframe";
	var grade="${grade}";//搜索年级
	var grade="${courseName}";//搜索的科目
		$(function(){
			pageCssInit();
			/* $.get("../teacherInfoController/findFineTeachers",function(data){
				var fine_teachers=eval(data);
				var string='';
				$(fine_teachers).each(function(){
					string+='<div class="pull-left" userId="'+this.userId+'">';
					string+='<img alt="" src="..'+this.relativePath+'">';
					string+='<h5>'+this.nickName+'</h5>';
					string+='</div>';
				});
				$(window.parent.document).find("#div_4_images>div:eq(0)").append(string);
			}); */
		});
		//页面样式初始化
		function pageCssInit(){
			$("#div_1>div>a").find("span:eq(1)").css({
				"height":"25px",
				"margin-top":"-25px",
				"background-color":"#D64832",
				"opacity":1,
				"padding-top":"3px",
				"padding-left":"32px"
			});
			$("#div_1>div>a").each(function(i){
				$(this).css({
					"margin-left":"20px"
				});
				if(i%4==0){
					$(this).css({
						"margin-left":"5px"
					});
				}
			});	
			var div_5_div_width=$("#div_5>div").width();
			var container_width=$(window.parent.document).find(".container-fluid").width();
			$("#div_5>div").css({
				"margin-left":(container_width-div_5_div_width)/2
			});
		}
	</script>
		<script type="text/javascript" src="../plugins/js/findByPage.js"></script>
</body>
</html>
