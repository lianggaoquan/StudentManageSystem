<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>更新页面</title>
</head>
<body>
	<form action="info_update_result" method="post">
		更新用户数据：<br/><br/>
		需更新用户的id: <input type="text" name="id"/><br/><br/>
		需要更新哪个属性？ <input type="text" name="updateField"/><br/><br/>
		新的数据：<input type="text" name="updateValue"/><br/><br/>
		<input type="submit" value="确定"/> <input type="reset" value="取消 "/>
	</form>
</body>
</html>