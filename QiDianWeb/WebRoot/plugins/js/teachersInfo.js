$(function(){
	//根据条件查询
	$("#div_3>div:eq(0)").find("a").click(function(){
		$("#div_3>div:eq(0)").find("a").removeClass("div_3_div_a_active");
		$(this).addClass("div_3_div_a_active");
		var url="../teacherInfoController/search";
		createFormAndSubmit(url);
	});
	$("#div_3>div:eq(1)").find("a").click(function(){
		$("#div_3>div:eq(1)").find("a").removeClass("div_3_div_a_active");
		$(this).addClass("div_3_div_a_active");
		var url="../teacherInfoController/search";
		createFormAndSubmit(url);
	});
	
});
//创建临时提交表单
function createFormAndSubmit(url){
	var grade=$("#div_3>div:eq(0)").find(".div_3_div_a_active").html();
	var courseName=$("#div_3>div:eq(1)").find(".div_3_div_a_active").html();
	var string='';
	string+='<form id="fm" action="'+url+'" method="post" target="t_iframe" style="displasy:none;">';
	string+='<input name="grade" value="'+grade+'">';
	string+='<input name="courseName" value="'+courseName+'">';
	string+='</form>';
	$("body").append(string);
	$("#fm").submit();
	$("#fm").remove();
}
