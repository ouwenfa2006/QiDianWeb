<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
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
#l_table>thead>tr>th{
	text-align: center;
}
#l_table>tbody>tr>td{
	text-align: center;
}
#l_table tr{
	border-bottom: 1px dotted silver;
	line-height: 30px;
}
</style>
  </head>
  <body>
    	<div class="container-fluid" style="height:1549px;border:1px solid silver;">
    		<div class="col-md-12">
    			<table id="l_table" style="width: 100%;">
    				<thead>
    					<tr>
    						<th style="width:12%;">上传时间</th>
    						<th>文件名称</th>
    						<th style="width: 8%;">下载次数</th>
    						<th style="width: 8%;">上传者</th>
    					</tr>
    				</thead>
    				<tbody>
    					<c:forEach items="${learn_list }" var="m">
    						<tr>
    							<td><fmt:formatDate value="${m.uploadTime}" pattern="yyyy-MM-dd"/></td>
    							<td><a role="download_a"  href="${basePath }uploadFileAndDownController/downLoad?fileId=${m.lId}" target="uploadIframe">${m.fileName }</a></td>
    							<td>${m.downloadCount }</td>
    							<td>${m.uploadUser.userName }</td>
    						</tr>
    					</c:forEach>
    				</tbody>
    			</table>
    		</div>
    		<div class="col-md-12" style="padding-top: 10px;">
    			<div class="pull-left col-md-12">
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="index()">首页</a>
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="prePage()">上一页</a>
    				<a class="btn btn-info pull-left" href="javaScript:void(0)" style="margin-left: 5px;" onclick="nextPage()">下一页</a>
    				<span class="pull-left" style="margin-left: 5px;margin-top: 5px;">跳转:</span>
    				<input id="inputPage" class="form-control pull-left" name="page" value="${page }" style="width: 10%;">
    				<div class="pull-left" style="margin-top: 5px;">
    						<span class="pull-left">页&nbsp;&nbsp;第</span>
    						<span class="pull-left" style="color: red;">${page }</span>
    						<span class="pull-left">页</span>
    						<span class="pull-left">&nbsp;&nbsp;共</span>
    						<span class="pull-left" style="color: red;">${fn:length(all_learns) }</span>
    						<span class="pull-left">条记录</span>
    						<span class="pull-left">&nbsp;&nbsp;共</span>
    						<span class="pull-left" style="color: red;">${totalPage }</span>
    						<span class="pull-left">页</span>
    				</div>
    			</div>
    		</div>
    	</div>
    	<script type="text/javascript">
    	var page="${page}";//当前页
		/* var courseName="${courseName}";//科目名称
		var gradeName="${grade}";//年级
		var searchFile="${searchFile}";//搜索的文件名称 */
		var pPage="${page-1}";//下一页
		var nPage="${page+1}";//前一页
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
	        		if(parseInt($(this).val())>parseInt("${totalPage}")){
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
    		var size="${fn:length(learn_list)}";//每页显示的数量
    		if(nPage>parseInt("${totalPage}")){
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
 
    	</script>
  </body>
</html>
