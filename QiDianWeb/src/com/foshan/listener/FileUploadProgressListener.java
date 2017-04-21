package com.foshan.listener;
import javax.servlet.http.HttpSession;  

import org.apache.commons.fileupload.ProgressListener;  
import org.springframework.stereotype.Component;  

import com.foshan.util.ProgressInfo;

  
@Component  
public class FileUploadProgressListener implements ProgressListener {  
    private HttpSession session;  
  
    public void setSession(HttpSession session){  
        this.session=session;  
        ProgressInfo status = new ProgressInfo();  
        session.setAttribute("status", status);  
    }  
  
    /*  
     * pBytesRead 到目前为止读取文件的比特数 pContentLength 文件总大小 pItems 目前正在读取第几个文件  
     */  
    public void update(long pBytesRead, long pContentLength, int pItems) {  
    	ProgressInfo status = (ProgressInfo) session.getAttribute("status");  
        status.setReadSize(pBytesRead);  
        status.setTotalSize(pContentLength);  
        status.setItemNum(pItems);  
    }  
  
}  