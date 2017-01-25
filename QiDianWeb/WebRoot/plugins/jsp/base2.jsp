<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="renderer" content="webkit">
<title>启点教育</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
<script type="text/javascript">
	var basePath = "${basePath}";
	//判断浏览器的类型
	function getBrowser() {
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isOpera = userAgent.indexOf("Opera") > -1;
		if (isOpera) {
			return "Opera";
		}
		; //判断是否Opera浏览器
		if (userAgent.indexOf("Firefox") > -1) {
			return "Firefox";
		} //判断是否Firefox浏览器
		if (userAgent.indexOf("Chrome") > -1) {
			return "Chrome";
		}
		if (userAgent.indexOf("Safari") > -1) {
			return "Safari";
		} //判断是否Safari浏览器
		if (userAgent.indexOf("compatible") > -1
				&& userAgent.indexOf("MSIE") > -1 && !isOpera) {
			return "IE";
		}
		; //判断是否IE浏览器
	}
	
	
	//弹窗函数
	/* function initShowDiv(url,width,height,title,content){
		var string='';
		string+='<div id="upload_div" style="position: fixed;z-index: 999;background-color: white;">';
		string+='<div style="width:'+width+';height:'+height+';border: 1px solid silver;">';
		string+='<div style="width: 100%;background-color: #3385FF;color: white;line-height: 25px;">&nbsp;'+title;
		string+='<div style="float:right;margin-right: 1%;cursor: pointer;" id="close_upload_btn">关闭</div>';
		string+='<div id="fileContent" style="width: 100%;">';
		string+='</div></div></div>';
		$("body").append(string);
		$("#fileContent").append(content);
		var browerWidth=$(window).width();
		var browerHeight=$(window).height();
		var upload_div_width=$("#upload_div").width();
		var upload_div_heigth=$("#upload_div").height();
		$("#upload_div").css({
			"top":(browerHeight-upload_div_heigth)/2,
			"left":(browerWidth-upload_div_width)/2
		});
		$("#close_upload_btn").one("click",(function(){
			$("#upload_div").hide();
			$("#upload_div").remove();
		}));
	}; */
</script>
