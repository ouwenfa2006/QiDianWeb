package com.foshan.util;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class ToolSendMsg {

	private final static String UID = "gdcirrus";
	private final static String KEY = "dc26ac55a11b12c2a4b9";
	private static Map<String,String> errorMap = new HashMap<String,String>();
	static{
		errorMap.put("1", "成功");
		errorMap.put("-2", "没有该用户账户");
		errorMap.put("-3", "短信数量不足");
		errorMap.put("-4", "手机号格式不正确");
		errorMap.put("-6", "IP限制");
		errorMap.put("-11", "该用户被禁用");
		errorMap.put("-14", "短信内容出现非法字符");
		errorMap.put("-21", "MD5接口密钥加密不正确");
		errorMap.put("-41", "手机号码为空");
		errorMap.put("-42", "短信内容为空");
		errorMap.put("-51", "接口签名格式为：【签名内容】");
	}
	public static int sendMsg(String mobile,String content){
		int result = 0;
		try{
			HttpClient client = new HttpClient();
			PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
			post.addRequestHeader("Content-Type",
					"application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
			NameValuePair[] data = { new NameValuePair("Uid", UID),
					new NameValuePair("Key", KEY),
					new NameValuePair("smsMob", mobile),
					new NameValuePair("smsText", content) };
			post.setRequestBody(data);
	
			client.executeMethod(post);
			int statusCode = post.getStatusCode();
			System.out.println("statusCode:" + statusCode);
			String resultStr = new String(post.getResponseBodyAsString().getBytes("gbk"));
			result = Integer.valueOf(resultStr).intValue();
			System.out.println(result); // 打印返回消息状态
			post.releaseConnection();
		}
		catch(Exception e){
			result = -99;
			e.printStackTrace();
		}
		return result;
	}
	
	public static String getErrorMsg(String errorCode){
		return errorMap.get(errorCode);
	}
	
	public static void main(String[] args)  throws Exception{
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", UID),
				new NameValuePair("Key", KEY),
				new NameValuePair("smsMob", "13516553143"),
				new NameValuePair("smsText", "验证码：8888") };
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:" + statusCode);
		for (Header h : headers) {
			System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes(
				"gbk"));
		System.out.println(result); // 打印返回消息状态

		post.releaseConnection();
	}

}
