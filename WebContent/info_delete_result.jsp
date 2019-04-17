<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.test.model.Student" %>
<%@ page import="com.test.persistent.Persistent" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>删除页面</title>
</head>
<body>
	<%
		String deleteName = request.getParameter("deleteName");
		new Persistent().delete(deleteName);
	%>
	删除用户成功！<br/>
</body>
</html>