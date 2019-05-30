<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<!-- 编写jqueyr代码 -->
<script type="text/javascript">
$(function(){
	$("#delButton").click(function(){
			var id = $("#stuId").val();
			id = $.trim(id);
			if (id == null || id == ""){
				alert("IDを入力してください");
				return false;
			}else {
				var stuId = /^[0-9]+$/
				if (!stuId.test(id)){
					alert("IDをチェックしてください");
					return false;


				} else {
					alert("完了")
					$("#delById").submit();
				}
			}

		});
  })





</script>



<title>Insert title here</title>
</head>
<body>


  <h3 align="center">学生情報</h3>
  <br>
  <br>
  <hr>
  <br>
  <br>

         <table id="studentList" border="2">
			<tr>
				<td>ID</td>
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
				<th>${student.teachername}</th>
			 </tr>
			</c:forEach>
		</table>

	<br>
	<br>
	<form id="delById" action="goToDeleteStudentById" method="post">
	  <h3>IDで学生情報を削除する</h3>
	  <br> <input id="sutId" name="id" type="text" placeholeder="IDを入力してください"　/>
      <br> <input id="delButton" type="submit" value="確認"/>

	</form>


  <br>
  <br>
  <hr>
  <br>
  <a href="welcome.jsp">ホームページへ戻す</a>

</body>
</html>