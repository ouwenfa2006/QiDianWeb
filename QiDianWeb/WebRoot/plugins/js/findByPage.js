//判断是否是整数
function isInteger(obj) {
	return Math.floor(obj) === obj;
}
//首页
function index(){
	if(target==null){
		window.location.href=iurl;
		return;
	}
	window.open(iurl, target);
}
//前一页
function prePage(){
	if(target==null){
		window.location.href=purl;
		return;
	}
	window.open(purl, target);
}
//后一页
function nextPage(){
	if(nPage>parseInt(totalPage)){
		alert("已经没有更多的数据");
		return;
	}
	if(target==null){
		window.location.href=nurl;
		return;
	}
	window.open(nurl, target);
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
			if(target==null){
				window.location.href=pageUrl+$("#inputPage").val();
				return;
			}
			window.open(pageUrl+$("#inputPage").val(), target);
		}else{
			alert("输入不合法!");
		}
	});

});