<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 添加函数库，可以在jsp页面使用foreatch循環 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 添加函数库,使用EL表达式 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理システム</title>
</head>
<body>

	<h3>学生の情報一覧</h3>
	<br>
	<hr>
	<br>
	<br>
	<table border="1">
		<tr>
			<th>順番</th>
			<td>名前</td>
			<td>生年月日</td>
			<td>年齢</td>
			<td>成績</td>
			<td>クラス</td>
			<td>住所</td>
			<th>先生</th>
		</tr>
		<c:forEach items="${stuList}" var="student">
			<tr>
				<td>${student.id}</td>
				<td>${student.name}</td>
				<td>${student.birthday}</td>
				<td>${student.age}</td>
				<td>${student.score}</td>
				<td>${student.classid}</td>
				<td>${student.address}</td>
				<td>${student.teachername}</td>
			</tr>

		</c:forEach>
	</table>

	<br>
	<hr>
	<a href="welcome.jsp">ホームページへ戻す</a>



</body>
</html>