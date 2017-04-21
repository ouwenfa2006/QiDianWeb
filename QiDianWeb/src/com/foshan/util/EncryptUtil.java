package com.foshan.util;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;
import java.security.MessageDigest;

public class EncryptUtil {

    public EncryptUtil() {
    }

    /**
     * SHA-1消息摘要算法
     */
    public static String encodeSHA(byte[] data) throws Exception {
        // 初始化MessageDigest,SHA即SHA-1的简称
        MessageDigest md = MessageDigest.getInstance("SHA");
        // 执行摘要方法
        byte[] digest = md.digest(data);
        return new HexBinaryAdapter().marshal(digest);
    }

    /**
     * SHA-256消息摘要算法
     */
    public static String encodeSHA256(byte[] data) throws Exception {
        // 初始化MessageDigest,SHA即SHA-1的简称
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        // 执行摘要方法
        byte[] digest = md.digest(data);
        return new HexBinaryAdapter().marshal(digest);
    }

    /**
     * SHA-384消息摘要算法
     */
    public static String encodeSHA384(byte[] data) throws Exception {
        // 初始化MessageDigest,SHA即SHA-1的简称
        MessageDigest md = MessageDigest.getInstance("SHA-384");
        // 执行摘要方法
        byte[] digest = md.digest(data);
        return new HexBinaryAdapter().marshal(digest);
    }

    /**
     * SHA-512消息摘要算法
     */
    public static String encodeSHA512(byte[] data) throws Exception {
        // 初始化MessageDigest,SHA即SHA-1的简称
        MessageDigest md = MessageDigest.getInstance("SHA-512");
        // 执行摘要方法
        byte[] digest = md.digest(data);
        return new HexBinaryAdapter().marshal(digest);
    }

    public static void main(String[] args) {
    	String username = "sam";
    	try {
			System.out.println(encodeSHA(username.getBytes()));
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
