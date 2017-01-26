<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.container-fluid div {
	padding: 0px;
}

#menus>button {
	padding-left: 2.8%;
	padding-right: 2.8%;
}

a[role='qq']:HOVER {
	color: red;
}
</style>
</head>
<jsp:include page="plugins/jsp/base3.jsp"></jsp:include>
<body style="overflow: visible;width:1400px;">
	<div class="container-fluid" style="width:1007px;">
		<div id=ss style=""></div>
		<jsp:include page="plugins/jsp/index_1.jsp"></jsp:include>
		<iframe width="100%" src="${basePath }plugins/jsp/iframe_init.jsp"
			id="mainIframe" name="mainIframe" frameborder="0" scrolling="no"
			style="height: 1600px;overflow:hidden;"></iframe>
		<!-- 左侧固定模板 -->
		<jsp:include page="plugins/jsp/index_5.jsp"></jsp:include>
		
		<!-- 弹窗 -->
		<div id="upload_div"
			style="position: fixed;z-index: 999;background-color: white;display: none;">
			<div style="width:380px;height: 269px;border: 1px solid #ccc;">
				<form action="${basePath }uploadFileAndDownController/uploadFile" method="post"
					enctype="multipart/form-data" target="uploadIframe">
					<div
						style="width: 100%;background-color: #3385FF;color: white;line-height: 25px;">
						&nbsp;文件上传
						<div style="float:right;margin-right: 1%;cursor: pointer;"
							id="close_upload_btn">关闭</div>
					</div>
					<div id="fileContent" style="width: 100%;">
						<div style="margin-top:15px;">
							<div style="margin-left:8.5%;float:left">
								<label>年级:&nbsp;</label> <select name="grade">
									<option value="小学">小学</option>
									<option value="初一">初一</option>
									<option value="初二">初二</option>
									<option value="初三">初三</option>
									<option value="高一">高一</option>
									<option value="高二">高二</option>
									<option value="高三">高三</option>
								</select>

							</div>
							<div style="margin-left:9%;float:left">
								<label>科目:&nbsp;</label> <select name="courseName">	
									<option value="语文">语文</option>
									<option value="数学">数学</option>
									<option value="英语">英语</option>
								</select>
							</div>
						</div>
					</div>
					<br>
					<div style="width:100%;margin-top: 15px; ">
						<input type="file" style="display: none;" name="file" id="file">
						<div>
							<label style="float: left;margin-left: 1%;">文件名称:</label><input
								type="text"
								style="width: 247px;float: left;margin-left: 1%;border: 1px solid #ccc;"
								disabled="disabled">
						</div>
						<button class="btn btn-sm btn-info" type="button" style="float: right;margin-right: 2%;line-height:1;">上传</button>
					</div>
					<div  style="width:100%;margin-top: 35px; ">
						<label class="control-label" style="float: left;margin-left: 1%;">上传进度:</label>  
                        <div class="controls">  
                            <div  class="progress progress-success progress-striped" style="width:65.5%;margin-left:1%;float:left;">  
                                <div  id ="proBar" class="bar" style="width: 0%;background-color: #62C462;height: 100%;"></div>  
                            </div>  
                        </div>  
					</div>
				</form>
				<iframe id="uploadIframe" name="uploadIframe" style="displasy:none;" frameborder="0" height="0" ></iframe>
			</div>
		</div>
		<div class="col-md-12" style="height:100px;"></div>
	</div>
	<!-- 遮盖层 -->
	<div class="bg-primary pull-left" id="top_bg_div"
		style="width:100%;height:100%;position:fixed;top:0px;z-index:98;background-color:black;opacity:0.5;display: none;"></div>
	<!-- 菜单底层 -->
	<div class="bg-primary pull-left" id="bg_div"
		style="height:34px;position:absolute;top:95px;z-index:-1;"></div>
	<!-- javaScript -->
	<script type="text/javascript">
		$(function() {
			//初始化左边层样式
			var h = $(window).height();
			var h1 = $("#chatDiv").height();
			var toLeft = $(".container-fluid").offset().left;
			var chatDivTop = (h - h1) / 2;
			var bodyWidth = $("body").width();
			var chatDivWidth = $("#chatDiv").width();
			$("#chatDiv").css({
				"top" : chatDivTop + 10,
				"left" : toLeft - chatDivWidth
			});
			if ($("body").width() <= 1007) {
				$("#chatDiv").css({
					"left" : toLeft
				});
			}
			//初始化菜单栏背景色样式
			$("#bg_div").css({
				"width" : bodyWidth
			});
			//初始化弹窗
			var browerWidth = $(window).width();
			var browerHeight = $(window).height();
			var upload_div_width = $("#upload_div").width();
			var upload_div_heigth = $("#upload_div").height();
			$("#upload_div").css({
				"top" : (browerHeight - upload_div_heigth) / 2,
				"left" : (browerWidth - upload_div_width) / 2
			});
			//弹窗事件
			$("#close_upload_btn").bind("click", (function() {
				$("#upload_div").hide();
				$("#top_bg_div").hide();
				$("#upload_div").find("input").each(function() {
					$(this).val("");
				});
			}));
			//年级选择事件
			$("#fileContent").find("select[name='grade']").change(function(){
				$("#fileContent").find("select[name='courseName']").empty();
				var string='';
				if($(this).val()=="小学"){
					string+='<option value="语文">语文</option>';
					string+='<option value="数学">数学</option>';
					string+='<option value="英语">英语</option>';
				}else{
					string+='<option value="语文">语文</option>';
					string+='<option value="数学">数学</option>';
					string+='<option value="英语">英语</option>';
					string+='<option value="物理">物理</option>';
					string+='<option value="化学">化学</option>';
					string+='<option value="生物">生物</option>';
					string+='<option value="政治">政治</option>';
					string+='<option value="历史">历史</option>';
					string+='<option value="地理">地理</option>';	
				}
				$("#fileContent").find("select[name='courseName']").append(string);
			});
			//上传文件选定时
			$("#upload_div").find("input[type='file']").change(function() {
				var fileName = $(this).val();
				$("#upload_div").find("input[type='text']").val(fileName);
			});
			//上传文件
			$("#upload_div")
					.find("button")
					.click(
							function() {
								var form = $("#upload_div").find("form");
								var fileName = $("#upload_div").find(
										"input[type='file']").val();
								var names = fileName.split(".");
								var length = $(names).size();
								//判断上传文件的合法性,如果合法则提交
								$(names)
										.each(
												function(i) {
													if (i == length - 1
															&& length > 1) {
														if (this == "doc"
																|| this == "docx"
																|| this == "pdf"||this=="rar"||this=="zip") {
															form.submit();//提交上传的文件，通过隐藏的iframe提交，模板异步处理
															getProgress();
															var intervalID=null;
															intervalID=setInterval(function(){
																$.post("${basePath}uploadFileAndDownController/upload_isOver",function(data){
																	if(data!=null&&data=="success"){
																		clearInterval(intervalID);
																		alert("上传成功!");
																		$('#proBar').css('width', 0+ '%');
																		$("#upload_div").hide();
																		$("#top_bg_div").hide();
																		getCounselingInformation();
																		return;
																	}
																	if(data!=null&&data=="overMax"){
																		clearInterval(intervalID);
																		alert("上传文件不能超过50M");													
																		$('#proBar').css('width', 0+ '%'); 
																		$("#upload_div").hide();
																		$("#top_bg_div").hide();
																		return;
																	}
																	if(data!=null&&data=="fail"){
																		clearInterval(intervalID);
																		$('#proBar').css('width', 0+ '%');
																		$("#upload_div").hide();
																		$("#top_bg_div").hide();
																		alert("上传失败!");
																		return;
																	} 
																	
																});
															},1500);			
															/* $("#upload_div")
																	.hide();
															$("#top_bg_div").hide(); */
															$("#upload_div")
																	.find(
																			"input")
																	.each(
																			function() {
																				$(
																						this)
																						.val(
																								"");
																			});
														} else {
															alert("只能上传doc/docx/pdf/rar/zip类型大小不超过50M的文件!");
															$("#upload_div")
																	.find(
																			"input[type='file']")
																	.click();
														}
													}
												});
								if (length == 1) {
									alert("请选择你要上传的文件!");
									$("#upload_div").find("input[type='file']")
											.click();
								}
							});
		});
		
		
		//取得上传进度
		function getProgress(){
			var url=basePath+"/uploadFileAndDownController/getPercent";
			var eventFun = function() {  
                $.ajax({  
                    type : 'GET',  
                    url : url,  
                    data : {},  
                    dataType : 'text',  
                    success : function(data) { 
                        $('#proBar').css('width', data+ '%');  
                        if (data == "100") {  
                            window.clearInterval(intId);  
                        }  
                    }  
                });  
            };  
            var intId = window.setInterval(eventFun, 200);
		}
		
		
	</script>
</body>
</html>
