<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>信息查询</title>
</head>
<body>
<!-- 利用form表单向 info_check_result.jsp 传递参数 -->
	<form action="info_check_result" method="post">
		输入搜索关键字:<input type="text" name="keyWords"/><br/><br/>
		<select name="searchType">
			<option value="姓名">按姓名搜</option>
			<option value="学号">按学号搜</option>
		</select>
		<input type="submit" value="搜索"/> <input type="reset" value="取消 "/>
	</form>
	
	
</body>
</html>