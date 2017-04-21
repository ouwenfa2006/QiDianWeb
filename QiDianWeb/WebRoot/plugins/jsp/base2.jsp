<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="UTF-8">
<title>启点教育(官网)中小学个性化一对一辅导教育领先品牌</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes">
<script type="text/javascript"
	src="${basePath }bootstrap-3.3.5-dist/js/jquery-2.2.2.js"></script>
<script type="text/javascript"
	src="${basePath }bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath }bootstrap-3.3.5-dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${basePath }plugins/img/logo.ico" media="screen" />
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
@-ms-viewport       { width: device-width; }
@-ms-viewport       { width: device-width; }
@-o-viewport        { width: device-width; }
@viewport           { width: device-width; }
</style>
<script type="text/javascript">
	var basePath = "${basePath}";
	$(function(){
		removeBorder();
		initIE10();
	});
	//判断浏览器的类型
	function getBrowser() {
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isOpera = userAgent.indexOf("Opera") > -1;
		if (isOpera) {
			return "Opera";
		}//判断是否Opera浏览器
		if (userAgent.indexOf("Firefox") > -1) {
			return "Firefox";
		} //判断是否Firefox浏览器
		if (userAgent.indexOf("Chrome") > -1) {
			return "Chrome";
		}
		if (userAgent.indexOf("Safari") > -1) {
			return "Safari";
		} //判断是否Safari浏览器
		if (userAgent.indexOf("compatible") > -1&& userAgent.indexOf("MSIE") > -1 && !isOpera) {
			return "IE";
		}//判断是否IE浏览器
	}
	//去除点击后的border
	function removeBorder(){
		$("button").focus(function(){
			if(this.blur){
				this.blur();
			}
		});
		$("a").focus(function(){
			if(this.blur){
				this.blur();
			}
		});
	}
	function initIE10(){
		if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
			  var msViewportStyle = document.createElement('style')
			  msViewportStyle.appendChild(
			    document.createTextNode(
			      '@-ms-viewport{width:auto!important}'
			    )
			  )
			  document.querySelector('head').appendChild(msViewportStyle)
			}
	}
</script>
