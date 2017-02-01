<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	height:1139px;
}
#div_4 >iframe{
	width:100%;
	height: 100%;
}
#div_4_right {
	width: 22.5%;
	border: 1px solid silver;
	height: 1087px;
	margin-top: -1140px;
	float: right;
	margin-right: 13px;
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
    				<a href="javaScript:void(0)" class="btn btn-default btn-sm pull-left div_3_div_a_active">全部</a>
    				<a href="javaScript:void(0)" class="btn btn-default btn-sm pull-left">高中</a>
    				<a href="javaScript:void(0)" class="btn btn-default btn-sm pull-left">初中</a>
    				<a href="javaScript:void(0)" class="btn btn-default btn-sm pull-left">小学</a>	
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
			<iframe id="t_iframe" name="t_iframe" frameborder="0" scrolling="no" src="../teacherInfoController/search"></iframe>
		</div>
		 <div class="col-md-12" id="div_4_right">	
    	</div>
 
    	<div class="col-md-12" id="div_6">
    			<img alt="" src="../plugins/img/head_1.jpg">
    		</div>
    	</div>
    	
    	<script type="text/javascript">

    	</script>
    	<script type="text/javascript" src="../plugins/js/teachersInfo.js"></script>
    	<script type="text/javascript" src="../plugins/js/findByPage.js"></script>
    	
  </body>
</html>
