package com.foshan.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foshan.entity.User;



@Controller
@RequestMapping("/loginController")
public class LoginController extends BaseController{
	public static Logger logger=Logger.getLogger(LoginController.class);
	/**
	 * 登陆验证
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login")
	public String login(User user,HttpServletRequest request) throws Exception{
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
				request.getSession().setAttribute("session_user", user2);
				//getResponse().sendRedirect("/QiDianWeb/index.jsp");
				logger.info("operator:"+user2.getUserName()+"登陆系统");
				
				return "redirect:/index.jsp";
			}
		}	
		return "/user/login";
	}
	
}
