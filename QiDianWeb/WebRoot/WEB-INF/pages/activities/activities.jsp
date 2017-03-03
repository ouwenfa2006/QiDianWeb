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
			<div  class="col-md-12" style="padding: 0px;border-bottom: 1px dashed #EEEEEE;">
				<h1>【初中一对一精品课程】</h1>
				<h4 style="color: #666666;margin-left: 19px;">仅售288元/次课(2小时),10次课以上起购,仅限语、数、英、物、化科目</h4>
				<div style="width: 100%;height: 330px;">
					<img class="pull-left" alt="" src="../plugins/img/cuxiao.jpg" style="width: 460px;height: 280px;margin-left: 19px;">
					<div style="width: 484px;height: 330px;float: left;">
						<div style="border-bottom: 1px solid #EEEEEE;height: 34px;width: 493px;margin-left:21px;">
							<h5 style="color:#999999;float: left;margin-left: 41px;">团购价</h5>
							<i class="glyphicon glyphicon-yen pull-left" style="font-size:28px;color: red;margin-left: 10px;margin-top: 2px;"></i>
							<h3 class="pull-left" style="color: red;margin-top: 4px;margin-left:4px;">288元</h3>
							<h5 class="pull-left" style="margin-left: 16px;color: #999999;">门店价:</h5>
							<h5 style="text-decoration: line-through;float: left;margin-left: 8px;color:#999999 ;">320元</h5>
						</div>
						<div style="border-bottom: 1px solid #EEEEEE;height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:-255px;color:#999999;">已售</h5><h5 style="color: red;float: left;margin-left: -222px;border-right: 1px solid silver;width: 87px;">10</h5>
							<h5 class="pull-left" style="margin-left: -92px;color:#999999;">已有12人进行评价</h5>
						</div>
						<div style="height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:-279px;color:#999999;">有效期</h5><h5 style="color: red;float: left;margin-left: -222px">2017.12.1</h5>
						</div>
						<div style="height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:41px;color:#999999;">数量</h5>
							<div>
								<div>
									 <button class="btn btn-warning pull-left" style="margin-left: 10px;">
									 	<i class="glyphicon glyphicon-minus"></i>
									 </button>
									 <input type="text" class="form-control pull-left" style="width:50px;margin-left: 1px;" value="10">
									 <button class="btn btn-success pull-left" style="margin-left: 1px;">
									 	<i class="glyphicon glyphicon-plus"></i>
									 </button>
								</div>
							</div>
						</div>
						<div style="height: 62px;width: 493px;margin-left:21px;margin-top: 22px;border-bottom: 1px solid #EEEEEE;">
							<button class="btn btn-danger btn-lg" style="width: 177px;margin-left: 38px;">立即抢购</button>
						</div>
						<div style="height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:41px;color:#999999;float: left;">服务承诺:</h5><h5 style="color: red;float: left;margin-left: 5px;">优秀老师、教学质量跟踪、极速退、过期退、真实评价</h5>
							
						</div>
					</div>
				</div>
			</div>
			
			<div  class="col-md-12" style="padding: 0px;border-bottom: 1px dashed #EEEEEE;">
				<h1>【高中一对一精品课程】</h1>
				<h4 style="color: #666666;margin-left: 19px;">仅售320元/次课(2小时),10次课以上起购,仅限语、数、英、物、化科目</h4>
				<div style="width: 100%;height: 330px;">
					<img class="pull-left" alt="" src="../plugins/img/cuxiao.jpg" style="width: 460px;height: 280px;margin-left: 19px;">
					<div style="width: 484px;height: 330px;float: left;">
						<div style="border-bottom: 1px solid #EEEEEE;height: 34px;width: 493px;margin-left:21px;">
							<h5 style="color:#999999;float: left;margin-left: 41px;">团购价</h5>
							<i class="glyphicon glyphicon-yen pull-left" style="font-size:28px;color: red;margin-left: 10px;margin-top: 2px;"></i>
							<h3 class="pull-left" style="color: red;margin-top: 4px;margin-left:4px;">320元</h3>
							<h5 class="pull-left" style="margin-left: 16px;color: #999999;">门店价:</h5>
							<h5 style="text-decoration: line-through;float: left;margin-left: 8px;color:#999999 ;">360元</h5>
						</div>
						<div style="border-bottom: 1px solid #EEEEEE;height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:-255px;color:#999999;">已售</h5><h5 style="color: red;float: left;margin-left: -222px;border-right: 1px solid silver;width: 87px;">10</h5>
							<h5 class="pull-left" style="margin-left: -92px;color:#999999;">已有12人进行评价</h5>
						</div>
						<div style="height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:-279px;color:#999999;">有效期</h5><h5 style="color: red;float: left;margin-left: -222px">2017.12.1</h5>
						</div>
						<div style="height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:41px;color:#999999;">数量</h5>
							<div>
								<div>
									 <button class="btn btn-warning pull-left" style="margin-left: 10px;">
									 	<i class="glyphicon glyphicon-minus"></i>
									 </button>
									 <input type="text" class="form-control pull-left" style="width:50px;margin-left: 1px;" value="10">
									 <button class="btn btn-success pull-left" style="margin-left: 1px;">
									 	<i class="glyphicon glyphicon-plus"></i>
									 </button>
								</div>
							</div>
						</div>
						<div style="height: 62px;width: 493px;margin-left:21px;margin-top: 22px;border-bottom: 1px solid #EEEEEE;">
							<button class="btn btn-danger btn-lg" style="width: 177px;margin-left: 38px;">立即抢购</button>
						</div>
						<div style="height: 34px;width: 493px;margin-left:21px;">
							<h5 class="pull-left" style="margin-left:41px;color:#999999;float: left;">服务承诺:</h5><h5 style="color: red;float: left;margin-left: 5px;">优秀老师、教学质量跟踪、极速退、过期退、真实评价</h5>
							
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
