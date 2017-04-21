<%@page import="java.text.SimpleDateFormat"%>
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
		<div class="col-md-12" id="console-container"  style="height: 450px;overflow: auto;border-bottom: 1px dashed silver;">
			<div class="message" id="console">
				<fmt:formatDate value="${chatTime }" pattern="yyyy-MM-dd HH:mm:ss"/><br>
				${chat_admin_text }
			</div>
			
			
		
		</div>
    </div>
		
		<div class="col-md-12" style="margin-top: 10px;">
			<input class="form-control pull-left" style="width: 50%;margin-left: 10px;" id="chat"></input><button id="sendBtn" class="btn btn-info pull-left"  style="margin-left: 5px;" onclick="sendMessage()">发送</button>
		</div>
		<input id="toChaterId" type="hidden" value="${toChaterId }">	
		<input id="client_sessionId" type="hidden" value="${client_sessionId }">
	</div>
	<script type="text/javascript">

     function sendMessage(){
    	 var text=$("#chat").val();
    	 $("#chat").val("");
    	 $("#chat").focus();
    	 var sessionId=$("#client_sessionId").val();
    	 var toChaterId=$("#toChaterId").val();
    	 if(text.trim()==""){
    		 alert("你不能发送空白信息");
    		 return false;
    	 }
    	 //配置参数
    	 var params={
    		"cmsg.text":text,
    		"cmsg.sessionId":sessionId,
    		"cmsg.toChaterId":toChaterId
    	 };
    	 var url="../message/client";
    	 
    	 //发送请求
    	 $.post(url,params,function(data){
    		 if(data=="1"){
    			 var string1='<p style="word-wrap:break-word;">'+'<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>'+'<p>';
    	    	 $("#console").append(string1);
    	    	 var string2='<p style="word-wrap:break-word;margin-top:-22px;">';
    	    	 string2+="管理员:"+text;
    	    	 string2+='</p>';
    	    	 $("#console").append(string2);
    	         if($("#console").height()>450){
    	        	 $("#console").parent("div").scrollTop($("#console").height());
    	         }
    		 }
    	 });	
     }
     //轮询数据
     function getMessage(){
    	 //设置轮询
    	 var sessionId=$("#client_sessionId").val();
		 var toChaterId=$("#toChaterId").val();
		 var url=basePath+"chat/adminMsg?sessionId="+sessionId+"&toChaterId="+toChaterId;
    	 setInterval(function(){
        	 $.get(url,function(data){
        		 if(data!=null&&data!="-1"){
        			 var messages=eval(data);
            		 $(messages).each(function(){
            			 var string1='<p style="word-wrap:break-word;">'+this.createTime+'<p>';
            	    	 $("#console").append(string1);
            	    	 var string2='<p style="word-wrap:break-word;margin-top:-22px;">';
            	    	 string2+="游客:"+this.text;
            	    	 string2+='</p>';
            	    	 $("#console").append(string2);
            	         if($("#console").height()>450){
            	        	 $("#console").parent("div").scrollTop($("#console").height());
            	         }
            		 });
        		 }
        	 });
    	 }, 4000);
     }
	$(function(){
		//轮询读数据
		getMessage();
		//发送事件
		$("#chat").keydown(function(e){
			if(e.keyCode==13){
				sendMessage();
			}
		});
	});
	</script>
	
</body>
</html>
