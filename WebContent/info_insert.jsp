<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息录入</title>
</head>
<body>
	<form action="info_insert">
		学号:<input type="text" name="student.id"/><br/><br/>
		姓名:<input type="text" name="student.name"/><br/><br/>
		性别:<select name="student.gender">
				<option value="男">男</option>
				<option value="女">女</option>
			</select><br/><br/>
		年龄:<input type="text" name="student.age"/><br/><br/>
		年级:<input type="text" name="student.grade"/><br/><br/>
		<input type="submit" value="提交"/> <input type="reset" value="取消 "/>
		
		
	</form>
</body>
</html>