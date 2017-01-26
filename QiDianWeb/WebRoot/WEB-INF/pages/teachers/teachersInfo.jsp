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
    	</div>
    	<script type="text/javascript">
    		$(function(){
    			
    		});
    	</script>
  </body>
</html>
