package com.foshan.controller;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foshan.entity.User;
import com.foshan.entity.UserSession;
import com.foshan.service.UserService;
import com.foshan.util.Constant;
import com.p6spy.engine.spy.appender.LogManager;
import com.p6spy.engine.spy.appender.LogService;



@Controller
@RequestMapping("/loginController")
@Scope("prototype")
public class LoginController extends BaseController{
	public static Logger logger=Logger.getLogger(LoginController.class);
	/**
	 * 登陆验证
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login")
	public String login(final User user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(user.getUserName()!=null&&user.getPassword()!=null){
			/*//由于没有数据库，故所有的用户都在通过IO读取,位置在/QiDianWeb/userInfos/users.txt
			String basePath=getRequest().getServletContext().getRealPath("");
			File file=new File(basePath+"/userInfos/users.txt");	
			if(file!=null){
				BufferedReader bufferedReader=null;
				try {
					bufferedReader=new BufferedReader(new InputStreamReader(new FileInputStream(file)));
					String data;
					while((data=bufferedReader.readLine())!=null){
						String userName=data.split(",")[0];
						String userPassword=data.split(",")[1];
							
							if(user.getUserName().equals(userName)&&user.getPassword().equals(userPassword)){
								getRequest().getSession().setAttribute("session_user", user);						
								getResponse().sendRedirect("/QiDianWeb/index.jsp");
								return null;			
							}
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}finally{
					if(bufferedReader!=null){
						try {
							bufferedReader.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}*/
			User user2=getModelService().getUserService().login(user);
			if(user2!=null){
				if(user2.getIsLogin().equals(1)){
					request.setAttribute(Constant.LOGIN_ERROR, "-1");//-1表示已经登陆了
					return "/user/login";
				}
				request.getSession().setAttribute(Constant.SESSION_USER, user2);
				//user2.setIsLogin(1);
				//getModelService().getUserService().updateUserLoginState(user2);
				recordUserSession(user, request); 
				//getResponse().sendRedirect("/QiDianWeb/index.jsp");
				logger.info("operator:"+user2.getUserName()+"登陆系统");
				
				return "redirect:/index.jsp";
			}
		}	
		return "/user/login";
	}
	/**
	 * 记录用户登陆信息
	 * @param user
	 * @param request
	 */
	private void recordUserSession(final User user, HttpServletRequest request) {
		String userHost = request.getRemoteHost();            
		 String sessionId = request.getSession().getId();           
		 UserSession userSession = new UserSession();     
		 userSession.setUsername(user.getUserName());    
		 userSession.setSessid(sessionId);      
		 userSession.setAddr(userHost);
		 request.getSession().setAttribute(Constant.SESSION_USER_SESSION,userSession);
	}
	
	
	
}
