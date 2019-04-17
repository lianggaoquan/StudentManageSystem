package com.test.unitTest;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.junit.Test;

import com.test.model.Student;
import com.test.persistent.Persistent;

public class UnitTest {
	

	@Test
	public void test() {
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		
		Student s = new Student();
		s.setId("2");
		s.setName("test");
		s.setGender("Ů");
		s.setAge("18");
		s.setGrade("һ�꼶");
		
		Session session = sf.getCurrentSession();
		session.beginTransaction();
		session.save(s);
		session.getTransaction().commit();
		session.close();
	}
	
	@Test
	public void testNull() {
		String s = null;
		s = "abc";
		System.out.println(s);
	}
	
	@Test
	public void testLoad() {
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session session = sf.getCurrentSession();
		session.beginTransaction();
		//ʹ��hql���Բ�ѯ
		Student s = null;
		Query query = session.createQuery("from Student where name=?0");
		query.setParameter(0, "�����");
		
		List<Student> resultSet = query.list();
		
		for(Student stu:resultSet) {
			System.out.println(stu.getName());
		}
		
		
		session.getTransaction().commit();
		session.close();
		
	}
	
	
	@Test
	public void testUpdate() {
		new Persistent().update("1", "grade", "���꼶");
	}
	
	@Test
	public void testSpring() {
		new Persistent().update("1", "grade", "��");
	}
	

}
