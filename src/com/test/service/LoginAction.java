package com.test.service;

import com.opensymphony.xwork2.ActionSupport;
import com.test.model.User;

public class LoginAction extends ActionSupport {
	// 用于提取用户的输入信息
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String login() {
		
		// System.out.println(user.getUserName());
		
		if(user.getUserName().equals("admin") && user.getPassword().equals("123")) {
			return "success";
		} else {
			return "fail";
		}
	}
}
