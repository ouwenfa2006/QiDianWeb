    <!DOCTYPE html>  
    <%@ page contentType="text/html;charset=UTF-8"%>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <html xmlns="http://www.w3.org/1999/xhtml">  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
    <script src="http://code.jquery.com/jquery.js" type="text/javascript"></script>  
    <link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">  
    <link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet">  
    </head>  
    <body>  
            <form id='fForm' class="form-actions form-horizontal" action="/QiDianWeb/uploadFileAndDownController/uploadFile"   
                  encType="multipart/form-data" target="uploadf" method="post">  
                     <div class="control-group">  
                        <label class="control-label">上传文件:</label>  
                        <div class="controls">  
                            <input type="file" id="file" name="file" style="width:550">                    
                        </div>  
                        <label class="control-label">上传进度:</label>  
                        <div class="controls">  
                            <div  class="progress progress-success progress-striped" style="width:50%">  
                                <div  id = 'proBar' class="bar" style="width: 0%"></div>  
                            </div>  
                        </div>  
                    </div>  
                      
                     <div class="control-group">  
                        <div class="controls">  
                        <button type="button" id="subbut" class="btn">submit</button>  
                        </div>  
                    </div>  
            </form>  
            <iframe name="uploadf" style="display:none"></iframe>  
             <script type="text/javascript">
             $(document).ready(function() {  
                 $('#subbut').bind('click', function() {  
                     $('#fForm').submit();  
                  		var eventFun = function() {  
                         $.ajax({  
                             type : 'GET',  
                             url : '/QiDianWeb/uploadFileAndDownController/getPercent',  
                             data : {},  
                             dataType : 'text',  
                             success : function(data) {  
                                 $('#proBar').css('width', data+ '%');  
                                 $('#proBar').empty();  
                                 $('#proBar').append(data.show);  
                                 if (data == "100") {  
                                     window.clearInterval(intId);  
                                 }  
                             }  
                         });  
                     };  
                     var intId = window.setInterval(eventFun, 200);
                 });  
             });  
             </script>
    </body>  
    </html>  
  	