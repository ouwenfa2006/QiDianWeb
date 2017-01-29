var setting = {
		data : {
			key : {
				title : "t"
			},
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeClick : beforeClick,
			onClick : onClick
		}
};

var zNodes = [ {
	id : 1,
	pId : 0,
	name : "学习资料",
	open : true
}, {
	id : 11,
	pId : 1,
	name : "科目"
}, {
	id : 111,
	pId : 11,
	name : "数学"
}, {
	id : 1111,
	pId : 111,
	name : "初一"
}, {
	id : 1112,
	pId : 111,
	name : "初二"
}, {
	id : 1113,
	pId : 111,
	name : "初三"
}, {
	id : 1114,
	pId : 111,
	name : "高一"
}, {
	id : 1115,
	pId : 111,
	name : "高二"
}, {
	id : 1116,
	pId : 111,
	name : "高三"
}, {
	id : 1117,
	pId : 111,
	name : "小学"
}, {
	id : 112,
	pId : 11,
	name : "语文"
}, {
	id : 1121,
	pId : 112,
	name : "初一"
}, {
	id : 1122,
	pId : 112,
	name : "初二"
}, {
	id : 1123,
	pId : 112,
	name : "初三"
}, {
	id : 1124,
	pId : 112,
	name : "高一"
}, {
	id : 1125,
	pId : 112,
	name : "高二"
}, {
	id : 1126,
	pId : 112,
	name : "高三"
}, {
	id : 1127,
	pId : 112,
	name : "小学"
}, {
	id : 113,
	pId : 11,
	name : "英语"
}, {
	id : 1131,
	pId : 113,
	name : "初一"
}, {
	id : 1132,
	pId : 113,
	name : "初二"
}, {
	id : 1133,
	pId : 113,
	name : "初三"
}, {
	id : 1134,
	pId : 113,
	name : "高一"
}, {
	id : 1135,
	pId : 113,
	name : "高二"
}, {
	id : 1136,
	pId : 113,
	name : "高三"
}, {
	id : 1137,
	pId : 113,
	name : "小学"
}, {
	id : 114,
	pId : 11,
	name : "物理"
}, {
	id : 1141,
	pId : 114,
	name : "初二"
}, {
	id : 1142,
	pId : 114,
	name : "初三"
}, {
	id : 1143,
	pId : 114,
	name : "高一"
}, {
	id : 1144,
	pId : 114,
	name : "高二"
}, {
	id : 1145,
	pId : 114,
	name : "高三"
}, {
	id : 115,
	pId : 11,
	name : "化学"
}, {
	id : 1111,
	pId : 115,
	name : "初三"
}, {
	id : 1112,
	pId : 115,
	name : "高一"
}, {
	id : 1113,
	pId : 115,
	name : "高二"
}, {
	id : 1114,
	pId : 115,
	name : "高三"
}, {
	id : 116,
	pId : 11,
	name : "政治"
}, {
	id : 1161,
	pId : 116,
	name : "初三"
}, {
	id : 1162,
	pId : 116,
	name : "高一"
}, {
	id : 1163,
	pId : 116,
	name : "高二"
}, {
	id : 1164,
	pId : 116,
	name : "高三"
}, {
	id : 117,
	pId : 11,
	name : "历史"
}, {
	id : 118,
	pId : 11,
	name : "地理"
}, {
	id : 1181,
	pId : 118,
	name : "高一"
}, {
	id : 1182,
	pId : 118,
	name : "高二"
}, {
	id : 1183,
	pId : 118,
	name : "高三"
}, {
	id : 1171,
	pId : 117,
	name : "初三"
}, {
	id : 1172,
	pId : 117,
	name : "高一"
}, {
	id : 1173,
	pId : 117,
	name : "高二"
}, {
	id : 1174,
	pId : 117,
	name : "高三"
}];

var log, className = "dark";
function beforeClick(treeId, treeNode, clickFlag) {
	return (treeNode.click != false);
}
//点击树形菜单事件
function onClick(event, treeId, treeNode, clickFlag) {
	//alert(treeNode.name);
	//取得选中的对象
	var treeObj = $.fn.zTree.getZTreeObj("tree");
	var sNodes = treeObj.getSelectedNodes();
	if(treeNode.name=="初一"||treeNode.name=="初二"||treeNode.name=="初三"||treeNode.name=="高一"||treeNode.name=="高二"||treeNode.name=="高三"||treeNode.name=="初中"||treeNode.name=="高中"||treeNode.name=="小学"){
		if (sNodes.length > 0) {
			$("#search").val("");
			var grade = sNodes[0].getParentNode();//父节点	
			createFormAndSubmit(grade.name, treeNode.name,null);
			return;
		}
	}
}
//创建临时菜单并提交
function createFormAndSubmit(gradeName,treeNodeName,searchFile){
	var url="../systemController/getAllLeanrningMaterials";
	var string='';
	string+='<form id="fm" action="'+url+'" method="post" target="rightIframe" style="displasy:none;">';
	string+='<input name="courseName" value="'+gradeName+'">';
	string+='<input name="grade" value="'+treeNodeName+'">';
	string+='<input name="page" value="'+1+'">';
	string+='<input name="searchFile" value="'+searchFile+'">';
	string+='</form>';
	$("body").append(string);
	$("#fm").submit();
	$("#fm").remove();
}
function createSearchFormAndSubmit(){
	var url="../systemController/getFilesBySearch";
	var string='';
	string+='<form id="fm" action="'+url+'" method="post" target="rightIframe" style="displasy:none;">';
	string+='<input name="page" value="'+1+'">';
	string+='<input name="searchFile" value="'+$("#search").val()+'">';
	string+='</form>';
	$("body").append(string);
	$("#fm").submit();
	$("#fm").remove();
}
$(document).ready(function() {
	//初始化树形菜单
	$.fn.zTree.init($("#tree"), setting, zNodes);
	$("#upload_btn").click(function() {
		//判断用户是否已经登陆
		if(session_user==""){
			window.parent.location.href="../loginController/login";
		}else{
			var upload_div = $(window.parent.document).find("#upload_div");
			var top_bg_div=$(window.parent.document).find("#top_bg_div");
			upload_div.show();
			top_bg_div.show();
			upload_div.find("input[type='file']").click();
		}
	});
	$("#search_btn").click(function(){
		//搜索以搜索的内容作为主体
		createSearchFormAndSubmit();
	});
	$(window).keydown(function(event){
		if(event.keyCode==13&&$("#search").val().trim()!=""){
			createSearchFormAndSubmit();
		}
	});

});