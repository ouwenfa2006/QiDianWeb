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
#div_1{
	line-height: 40px;
}
#div_1>i{
	color: red;
	margin-top: 12px;
}
#div_2>img{
	width:98.7%; 
}
.container-fluid div {
	padding: 0px;
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
    	</div>
    	<script type="text/javascript">
    		$(function(){
    			
    		});
    	</script>
  </body>
</html>
