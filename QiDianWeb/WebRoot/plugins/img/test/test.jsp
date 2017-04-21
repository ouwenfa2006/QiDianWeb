<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
<script src="http://www.jq22.com/jquery/angular-1.4.6.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${basePath }plugins/img/test/Flow.js"></script>
<style type="text/css">
/* imageFlow */
#imageFlow{width:1050px;height:390px;overflow:hidden;position:relative;margin:30px auto 0 auto;}
#imageFlow .diapo{position:absolute;left:-1000px;cursor:pointer;overflow:hidden;}
#imageFlow .bank{visibility:hidden;overflow:hidden;}
#imageFlow ul{height:20px;margin:0 auto;width:100%;text-align:center;}
#imageFlow ul li{color:#333;font-size:12px;text-align:left;margin-left:30%;height:20px;line-height:20px;overflow:hidden;width:100%;vertical-align:bottom;}
#imageFlow .text{position:absolute;left:0px;width:80px;bottom:1%;text-align:center;color:#333;font-family:verdana, arial, Helvetica, sans-serif;z-index:1000;}
#imageFlow .title{font-size:0.9em;font-weight:bold;}
#imageFlow .legend{font-size:0.8em;}
#imageFlow .scrollbar{position:absolute;left:10%;top:0;width:80%;height:16px;z-index:1;}
#imageFlow .scrollbar img{cursor:pointer;}
#imageFlow .track{position:absolute;left:-55px;width:950px;height:16px;top:0px;}
#imageFlow .arrow-left{position:absolute;left:-105px;z-index:1;}
#imageFlow .arrow-right{position:absolute;right:-105px;z-index:1;}
#imageFlow .bar{position:absolute;height:16px;left:25px;top:0px;cursor:pointer;}
#imageFlow .ProTi{color:#ff6600;font-weight:bold;}
#imageFlow .ProRmb{font-weight:bold;}
#imageFlow .ProMo{color:#ff6600;cursor:pointer;}
</style>
<script type="text/javascript">
/* ==== create imageFlow ==== */
imf.create("imageFlow", 0.5, 1.5, 5);
 
</script>
<body>
	<div id="imageFlow">
		<div class="bank">
			<a rel="${basePath}plugins/img/test/1090.png"> </a> <a rel="${basePath}plugins/img/test/1090jzb.png"> </a> <a
				rel="${basePath}plugins/img/test/1030.png"> </a> <a rel="${basePath}plugins/img/test/1100X.png"> </a> <a
				rel="${basePath}plugins/img/test/1200.png">
				
			</a> <a rel="${basePath}plugins/img/test/3100.png">
				
			</a> <a rel="${basePath}plugins/img/test/7100.png">
				
			</a> <a rel="${basePath}plugins/img/test/3000.png">
				
			</a> <a rel="${basePath}plugins/img/test/3710.png">
				
			</a> <a rel="${basePath}plugins/img/test/6310.png">
				
			</a> <a rel="${basePath}plugins/img/test/3180.png">
				
			</a> <a rel="${basePath}plugins/img/test/3090.png">		
			</a>
		</div>
		<div class="scrollbar">
			<img class="track" src="${basePath}plugins/img/test/sb.png" alt=""> <img
				class="arrow-left" src="${basePath}plugins/img/test/btn_Pro_show_left.png" alt="">
			<img class="arrow-right" src="${basePath}plugins/img/test/btn_Pro_show_right.png" alt="">
			<img class="bar" src="${basePath}plugins/img/test/sc.png" alt="" style="left: 705px;">
		</div>
	</div>

</body>
</html>