var browerWidth = $(window).width();
var browerHeight = $(window).height();
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
				if(fileName.length>40){
					alert("文字名字过长，请重命名再上传!");
					return;
				}
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
									getProgress();//取得上传进度
									//判断上传是否完结
									var intervalID=null;
									intervalID=setInterval(function(){
										$.post(basePath+"uploadFileAndDownController/upload_isOver",function(data){
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
	findNewAllMessages();

	
	
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
//监听新信息
function findNewAllMessages(){
	$.get(basePath+"systemController/isAdmin",function(data){
		if(data=="0"){
			setTimeout(function(){
				$.post(basePath+"messageController/findNewAllMessages",function(m){
					if(m!=null){
						var messages=eval(m);
						var length=messages.length;
						$(messages).each(function(i){
							var texts=this.text.split("//");
							var p1=texts[0];
							var p2=texts[1];
							var p3=texts[2];
							var p4=texts[3];
							var string='';
							string+='<div id="message" role="message" style="position:fixed;z-index: 999;background-color: white;">';
							string+='<div style="width:300px;background-color: #3385FF;color: white;line-height: 25px;">&nbsp;新信息提醒';
							string+='<div style="float:right;margin-right: 1%;cursor: pointer;"id="close_upload_btn">关闭</div></div>';
							string+='<div id="messageContent" style="width: 100%;">';
							string+='<h2 style="margin-left: 75px;margin-top: 5px;font-weight: bold;">'+p1+'</h2>';
							string+='<h5 style="margin-left: 27px;">'+p2+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p3+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p4+'</h5>';
							string+='<h5 style="margin-left: 146px;">'+this.createTime+'</h5>';
							string+='</div></div></div>';
							$("body").append(string);
							$("#message").css({
								"top":browerHeight,
								"left":browerWidth-$("#message").width()
							});
							$("#message").animate({
								"top":browerHeight-$("#message").height()*($("[role='message']").length)
							},1500,function(){
								
							});
							$("#message").attr("id","");
						});
					}
				})
			}, 1000);
		}
	});
}
//查找最后一条咨询信息
function findLastNewMessage(){
	$.get(basePath+"systemController/isAdmin",function(data){
		if(data=="0"){
			setTimeout(function(){
				$.post(basePath+"messageController/findLastNewMessage",function(m){
					if(m!=null){
						var messages=eval(m);
						$(messages).each(function(i){
							var texts=this.text.split("//");
							var p1=texts[0];
							var p2=texts[1];
							var p3=texts[2];
							var p4=texts[3];
							var string='';
							string+='<div id="message" role="message" style="position:fixed;z-index: 999;background-color: white;">';
							string+='<div style="width:300px;background-color: #3385FF;color: white;line-height: 25px;">&nbsp;新信息提醒';
							string+='<div style="float:right;margin-right: 1%;cursor: pointer;"id="close_upload_btn">关闭</div></div>';
							string+='<div id="messageContent" style="width: 100%;">';
							string+='<h2 style="margin-left: 75px;margin-top: 5px;font-weight: bold;">'+p1+'</h2>';
							string+='<h5 style="margin-left: 27px;">'+p2+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p3+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p4+'</h5>';
							string+='<h5 style="margin-left: 146px;">'+this.createTime+'</h5>';
							string+='</div></div></div>';
							$("body").append(string);
							$("#message").css({
								"top":browerHeight,
								"left":browerWidth-$("#message").width()
							});
							$("#message").animate({
								"top":browerHeight-$("#message").height()*($("[role='message']").length)
							},1500,function(){
								
							});
							$("#message").attr("id","");
						});
					}
				})
			}, 1000);
		}
	});
}

