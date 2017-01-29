//判断是否是整数
function isInteger(obj) {
	return Math.floor(obj) === obj;
}
$(function(){
	//跳转
	$("#inputPage").change(function(){
		var inputPage=$("#inputPage").val();
		var patt1=/^[0-9]{1,3}$/;
		var result = patt1.test(inputPage);//判断输入是否合法
		if(result==true){
			if($("#inputPage").val()=="0"){
				$("#inputPage").val(1);
			}
			if(parseInt($(this).val())>totalPage){
				alert("已经没有更多的数据");
				return;
			}
			createFormAndSubmit($(this).val());	

		}else{
			alert("输入不合法!");
		}
	});		
});
//首页
function index(){
	createFormAndSubmit(1);
}
//前一页
function prePage(){
	createFormAndSubmit(pPage);
}
//后一页
function nextPage(){
	if(nPage>totalPage){
		alert("已经没有更多的数据");
		return;
	}
	createFormAndSubmit(nPage);	
}
//创建临时提交表单
function createFormAndSubmit(page){
	var url="../systemController/getFilesFromList";
	var string='';
	string+='<form id="fm" action="'+url+'" method="post" target="rightIframe" style="displasy:none;">';
	string+='<input name="page" value="'+page+'">';
	string+='</form>';
	$("body").append(string);
	$("#fm").submit();
	$("#fm").remove();
}