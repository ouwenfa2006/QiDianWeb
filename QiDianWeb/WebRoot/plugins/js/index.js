var browerWidth = $(window).width();
var browerHeight = $(window).height();
$(function() {
	//初始化左边层样式
	var h = $(window).height();//浏览器的高度
	var h1 = $("#chatDiv").height();//左边业务怪的高度
	var toLeft = $(".container-fluid").offset().left;//container-fluid离左边的kh
	var chatDivTop = (h - h1) / 2;
	var bodyWidth = $("body").width();
	var chatDivWidth = $("#chatDiv").width();
	$("#chatDiv").css({
		"top" : chatDivTop + 10,
		"left" : toLeft - chatDivWidth
	});
	if ($("body").width() <= 1007) {
	/*	$("body").css({
			"width":$("body").width()+chatDivWidth
		});*/
		$("#chatDiv").css({
			"left" : toLeft
		});
		$("#chatDiv").hide();
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
		//$("#uploadIframe").attr("src",$("#uploadIframe").attr("src"));
		
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
	$("#upload_div").find("button").click(function() {
				var k=checkSize($("#upload_div").find("input[type='file']").get(0));
				if(k==false){
					$("#upload_div").find("input[type='file']").click();
					return;
				}
				var form = $("#upload_div").find("form");
				var fileName = $("#upload_div").find("input[type='file']").val();
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
												$('#proBar').css('width', 0+ '%');
												$("#upload_div").hide();
												$("#top_bg_div").hide();
												$("#upload_div").find("input").each(function() {
													$(this).val("");
												});
												getCounselingInformation();
												clearInterval(intervalID);
												clearInterval(intId);
												resetPercent();
												alert("上传成功!");
												return;
											}
											if(data!=null&&data=="overMax"){
												resetPercent();												
												$('#proBar').css('width', 0+ '%'); 
												$("#upload_div").hide();
												$("#top_bg_div").hide();
												clearInterval(intervalID);	
												alert("上传文件不能超过50M");	
												return;
											}
											if(data!=null&&data=="fail"){
												resetPercent();
												$('#proBar').css('width', 0+ '%');
												$("#upload_div").hide();
												$("#top_bg_div").hide();
												clearInterval(intervalID);
												alert("上传失败!");
												return;
											} 

										});
									},1500);			
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
					$("#upload_div").find("input[type='file']").click();
				}
			});
	//初始化消息样式
	$("#message").css({
		"top":browerHeight,
		"left":browerWidth-$("#message").width()-6,
	});
	findNewAllMessages();
	closeNewMessage();

	
	
});

var intId;
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
			}  
		});  
	};  
	intId = window.setInterval(eventFun, 1000);
}
//清空上传进度
function resetPercent(){
	$.get(basePath+"uploadFileAndDownController/upload_isOver",function(data){});
}
//监听家长报名信息及临时会话信息
function findNewAllMessages(){
	$.get(basePath+"systemController/isAdmin",function(data){
		if(data=="0"){
			setTimeout(function(){
				$.post(basePath+"messageController/findNewAllMessages",function(m){
					if(m!=null&&m!="-1"){
						var messages=eval(m);
						var length=messages.length;
						$(messages).each(function(i){
							var texts=this.text.split("//");
							var p1=texts[0];
							var p2=texts[1];
							var p3=texts[2];
							var p4=texts[3];
							var string='';
							string+='<h2 messageId='+this.messageId+' style="margin-left: 75px;margin-top: 5px;font-weight: bold;">'+p1+'</h2>';
							string+='<h5 style="margin-left: 27px;">'+p2+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p3+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p4+'</h5>';
							string+='<h5 style="margin-left: 140px;">'+this.createTime+'</h5>';
							string+='<hr style="border:1px solid #31B0D5;">';
							$("#messageContent").append(string);
						});
						$("#message").animate({
							"top":browerHeight-$("#message").height()
						},1000,function(){
							
						});
					}
				})
			}, 1000);
			//监听临时会话线程
			setInterval(function(){
				
			},5000);
			startFindNewMessage();
			
		}
	});
}
/*开启监听报名信息进程*/
function startFindNewMessage(){
	setInterval(function(){
		$.post(basePath+"messageController/findLastNewMessage",function(m){
			if(m!=null&&m!="-1"){
				
				var messages=eval(m);
				var length=messages.length;
				$(messages).each(function(i){
					var texts=this.text.split("//");
					var p1=texts[0];
					var p2=texts[1];
					var p3=texts[2];
					var p4=texts[3];
					var string='';
					string+='<h2 messageId='+this.messageId+'  role="messageTitle" style="margin-left: 75px;margin-top: 5px;font-weight: bold;">'+p1+'</h2>';
					string+='<h5 style="margin-left: 27px;">'+p2+'</h5>';
					string+='<h5 style="margin-left: 27px;">'+p3+'</h5>';
					string+='<h5 style="margin-left: 27px;">'+p4+'</h5>';
					string+='<h5 style="margin-left: 140px;">'+this.createTime+'</h5>';
					string+='<hr style="border:1px solid #31B0D5;">';
					var ms=$("[role='messageTile']");
					if($("#messageContent>h2").length>0){
						$(string).insertBefore($("#messageContent>h2:eq(0)"));
					}else{
						$("#messageContent").append(string);
					}
					
					if(ms.length==0){
						$("#message").animate({
							"top":browerHeight-$("#message").height()
						},1000,function(){
							
						});
					}
					var time=1;
					var id=setInterval(function(){
						if(time%2==0){
							$("#message_title").css({
								"color":"red"
							});
						}else{
							$("#message_title").css({
								"color":"white"
							});
						}
						time++;
						if(time==10){
							clearInterval(id);
						}
					},500);
				});
				
			}
		})
	}, 5000);
}
//查找最后一条咨询信息
function findLastNewMessage(){
	$.get(basePath+"systemController/isAdmin",function(data){
		if(data=="0"){
			setTimeout(function(){
				$.post(basePath+"messageController/findLastNewMessage",function(m){
					if(m!=null&&m!="-1"){
						var messages=eval(m);
						var length=messages.length;
						$(messages).each(function(i){
							var texts=this.text.split("//");
							var p1=texts[0];
							var p2=texts[1];
							var p3=texts[2];
							var p4=texts[3];
							var string='';
							string+='<h2 messageId='+this.messageId+'  role="messageTitle" style="margin-left: 75px;margin-top: 5px;font-weight: bold;">'+p1+'</h2>';
							string+='<h5 style="margin-left: 27px;">'+p2+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p3+'</h5>';
							string+='<h5 style="margin-left: 27px;">'+p4+'</h5>';
							string+='<h5 style="margin-left: 140px;">'+this.createTime+'</h5>';
							string+='<hr style="border:1px solid #31B0D5;">';
							var ms=$("[role='messageTile']");
							if($("#messageContent>h2").length>0){
								$(string).insertBefore($("#messageContent>h2:eq(0)"));
							}else{
								$("#messageContent").append(string);
							}
							
							if(ms.length==0){
								$("#message").animate({
									"top":browerHeight-$("#message").height()
								},1000,function(){
									
								});
							}
							var time=1;
							var id=setInterval(function(){
								if(time%2==0){
									$("#message_title").css({
										"color":"red"
									});
								}else{
									$("#message_title").css({
										"color":"white"
									});
								}
								time++;
								if(time==10){
									clearInterval(id);
								}
							},500);
						});
					}				
				})
			}, 5000);
		}
	});
}
function closeNewMessage(){
	$("#message").find("#close_btn").click(function(){
		$("#message").css({
			"top":browerHeight,
			"left":browerWidth-$("#message").width()-6,
		});
		var params='';
		$("#messageContent>h2").each(function(){
			params+=$(this).attr("messageId")+","
		});
		$("#messageContent").html("");
		/*$.get(basePath+"messageController/clearNewMessages?params="+params,function(data){
			if(data=="success"){
				$("#messageContent").html("");
			}
		});*/
		
		
	});
}
//判断上传文件大小
//target <input type="file"/>
function checkSize(target) { 
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
	var fileSize = 0; 
	if (isIE && !target.files) { 
		var filePath = target.value; 
		var fileSystem = new ActiveXObject("Scripting.FileSystemObject"); 
		var file = fileSystem.GetFile (filePath); 
		fileSize = file.Size;
	}else { 
		fileSize = target.files[0].size; 
	} 
	var size = fileSize / 1024;
	if(size>50*1024){
		alert("上传文件过大");	
		return false;
	}
} 

