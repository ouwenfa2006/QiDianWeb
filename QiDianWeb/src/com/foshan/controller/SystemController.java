package com.foshan.controller;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.foshan.entity.LearningMaterials;
import com.foshan.util.PageUtil;

@Controller
@RequestMapping(value="/systemController")
public class SystemController extends BaseController{
	public static Logger logger=Logger.getLogger(SystemController.class);
	private int pageSize=46;
	/**
	 * 回到主页
	 */
	@RequestMapping(value="/index")
	public void index(){

		try {
			getResponse().sendRedirect("/QiDianWeb/index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 进入教师信息页面
	 * @return
	 */
	@RequestMapping("/getTeachersInfo")
	public String getTeachersInfo(){

		return "/teachers/teachersInfo";
	}
	/**
	 * 进入活动页面
	 * @return
	 */
	@RequestMapping("/getActivities")
	public String getActivities(){
		return "/activities/activities";
	}
	/**
	 * 进入课堂信息页面
	 * @return
	 */
	@RequestMapping("/getClasses")
	public String getClasses(){
		return "/classes/classes";
	}
	/**
	 * 进入校区页面
	 * @return
	 */
	@RequestMapping("/getSchools")
	public String getSchools(){
		return "/schools/schools";
	}
	/**
	 * 进入辅导资料页面
	 * @return
	 */
	@RequestMapping("/getCounselingInformation")
	public String CounselingInformation(){
		return "/CounselingInformation/CounselingInformations";
	}
	@RequestMapping("/getCourses")
	public void getCourses() throws ServletException, IOException{
		getRequest().getRequestDispatcher("/plugins/jsp/iframe_init.jsp").forward(getRequest() , getResponse());
	}
	/**
	 * 进入关于我们
	 * @return
	 */
	@RequestMapping("/getQiDianInfos")
	public String getQiDianInfos(){
		return "/qidianInfos/qidianInfos";
	}
	/**
	 * 取得所有已经上传的文件，不分学科
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/getAllLeanrningMaterials")
	public String getAllLeanrningMaterials(HttpServletRequest request) throws UnsupportedEncodingException{
		//取得辅导资料页面传过来的参数
		String grade=request.getParameter("grade");
		String courseName=request.getParameter("courseName");
		//符合条件的搜索
		List<LearningMaterials> all_learns=getLearningMaterialsService().findAllLearningMaterials(1,1500,grade,courseName);
		savePageInfos(request, all_learns);

		return "/CounselingInformation/counselingInformations_list";
	}
	@RequestMapping("getFilesBySearch")
	public String getFilesBySearch(HttpServletRequest request){
		//取得辅导资料页面传过来的参数
		String searchFile=request.getParameter("searchFile");
		//符合条件的搜索
		List<LearningMaterials> all_learns=getLearningMaterialsService().findLearningMaterialsByFileName(searchFile);
		//保存，以作分页操作
		savePageInfos(request, all_learns);
		return "/CounselingInformation/counselingInformations_list";
	}
	private void savePageInfos(HttpServletRequest request,
			List<LearningMaterials> all_learns) {
		getSession().removeAttribute("all_learns");
		getSession().setAttribute("all_learns", all_learns);
		if(all_learns!=null&&all_learns.size()>0){
			//每一页的结果
			List<LearningMaterials> learn_list=PageUtil.getShow(all_learns,1,pageSize);
			request.setAttribute("learn_list", learn_list);
		}
		//保存页面参数
		request.setAttribute("page",1);
		getSession().removeAttribute("totalPage");
		int result=all_learns.size()%pageSize;
		if(result==0){
			getSession().setAttribute("totalPage", all_learns.size()/pageSize);
		}else{
			getSession().setAttribute("totalPage", all_learns.size()/pageSize+1);
		}
	}
	/**
	 * 从搜索的结果集中进行分页显示
	 * @param request
	 * @return
	 */
	@RequestMapping(value="getFilesFromList")
	public String getFilesFromList(HttpServletRequest request){
		String page=request.getParameter("page");
		if(page==null){
			page="1";
		}
		if(page.equals("0")){
			page="1";
		}
		List<LearningMaterials> all_learns=(List<LearningMaterials>) getSession().getAttribute("all_learns");
		List<LearningMaterials> learn_list=PageUtil.getShow(all_learns,Integer.parseInt(page),pageSize);
		request.setAttribute("page", Integer.parseInt(page));
		request.setAttribute("learn_list", learn_list);
		return "/CounselingInformation/counselingInformations_list";
	}
	/**
	 * 进入公司地理位置页面
	 * @return
	 */
	@RequestMapping(value="/getLocation")
	public String getLocation(){
		return "/qidianInfos/location";
	}


}

