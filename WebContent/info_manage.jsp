<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="com.test.model.Student" %>
<%@ page import="com.test.persistent.Persistent" %>
<%@ page import="org.hibernate.*" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>信息管理</title>
</head>
<body>
	信息管理页面
	<!-- 显示学生信息表格 -->
	<table border="1">
		<tr>
			<td>学号</td>
			<td>姓名</td>
			<td>性别</td>
			<td>年龄</td>
			<td>年级</td>
		</tr>
		<%
			Configuration cfg = new Configuration();
			SessionFactory sf = cfg.configure().buildSessionFactory();
			Session session2 = sf.getCurrentSession();
			session2.beginTransaction();
			Query query = session2.createQuery("from Student as s");
			//query.setParameter(0, keyWords);
			
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
		%>
	</table>
	<br/><br/>
	
	<a href="info_delete.jsp">删除学生信息</a>
	<br/><br/>
	
	<a href="info_update.jsp">更新数据</a>
</body>
</html>