<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="/plugins/jsp/base1.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
<style type="text/css">
.container-fluid {
	width: 100%;
	padding: 0px;
}
.container-fluid div{
	padding: 0px;
}
* {
	padding: 0px;
	margin: 0px;
}
/* 小屏幕（平板，大于等于 768px） */
@media ( min-width : @screen-sm-min) {
}

/* 中等屏幕（桌面显示器，大于等于 992px） */
@media ( min-width : @screen-md-min) {
}

/* 大屏幕（大桌面显示器，大于等于 1200px） */
@media ( min-width : @screen-lg-min) {
}
</style>
</head>
<jsp:include page="/plugins/jsp/base3.jsp"></jsp:include>
<body>
	<div class="container-fluid" style="height: 100%;">
		<h1>Welcome login</h1>
	</div>
	<!-- javaScript -->
</body>
</html>
