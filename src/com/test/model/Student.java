package com.test.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



/**
 * Ñ§ÉúÀà
 * @author lenov
 *
 */
@Entity
@Table(name="student")
public class Student {
	private String id;
	private String name;
	private String gender;
	private String age;
	private String grade;

	public Student(String id, String name, String gender, String age, String grade) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.grade = grade;
	}

	public Student() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
