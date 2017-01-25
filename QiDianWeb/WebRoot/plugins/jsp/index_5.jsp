<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pull-left" id="chatDiv"
	style="height:330px;position: fixed;left: 0;z-index:97;width: 140px;background-color:#F98D45;">
	<div class="col-md-12">

		<div class="col-md-12"
			style="background-image: url('${basePath}plugins/img/teacher.png');height: 100px;background-size:11em;background-repeat: no-repeat;float:left;"></div>
		<div class="col-md-12" style="background-color:red;">
			<h4 class="col-md-12"
				style="float:left;color:white;font-weight:bold;margin-left: 0.8em;">在线咨询</h4>
		</div>
		<div class="col-md-12" style="color:white;" id="qqDiv">
			<div class="pull-left" style="margin-left:1em;margin-top:3px;">
				<img class="pull-left" alt="" src="${basePath }plugins/img/qq.png">
				<a href="#" class="pull-left"
					style="margin-left:0.5em;margin-top:2px;color:white;" role="qq">黎老师</a>
			</div>
			<div class="pull-left" style="margin-left:1em;margin-top:3px;">
				<img class="pull-left" alt="" src="${basePath }plugins/img/qq.png">
				<a href="#" class="pull-left"
					style="margin-left:0.5em;margin-top:2px;color:white;" role="qq">冯老师</a>
			</div>
			
			<div class="pull-left" style="margin-left:1em;margin-top:3px;">
				<img class="pull-left" alt="" src="${basePath }plugins/img/qq.png">
				<a href="#" class="pull-left"
					style="margin-left:0.5em;margin-top:2px;color:white;" role="qq">钟老师</a>
			</div>
			<div class="pull-left" style="margin-left:1em;margin-top:3px;">
				<img class="pull-left" alt="" src="${basePath }plugins/img/qq.png">
				<a href="#" class="pull-left"
					style="margin-left:0.5em;margin-top:2px;color:white;" role="qq">邵老师</a>
			</div>
			<div class="pull-left" style="margin-left:1em;margin-top:3px;">
				<img class="pull-left" alt="" src="${basePath }plugins/img/qq.png">
				<a href="#" class="pull-left"
					style="margin-left:0.5em;margin-top:2px;color:white;" role="qq">欧老师</a>
			</div>
			<div class="pull-left" style="margin-top:5px;">
				<img alt="" src="${basePath }plugins/img/scancode.png"
					width="140px;">
			</div>

		</div>
	</div>

</div>
