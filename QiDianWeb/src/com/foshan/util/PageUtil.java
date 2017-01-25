package com.foshan.util;

import java.util.LinkedList;
import java.util.List;

import com.foshan.entity.LearningMaterials;

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
}
