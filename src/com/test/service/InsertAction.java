package com.test.service;

import com.opensymphony.xwork2.ActionSupport;
import com.test.model.Student;
import com.test.persistent.Persistent;

public class InsertAction extends ActionSupport {
	private Student student;
	
	public Student getStudent() {
		return student;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	public String insert() {
		
		// 将student对象插入到数据库中
		new Persistent().save(student);
		return "success";
	}
}
