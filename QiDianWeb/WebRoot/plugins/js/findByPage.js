//判断是否是整数
function isInteger(obj) {
	return Math.floor(obj) === obj;
}
//首页
function index(){
	window.location.href=iurl;//iurl在页面的js中定义
}
//前一页
function prePage(){
	window.location.href=purl;
}
//后一页
function nextPage(){
	if(nPage>parseInt(totalPage)){
		alert("已经没有更多的数据");
		return;
	}
	window.location.href=nurl;
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
			window.location.href=pageUrl+$("#inputPage").val();
		}else{
			alert("输入不合法!");
		}
	});

});