<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="com.test.model.*" %>
<%@ page import="org.hibernate.*" %>
<%@ page import="org.hibernate.Hibernate.*" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查询结果</title>
</head>
<body>
	查询结果显示<br/><br/>
	
	<table border="1">
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>年级</td>
			</tr>
	
	<%
		String keyWords = request.getParameter("keyWords");
		String searchType = request.getParameter("searchType");
		
		// Configuration cfg = new Configuration();
		// SessionFactory sf = cfg.configure().buildSessionFactory();
		ApplicationContext ac = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		SessionFactory sf = (SessionFactory)ac.getBean("sessionFactory");
		Session session2 = sf.openSession();
		
		// 如果按名字搜索，则显示图片等资料
		if(searchType.equals("姓名")){
			
			// select * from Student where name = keyWords
			
			// 使用hibernate get / load方法从数据库加载对象
			session2.beginTransaction();
			Query query = session2.createQuery("from Student where name=?0");
			query.setParameter(0, keyWords);
			
			List<Student> resultSet = query.list();
			
			for (Student stu : resultSet) {
				%>	
				<tr>
					<td><%=stu.getId() %></td>
					<td><%=stu.getName() %></td>
					<td><%=stu.getGender() %></td>
					<td><%=stu.getAge() %></td>
					<td><%=stu.getGrade() %></td>
				</tr>
			
			<%
			}
			session2.getTransaction().commit();
			session2.close();

		}

		if (searchType.equals("学号")) {
			// select * from Student where id = keyWords
			%>
			
			<%
			session2.beginTransaction();
			Query query = session2.createQuery("from Student where id=?0");
			query.setParameter(0, keyWords);

			List<Student> resultSet = query.list();

			for (Student stu : resultSet) {
				%>	
				<tr>
					<td><%=stu.getId() %></td>
					<td><%=stu.getName() %></td>
					<td><%=stu.getGender() %></td>
					<td><%=stu.getAge() %></td>
					<td><%=stu.getGrade() %></td>
				</tr>
			
			<%
			}
			
			session2.getTransaction().commit();
			session2.close();
		}
		
		%>
		</table>
	
</body>
</html>