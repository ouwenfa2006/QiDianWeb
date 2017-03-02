<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="col-md-12" id="logoDiv">
	<div class="col-md-3" style="padding:1%;">
		<div>
			<img alt="" src="${basePath }plugins/img/logo.jpg"
				style="width:100%;">
		</div>
	</div>
	<div class="col-md-9">
		<h1
			style="border-left:1px solid silver;line-height:55px;float:left;margin-left:2%;margin-top:30px;padding-left:2%;">中小学课外辅导专家</h1>
		
		<i class="glyphicon glyphicon-earphone pull-left" style="line-height:55px;float:left;margin-left:12%;margin-top:30px;font-size:26px;color:red;"></i>
		<h1 style="line-height:55px;float:left;margin-top:30px;color:red;">0757-82914202</h1>
		<p style="float: left;margin-left: 32em;margin-top: -20px;">地址:佛山市禅城区普澜二路新荣大厦A座2楼<a href="${basePath }systemController/getLocation" target="mainIframe" class="glyphicon glyphicon-map-marker" style="color: #31B0D5;" title="查看定位"></a></p>
	</div>
</div>
<div class="col-md-12 bg-primary" style="margin-top: -10px;">
	<div class="btn-group col-md-12" id="menus" style="width:1007px;">
		<button type="button" class="btn btn-default btn-primary" onFocus="if(this.blur)this.blur()" onclick="index()">首页</button>
<!-- 		<button type="button" class="btn btn-default btn-primary" onclick="getCourses()">启点课程</button> -->
		<button type="button" class="btn btn-default btn-primary"  onclick="getTeachersInfo()">启点老师</button>
		<button type="button" class="btn btn-default btn-primary" onclick="getActivities()">启点活动</button>
		<button type="button" class="btn btn-default btn-primary" onclick="getClasses()">启点课程</button>
		<button type="button" class="btn btn-default btn-primary" onclick="getSchools()">启点校区</button>
		<button type="button" class="btn btn-default btn-primary" onclick="getCounselingInformation()">辅导资料</button>
		<button type="button" class="btn btn-default btn-primary" onclick="getEduInfos()">教学资讯</button>
		<button type="button" class="btn btn-default btn-primary" onclick="login()">教师登陆</button>
		<button type="button" class="btn btn-default btn-primary" onclick="getQiDianInfos()">关于我们</button>
	</div>
</div>
<script type="text/javascript">
var session_user="${session_user}";
$(function(){
	initMenus_Fixed();
});
//返回主页
function index(){
	var indexPath=basePath+"systemController/index";
	window.location.href=indexPath;
}
//发生滚动事件，固定头部样式
function initMenus_Fixed(){
	var t1=$("#menus").parent("div").offset().top;
	var toLeft=$(".container-fluid").offset().left;
	var chatDivWidth=$("#chatDiv").width();
	$(window).scroll(function(){
		var toTop=$(window).scrollTop();
		var scrollLeft=$(window).scrollLeft();
		if(toTop>t1){
			$("#bg_div").css({
				"position":"fixed",
				"top":0,
				"z-index":98
			});
			$("#menus").parent("div").css({
				"position":"fixed",
				"top":10,
				"z-index":99,
				"left":toLeft-scrollLeft,	
			});
			/* $("#menus").find("button").css({
				"font-weight":"bold"
			});	 */
		}else{
			$("#bg_div").css({
				"position":"absolute",
				"top":95,
				"z-index":-1
			});
			
			$("#menus").parent("div").css({
				"position":"static",//恢复到原来的布局
			});
			$("#menus").find("button").css({
				"font-weight":""
			});
			
		}
		//左边固定层
		$("#chatDiv").css({
			"left":toLeft-chatDivWidth-scrollLeft
		});
		if($("body").width()<=1007){
			$("#chatDiv").css({
				"left":toLeft-scrollLeft
			});
		}
	});
}
//获取启点课程
/* function getCourses(){
	window.open("${basePath}systemController/getCourses","mainIframe");
	var toTop=$("#mainIframe").contents().find("#ontToOne").offset().top;
	$(window).scrollTop(toTop); 
	
} */
//获取教师信息
function getTeachersInfo(){
	window.open(basePath+"teacherInfoController/getTeachersInfo","mainIframe");
}
//登陆
function login(){
	if(session_user!=""){
		alert("你已经登陆了!");
		return;
	}
	window.location.href=basePath+"loginController/login";
}
//启点活动
function getActivities(){
	window.open(basePath+"systemController/getActivities","mainIframe");
}
//启点课堂
function getClasses(){
	window.open(basePath+"systemController/getClasses","mainIframe");
	
}
//启点校区
function getSchools(){
	window.open(basePath+"systemController/getSchools","mainIframe");
}
//辅导资料
function getCounselingInformation(){
	
	window.open(basePath+"systemController/getCounselingInformation","mainIframe");
}
//教学资讯
function getEduInfos(){
	
}
function getQiDianInfos(){
	
	window.open(basePath+"systemController/getQiDianInfos");
}
</script>



