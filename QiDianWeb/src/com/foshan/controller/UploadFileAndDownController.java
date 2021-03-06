package com.foshan.controller;
import java.io.BufferedInputStream;
import java.io.File;  
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;    
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;    
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;    
import org.springframework.web.bind.annotation.RequestMapping;    
import org.springframework.web.bind.annotation.RequestMethod;    
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;    
import org.springframework.web.multipart.MultipartFile;

import com.foshan.entity.LearningMaterials;
import com.foshan.entity.User;
@Controller
@RequestMapping(value="/uploadFileAndDownController")
/*@Scope("prototype")*/
public class UploadFileAndDownController extends BaseController{
	public static Logger logger=Logger.getLogger(UploadFileAndDownController.class);
	private static Integer maxSize=50*1024*1024;
	private static String uploadPath="D:/upload";
	/**
	 * 上传文件
	 * @param file 从jsp页面取得的要上传的文件
	 * @param couseName 科目
	 * @param grade 年级
	 */
	@RequestMapping(value="/uploadFile")
	@ResponseBody
	public void uploadFile(@RequestParam MultipartFile file,String courseName,String grade,HttpServletRequest request){
		uploadFile_1(file, courseName, grade,request);
	}
	/**
	 * 上传文件
	 * @param file
	 * @param courseName
	 * @param grade
	 * @throws IOException
	 */
	private void uploadFile_1(MultipartFile file, String courseName,
			String grade,HttpServletRequest request){
		try {
			//清空判断标志
			request.getSession().removeAttribute("message");
			// 1获得上传的文件内容
			//byte[] bytes = file.getBytes();
			// 2获得upload的绝对路径
			String path = request.getServletContext().getRealPath("/WEB-INF/upload_files");//发布路径
			//String path=request.getServletContext().getInitParameter("uploadPath");//在web.xml中配置的路径
			//checkPath(path);
			// 3在服务器的upload_files目录下创建File对象
			
			String oname = file.getOriginalFilename(); // 上传文件的原始名字
			String newName = UUID.randomUUID().toString()+"_"+oname;	 
			File file2=new File(path,newName); // 4将上传的文件拷贝到指定的目录
			//FileUtils.writeByteArrayToFile(file2, bytes);等价于下面的IO操作
			//===================================================
			int length=0;
			byte[] b=new byte[1*1024*1024];
			double percent=0;
			long totalSize=file.getSize();
			//Integer maxSize=Integer.parseInt(request.getServletContext().getInitParameter("maxSize"));
			if(totalSize>(maxSize)){
				request.getSession().setAttribute("message","overMax");
				return;
			}
			BufferedInputStream in=new BufferedInputStream(file.getInputStream());
			FileOutputStream out=new FileOutputStream(file2);
			while((length=in.read(b))!=-1){
				percent+=length/(double)totalSize*100D;        //计算上传文件的百分比
				//System.out.println("已经上传了:"+percent);
				out.write(b,0,length);                      //向文件输出流写读取的数据
				request.getSession().setAttribute("percent",Math.round(percent)+"");    //将上传百分比保存到Session中
				Thread.sleep(1000);
			
			}
			out.flush();
			out.close();
			in.close();
			//==================================================
			request.getSession().setAttribute("message","success");
			createLearningMaterials(request,courseName, grade, path, newName,oname);
			logger.info("operator:上传文件"+newName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("error:上传文件失败"+e.getMessage());
			request.getSession().setAttribute("message","fail");
		}
	}
	/**
	 * 将上传文件保存至数据库中
	 * @param courseName
	 * @param grade
	 * @param path
	 * @param newName
	 */
	private void createLearningMaterials(HttpServletRequest request,String courseName, String grade,
			String path, String newName,String oname) {
		LearningMaterials learningMaterials=new LearningMaterials();
		learningMaterials.setCourseName(courseName);
		learningMaterials.setGrade(grade);
		learningMaterials.setFileName(oname);
		learningMaterials.setPath(path);
		learningMaterials.setAbsoulteFileName(newName);
		learningMaterials.setUploadTime(new Date());
		//===================================================
		User uploadUser=(User) request.getSession().getAttribute("session_user");
		//================================================
		learningMaterials.setUploadUser(uploadUser);
		getModelService().getLearningMaterialsService().addLearningMaterials(learningMaterials);

	}
	/**
	 * 判断上传文件是否成功
	 * @throws IOException
	 */
	@RequestMapping(value="/upload_isOver")
	@ResponseBody
	public String upload_isOver(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String message=(String) request.getSession().getAttribute("message");
		if(message!=null){	
			return message;
		}
		return "-1";
	}
	/**
	 * 取得文件的上传进度
	 * @return 返回上传进度
	 */
	@RequestMapping(value="/getPercent",method=RequestMethod.GET)
	@ResponseBody
	public String getPercent(HttpServletRequest request){
		String percent=(String) request.getSession().getAttribute("percent");
		if(percent==null){
			return "0";
		}
		System.out.println("get:"+percent);
		return percent;
	}
	/**
	 * 重置文件上传进度
	 * @return 返回上传进度
	 */
	@RequestMapping(value="/resetPercent",method=RequestMethod.GET)
	@ResponseBody
	public String resetPercent(HttpServletRequest request){
		request.getSession().removeAttribute("percent");
		return "success";
	}
	/**
	 * 检查路径是否存在，不存在则创建
	 * @param path
	 */
	private boolean checkPath(String path) {
		File file=new File(path);
		if(file.exists()==false){
			return file.mkdirs();
		}
		return true;
	}
	/**
	 * 文件下载
	 * @return 返回下载的实体对象
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/downLoad")
	public ResponseEntity downLoad(HttpServletRequest request) throws UnsupportedEncodingException{
		int fileId=Integer.parseInt(request.getParameter("fileId"));
		//用来封装响应头信息
		HttpHeaders responseHeaders =new HttpHeaders();
		//下载的附件类型
		responseHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 下载的附件的名称
		LearningMaterials materials=getModelService().getLearningMaterialsService().findById(fileId);
		String fileName=null;
		if(materials!=null){
			fileName=materials.getFileName();
			responseHeaders.setContentDispositionFormData("attachment",new String(fileName.getBytes("GB2312"), "ISO_8859_1"));
			//String path = getRequest().getServletContext().getRealPath("/WEB-INF/upload_files");
			String path=materials.getPath();
			// 将下载的文件封装流对象
			File file=new File(path,materials.getAbsoulteFileName());
			try {
				//将文件转换成字节流并返回至客户端
				logger.info("operator:下载文件"+fileName);
				materials.setDownloadCount(materials.getDownloadCount()+1);
				getModelService().getLearningMaterialsService().update(materials);
				return new ResponseEntity<>(FileUtils.readFileToByteArray(file),responseHeaders,HttpStatus.CREATED);		
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("error:下载文件失败"+fileName);
			}
		}
		logger.info("error:下载文件失败"+fileName);
		return null;
	}
}
