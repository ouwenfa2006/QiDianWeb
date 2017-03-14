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
			<textarea class="form-control pull-left" rows="4" cols="" style="width: 50%;margin-left: 10px;" id="chat"></textarea><button id="sendBtn" class="btn btn-info btn-lg pull-left"  style="width: 124px;height: 109px;margin-left: 5px;">发送</button>
		</div>
		<input id="input_user" type="hidden" value="${admin }">	
	</div>
	<script type="text/javascript">
	 "use strict";
     var Chat = {};
     Chat.socket = null;
     //连接WebSocket
     Chat.connect = (function(host) {
    	 //判断浏览器是否支持WebSocket
         if ('WebSocket' in window) {
             Chat.socket = new WebSocket(host);
         } else if ('MozWebSocket' in window) {
             Chat.socket = new MozWebSocket(host);
         } else {
             Console.log('你的浏览器版本过低,不支持在线聊天,建议使用360浏览器极速模式!');
             return;
         }
		//socket开启事件
         Chat.socket.onopen = function () {
             //Console.log('Info: WebSocket connection opened.');
             document.getElementById('chat').onkeydown = function(event) {
                 if (event.keyCode == 13) {
                     Chat.sendMessage();
                 }
             };
             $("#sendBtn").click(function(){
            	 Chat.sendMessage();
             });
             
         };
		//socket关闭事件
         Chat.socket.onclose = function () {
             document.getElementById('chat').onkeydown = null;
             Console.log('游客离开了!');
         };
		//发送消息事件
         Chat.socket.onmessage = function (message) {  	 
             Console.log(message.data);
         };
     });
	//Chat初始化
     Chat.initialize = function() {
         if (window.location.protocol == 'http:') {
             Chat.connect('ws://' + window.location.host + '/examples/websocket/chat');
         } else {
             Chat.connect('wss://' + window.location.host + '/examples/websocket/chat');
         }
     };
	//发送消息
     Chat.sendMessage = (function() {
         var message=$("#chat").val().trim();
         if (message!='') {
             Chat.socket.send(message);
             document.getElementById('chat').value = '';
             return;
         }
         alert("你不能发送空白消息!");
         
     });
	//系统发送消息
     var Console = {};
     Console.log = (function(message) {
    	 if(message.indexOf("has joined")>=0){
    		 message="";
    		 return;
    	 }
    	 var date=new Date();
    	 var time=date.toLocaleString();
    	 var string1='<p style="word-wrap:break-word;">'+time+'<p>';
    	 $("#console").append(string1);
    	 var string2='<p style="word-wrap:break-word;">';
    	 if($("#input_user").val()=="adamin"){		 
    		 string2+='管理员说:'+message;
    	 } 
    	 if($("#input_user").val()==""&&message!=""){	
    	 string2+=message;
    	 }
    	 string2+='</p>';
    	 $("#console").append(string2);
         var console = document.getElementById('console');
         if($("#console").find("p").length>13){
        	 $("#console").scrollTop();
         }
         
        /*  while (console.childNodes.length > 13) {
             console.removeChild(console.firstChild);
         }
         console.scrollTop = console.scrollHeight;
          */
     });
     Chat.initialize();
     document.addEventListener("DOMContentLoaded", function() {
         // Remove elements with "noscript" class - <noscript> is not allowed in XHTML
         var noscripts = document.getElementsByClassName("noscript");
         for (var i = 0; i < noscripts.length; i++) {
             noscripts[i].parentNode.removeChild(noscripts[i]);
         }
     }, false);
     //用户发送消息
	function sendMessage(){
		var date=new Date();
   	 var time=date.toLocaleString();
   	 var string1='<p style="word-wrap:break-word;">'+time+'<p>';
   	 $("#console").append(string1);
   	 var string2='<p style="word-wrap:break-word;">';
   	 if($("#input_user").val()=="adamin"){		 
   		 string2+='管理员说:'+message;
   	 } 
   	 if($("#input_user").val()==""){
   		 string2+='游客说:'+message;
   	 }
   	 string2+='</p>';
   	 $("#console").append(string2);
        var console = document.getElementById('console');
        if($("#console").find("p").length>13){
       	 $("#console").scrollTop();
        }
       /*  while (console.childNodes.length > 13) {
            console.removeChild(console.firstChild);
        }
        console.scrollTop = console.scrollHeight;
         */
		
	}
	$(function(){
			
	});
	</script>
	
</body>
</html>
