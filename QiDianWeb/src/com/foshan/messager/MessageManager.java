package com.foshan.messager;

public class MessageManager {
	
	//private final static String SN = "DXX-BBX-101-19504";
	//private final static String PWD = "923291";
	private final static String SN = "SDK-BBX-010-21032";
	private final static String PWD = "b$f-3df6";
	
	/**
	 * 调用发短信接口
	 * @param mobile
	 * @param content
	 * @return
	 */
	public static int sendMsg(String mobile,String content){
		try{
			Client client= new Client(SN,PWD);
			if(content.indexOf("&")>=0) {
				content = content.replace("&","&amp;");
			}
			if(content.indexOf("<")>=0){
				content = content.replace("<","&lt;");
			}
			if(content.indexOf(">")>=0) {
				content = content.replace(">","&gt;");
			}
			/*
			 * 方法名称：mt 
			 * 功    能：发送短信 ,传多个手机号就是群发，一个手机号就是单条提交
			 * 参    数：mobile,content,ext,stime,rrid(手机号，内容，扩展码，定时时间，唯一标识)
			 * 返 回 值：唯一标识，如果不填写rrid将返回系统生成的
			 */	
			String result_mt = client.mt(mobile, content, "", "", "");
			if(result_mt.startsWith("-")||result_mt.equals("")){ //以负号判断是否发送成功
				System.out.print("发送失败！返回值为："+result_mt+"。");
				return 0;
			}
		    else{  //输出返回标识，为小于19位的正数，String类型的，记录发送的批次
				System.out.print("发送成功，返回值为："+result_mt);
				return 1;
			}
		}
		catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
}
