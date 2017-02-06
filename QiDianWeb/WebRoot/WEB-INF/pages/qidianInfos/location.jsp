<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>  
<head>  
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>
<title>启点教育</title>  
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
#container{height:45%}  
</style>  
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=lfDOnVRxw8CX8OQRtd52YGf8t6tQmCAG">
//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
</script>
</head>  
<body>  
<div id="container"></div> 
<script type="text/javascript"> 
var map = new BMap.Map("container");    //实例化地图
var point = new BMap.Point(113.122005, 23.018652); //设定地图中心   
map.centerAndZoom(point, 19);    //设定地图级别
var marker = new BMap.Marker(point);        // 创建标注    
map.addOverlay(marker);                     // 将标注添加到地图中
map.addControl(new BMap.NavigationControl()); //添加控件
map.enableScrollWheelZoom(true);//滚动缩放
map.openInfoWindow(point);
/* map.addEventListener("click", function(e){    
	 alert(e.point.lng + ", " + e.point.lat);    
}); */

</script>  
<script type="text/javascript">
	// 百度地图API功能
	/* var sContent ="天安门坐落在中国北京市中心,故宫的南侧,与天安门广场隔长安街相望,是清朝皇城的大门...";
	var map = new BMap.Map("l-map");
	var point = new BMap.Point(116.404, 39.915);
	map.centerAndZoom(point, 15);
	var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
	map.openInfoWindow(infoWindow,point); //开启信息窗口
	document.getElementById("r-result").innerHTML = "信息窗口的内容是：<br />" + infoWindow.getContent(); */
</script>
</body>  
</html>
