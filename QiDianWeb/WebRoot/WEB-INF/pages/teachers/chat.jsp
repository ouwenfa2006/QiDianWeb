<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/plugins/jsp/base2.jsp"></jsp:include>

<style type="text/css">
.container-fluid {
	width: 100%;
	padding: 0px;
}

.container-fluid>div {
	padding: 0px;
	width: 98.7%;
}
.container-fluid div{
	padding: 0px;
}


</style>
</head>
<body>
	<div class="container-fluid">
		<div class="col-md-12"  style="height: 600px;overflow: auto;border-bottom: 1px dashed silver;">
			<div class="message">
				<fmt:formatDate value="${chatTime }" pattern="yyyy-MM-dd HH:mm:ss"/><br>
				${chat_admin_text }
			</div>
			
			
		
		</div>
		
		<div class="col-md-12" style="margin-top: 10px;">
			<textarea class="form-control pull-left" rows="4" cols="" style="width: 50%;margin-left: 10px;"></textarea><button class="btn btn-info btn-lg pull-left"  style="width: 124px;height: 109px;margin-left: 5px;">发送</button>
		</div>		
	</div>
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</body>
</html>
