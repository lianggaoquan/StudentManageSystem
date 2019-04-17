<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.test.persistent.Persistent" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>更新提示</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String updateField = request.getParameter("updateField");
		String updateValue = request.getParameter("updateValue");

		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("学号", "id");
		map.put("姓名","name");
		map.put("性别","gender");
		map.put("年龄","age");
		map.put("年级","grade");
		
		String field = map.get(updateField);
		
		new Persistent().update(id, field, updateValue);
	%>
	数据更新成功！
</body>
</html>