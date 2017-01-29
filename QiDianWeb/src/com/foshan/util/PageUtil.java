package com.foshan.util;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PageUtil {
	public static List getShow(List all,int page,int pageSize) {
		List list=new LinkedList();
		int start=(page-1)*pageSize;
		int end=page*pageSize;
		for (int i = start; i <end; i++){
			if(i<all.size()){
				list.add(all.get(i));
			}else{
				break;
			}
		}
		return list;
	}
	/**
	 * 根据搜索的结果集分页显示,以page_list保存
	 * @param request
	 * @param list 搜索到的全部结果
	 * @param pageSize
	 */
	public static void savePageInfos(HttpServletRequest request,List<?> list,int pageSize){
		HttpSession session=request.getSession();
		session.removeAttribute("list");
		session.setAttribute("list", list);
		if(list!=null&&list.size()>0){
			//第一页的结果
			List<?> page_list=getShow(list,1,pageSize);
			request.setAttribute("page_list", page_list);
		}
		//保存页面参数
		request.setAttribute("page",1);
		session.removeAttribute("totalPage");
		int result=list.size()%pageSize;
		if(result==0){
			session.setAttribute("totalPage", list.size()/pageSize);
		}else{
			session.setAttribute("totalPage", list.size()/pageSize+1);
		}
	}
}
