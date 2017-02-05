package com.foshan.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * 用于获得JSON对象的类
 * @author Administrator
 *
 */
public class JsonUtil {
	/**
	 * 将一个javaBean转化成JSONObject
	 * @param o 需要转化的对象
	 * @return 返回javaBean转化成的JSONobject
	 */
	public static JSONObject  getJsonObject(Object o){
		JSONObject jsonObject=new JSONObject();
		Field[] fields=o.getClass().getDeclaredFields();
		for (Field field : fields) {
			try {
				String methodName="get"+field.getName().substring(0, 1).toUpperCase()+field.getName().substring(1);
				if(methodName.equals("getSerialVersionUID")){
					continue;
				}
				Method method=o.getClass().getDeclaredMethod(methodName);
				method.setAccessible(true);
				Object value=method.invoke(o);
				if(value!=null){
					if(value.getClass()==Date.class){
						SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
						value=dateFormat.format(value);
					}
				}
				jsonObject.put(field.getName(), value);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return jsonObject;
	}
	/**
	 * 将一个数组转化成JSONArray
	 * @param objects 需要转化的数组
	 * @return 转化数组提到的JSONArray
	 */
	public static JSONArray getJsonArray(Object...objects){
		JSONArray array=new JSONArray();
		for (Object object : objects) {
			array.put(getJsonObject(object));
		}
		return array;
	};
}
