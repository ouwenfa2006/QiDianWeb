package com.foshan.util;

import java.util.LinkedList;
import java.util.List;

public class PageUtil {
	/**
	 * 取得某页的数据
	 * @param all
	 * @param page
	 * @param pageSize
	 * @return
	 */
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
}
