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


#div_4 {
	width: 98.7%;
	height: 1241px;
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
		<div class="col-md-12" id="div_4">
			<div  class="col-md-12" style="padding: 0px;">
				<h1>【中考一对一精品课程】</h1>
				<h4 style="color: #666666;margin-left: 19px;">仅售288元/次课,限购20次</h4>
				<div style="width: 100%;height: 330px;">
					<img class="pull-left" alt="" src="../plugins/img/cuxiao.jpg" style="width: 460px;height: 280px;margin-left: 19px;">
					<div style="width: 514px;height: 330px;float: left;">
						<div>
							<h5 style="color:#999999;float: left;">团购价</h5>
							<i class=""></i>
							<h3>288元</h3>
							<h5>门店价:</h5>
							<h5 style="text-decoration: line-through;">300元</h5>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<div class="col-md-12" id="div_6">
			<img alt="" src="../plugins/img/head_1.jpg">
		</div>
	</div>
	<script type="text/javascript">
		
		$(function(){
		
		});	
		
	</script>
</body>
</html>
