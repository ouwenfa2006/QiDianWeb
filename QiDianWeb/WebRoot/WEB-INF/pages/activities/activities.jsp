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
			<jsp:include page="activities_1.jsp"></jsp:include>
			<jsp:include page="activities_2.jsp"></jsp:include>
			
		</div>	
		<div class="col-md-12" id="div_6">
			<img alt="" src="../plugins/img/head_1.jpg">
		</div>
	</div>
	<script type="text/javascript">
		
		$(function(){
			pay();
			addCount();
			minusCount();
			//浏览器兼容
			if(getBrowser()=="Firefox"){
				$("div[role='count_info_div1']").find("h5").eq(0).css({
					"margin-left":"25px"
				});
				$("div[role='count_info_div2']").find("h5").eq(0).css({
					"margin-left":"25px"
				});
			}		
		});
		//支付事件
		function pay(){
			//开始支付
			$("#pay_btn1").click(function(){
				//展示支付界面
				$(window.parent.document).find("#buy_title").html("【初中一对一精品课程】购买信息");
				var count=$("div[role='count_info_div1']").find("input").val();
				$(window.parent.document).find("#buy_count").html(count);;
				var money=parseInt(count)*288;
				$(window.parent.document).find(".price").html("288元");
				$(window.parent.document).find("#buy_money").html(money+"元");
				$("#myModal1",window.parent.document).modal('show');
			});
			
			$("#pay_btn2").click(function(){
				//展示支付界面
				$(window.parent.document).find("#buy_title").html("【高中一对一精品课程】购买信息");
				var count=$("div[role='count_info_div2']").find("input").val();
				$(window.parent.document).find("#buy_count").html(count);;
				var money=parseInt(count)*320;
				$(window.parent.document).find(".price").html("320元");
				$(window.parent.document).find("#buy_money").html(money+"元");
				$("#myModal1",window.parent.document).modal('show');
			});
			
		}
		//添加课程数量
		function addCount(){
			$("button[role='plus_button']").click(function(){
				var input=$(this).prev("input");
				input.val(parseInt(input.val())+1);
			});
		};
		//减少课程数量
		function minusCount(){
			$("button[role='minus_button']").click(function(){
				var input=$(this).next("input");
				if(input.val()=="10"){
					return;
				}
				input.val(parseInt(input.val())-1);
			});
		};
		
		
		
	</script>
</body>
</html>
