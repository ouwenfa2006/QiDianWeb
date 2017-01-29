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
    						<th style="width: 12%;">上传者</th>
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
		var pPage="${page-1}";//前一页
		var nPage="${page+1}";//下一页
		var size="${fn:length(page_list)}";//每一页的数量
    	var totalPage=parseInt("${totalPage}");//总共的页数
    	</script>
    	<script type="text/javascript" src="../plugins/js/counselingInformations_list.js"></script>
  </body>
</html>
