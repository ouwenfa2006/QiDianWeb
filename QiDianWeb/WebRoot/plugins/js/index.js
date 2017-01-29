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

