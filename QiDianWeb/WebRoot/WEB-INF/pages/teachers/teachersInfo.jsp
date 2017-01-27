<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
  	<style type="text/css">
  	.container-fluid {
	width: 100%;
	padding: 0px;
}
.container-fluid div {
	padding: 0px;
	width: 98.7%;
}
#div_1{
	line-height: 40px;
}
#div_1>i{
	color: red;
	margin-top: 12px;
	margin-left: 10px;
}
#div_2>img{
	width:100%; 
}
#div_3{
	border: 1px solid silver;
	height: 102px;
	margin-top: 10px;
	border-bottom:3px solid #F98D45;
}
#div_3>div{
	margin-top: 10px;
	margin-left: 10px;
	border-bottom: 1px dotted silver;
	height: 40px;
}
#div_3>div>label{
	margin-top: 4px; 
}
#div_3>div>a{
	border: 0px;
	margin-left: 5px;
}
.div_3_div_a_active{
	background-color: #F98D45;
	color: white;
}
#div_3>div>a:HOVER {
	background-color: #F98D45;
	color: white;
}
#div_4>div>a{
	margin-top:20px;
	width:163px;
	height:232px;
	border:1px solid silver;
	padding:10px;
}
#div_4>div>a:HOVER{
	box-shadow:0px 0px 5px 0px silver;
}
#div_4>div>a>img{
	width:100%;
}
#div_4>div>a>span{
	background-color:black;
	opacity:0.6;
	height:54px;
	margin-top:-79px;
	color:white;
	padding-top:6px;
}
#div_5{
	margin-top:10px;
	height:35px;
}
#div_5>div{
	width:500px;
}
#div_5>div>div{
	width:190px;
	margin-top:5px;
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
    				<label class="pull-left">年级:</label>
    				<a class="btn btn-default btn-sm pull-left div_3_div_a_active">学科</a>
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
    		<div class="col-md-12" id="div_4">
    			<div class="col-md-12">
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher2.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher3.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    			</div>
    			
    			<div class="col-md-12">
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher2.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher3.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    			</div>
    			
    			<div class="col-md-12">
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher2.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher3.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    			</div>
    			
    			<div class="col-md-12">
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher2.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher3.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    				<a href="#" class="thumbnail pull-left">
    					<img alt="" src="../plugins/img/teacher1.jpg">
    					<span class="col-md-12">
							刘婷婷<br>
							科目：英语老师 
    					</span>
    					<span class="col-md-12" style="">
    						<i class="glyphicon glyphicon-user"></i>
    						在线咨询
    					</span>
    				</a>
    			</div>
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
    						<span class="pull-left" style="color: red;">1</span>
    						<span class="pull-left">页</span>
    						<span class="pull-left">&nbsp;&nbsp;共</span>
    						<span class="pull-left" style="color: red;">1</span>
    						<span class="pull-left">条记录</span>
    						<span class="pull-left">&nbsp;&nbsp;共</span>
    						<span class="pull-left" style="color: red;">1</span>
    						<span class="pull-left">页</span>
    				</div>
    			</div>
    		</div>
    	</div>
    	<script type="text/javascript">
    		$(function(){
    			pageCssInit();
    		});
    		//页面样式初始化
    		function pageCssInit(){
    			$("#div_4>div>a").find("span:eq(1)").css({
    				"height":"25px",
    				"margin-top":"-25px",
    				"background-color":"#D64832",
    				"opacity":1,
    				"padding-top":"3px",
    				"padding-left":"32px"
    			});
    			$("#div_4>div>a").each(function(i){
    				$(this).css({
        				"margin-left":"33px"
        			});
    				if(i%5==0){
    					$(this).css({
            				"margin-left":"22px"
            			});
    				}
    			});
    			
    			var div_5_div_width=$("#div_5>div").width();
    			var container_width=$(".container-fluid").width();
    			$("#div_5>div").css({
    				"margin-left":(container_width-div_5_div_width)/2
    			});
    			
    		}
    	</script>
  </body>
</html>
