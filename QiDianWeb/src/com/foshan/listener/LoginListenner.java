package com.foshan.listener;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.foshan.entity.UserSession;
import com.foshan.util.Constant;
/**
 * 用户登陆及退出监听器
 * @author Administrator
 *
 */
@WebListener
public class LoginListenner implements HttpSessionAttributeListener {
	private  Map<String, HttpSession> map = new HashMap<String, HttpSession>();
	public void attributeAdded(HttpSessionBindingEvent event) {
		String name = event.getName();
		if (name.equals(Constant.SESSION_USER_SESSION)) {
			UserSession userSession = (UserSession) event.getValue();
			//如果用户已经登陆了
			if (map.get(userSession.getUsername()) != null) {
				System.out.println("用户已经登陆，开始销毁用户重新登陆");
				HttpSession session = map.get(userSession.getUsername());
				session.removeAttribute(Constant.SESSION_USER_SESSION);
				session.invalidate();
			}
			map.put(userSession.getUsername(), event.getSession());
		}

	}

	public void attributeRemoved(HttpSessionBindingEvent event) {
		String name = event.getName();
		if (name.equals(Constant.SESSION_USER_SESSION)) {
			System.out.println("用户退出了");
			UserSession userSession = (UserSession) event.getValue();
			map.remove(userSession.getUsername());

		}
	}

	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

}