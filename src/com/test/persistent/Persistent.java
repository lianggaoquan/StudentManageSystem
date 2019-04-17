package com.test.persistent;

import java.lang.reflect.Method;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.test.dao.UserDAO;
import com.test.model.Student;


@Transactional
public class Persistent implements UserDAO {
	private ApplicationContext ac = new ClassPathXmlApplicationContext("ApplicationContext.xml");
	
	private SessionFactory sf = (SessionFactory)ac.getBean("sessionFactory");
	

	
	@Override
	public void save(Student student) {
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(student);
		session.getTransaction().commit();
		session.close();		
	}
	
	@Override
	public void delete(String name) {
		Session session = sf.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from Student as s where name=?0");
		query.setParameter(0,name);
		
		List<Student> resultSet = query.list();
		
		for(Student s:resultSet) {
			session.delete(s);
		}
		
		session.getTransaction().commit();
		session.close();
	}
	
	@Override
	public void update(String id, String field, String value) {
		Session session = sf.openSession();
		session.beginTransaction();
		Student s = (Student) session.get(Student.class, id);
		session.getTransaction().commit();
		
		try {
			Class clazz = Class.forName("com.test.model.Student");
			Method m = clazz.getDeclaredMethod(firstUpperSetMethod(field),value.getClass());
			System.out.println(m.getName());
			m.invoke(s, value);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		Session session2 = sf.openSession();
		session2.beginTransaction();
		
		session2.update(s);
		
		session2.getTransaction().commit();
		session2.close();
		session.close();
	}
	
	private String firstUpperSetMethod(String field) {
		return "set" + Character.toUpperCase(field.charAt(0)) + field.substring(1);
	}
	
}
