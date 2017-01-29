$(function(){
	pageCssInit();		
});
//页面样式初始化
function pageCssInit(){
	$("#div_4>div>a").find("span:eq(1)").css({
		"height":"25px",
		"margin-top":"-25px",
		"background-color":"#D64832",
		"opacity":1,
		"padding-top":"3px",
		"padding-left":"32px"
	});
	$("#div_4>div>a").each(function(i){
		$(this).css({
			"margin-left":"22px"
		});
		if(i%4==0){
			$(this).css({
				"margin-left":"22px"
			});
		}
	});	
	var div_5_div_width=$("#div_5>div").width();
	var container_width=$(".container-fluid").width();
	$("#div_5>div").css({
		"margin-left":(container_width-div_5_div_width)/2
	});
}