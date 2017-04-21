package com.foshan.util;

import java.util.ArrayList;
import java.util.List;
/**
 * session 管理工具
 * @author XiaoUS
 *
 */
public class SessionManager{
	private static List<String> sessions;
	static{
		sessions=new ArrayList<String>();
	}
	/**
	 * 添加sessionID
	 * @param sessionId
	 */
	public static void addSessionId(String sessionId){
		sessions.add(sessionId);
	};
	/**
	 * 删除sessionId
	 * @param sessionId
	 */
	public static boolean removeSessionId(String sessionId){
		return sessions.remove(sessionId);
	};
	/**
	 * 判断是否包含
	 * @param sessionId
	 * @return
	 */
	public static boolean contains(String sessionId){
		return sessions.contains(sessionId);
	};
	/**
	 * 取得session数量
	 * @return
	 */
	public static Integer getSessionSize(){
		return sessions.size();
	};
	/**
	 * 根据下标取得sessionId
	 * @param i
	 * @return
	 */
	public static String getSessionId(int i){
		return sessions.get(i);
	};
	public static void removeAll(){
		sessions.clear();
	};
}
