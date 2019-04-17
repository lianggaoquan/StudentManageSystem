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
		
		// ��student������뵽���ݿ���
		new Persistent().save(student);
		return "success";
	}
}
