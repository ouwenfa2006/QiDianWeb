package com.foshan.entity;
/**
 * 限制用户登陆辅助类
 * @author Administrator
 *
 */
public class UserSession {
	private String addr;
    private String sessid;
    private String username;
    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getSessid() {
        return sessid;
    }

    public void setSessid(String sessid) {
        this.sessid = sessid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

	@Override
	public String toString() {
		return "UserSession [addr=" + addr + ", sessid=" + sessid
				+ ", username=" + username + "]";
	}

}
