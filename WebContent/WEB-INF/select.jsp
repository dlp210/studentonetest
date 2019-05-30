<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 导入jquery库 -->
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<!-- 编写jqueyr代码 -->
<script type="text/javascript">
  	$(function(){
  		$("#idButton").click(function(){
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
   					$("#queryById").submit();
   				}
  			}

  		});
  		$("#nameButton").click(function(){
  		        			 var name = $("#stuName").val();
  		        			 name = $.trim(name);

  		        			 if(name == null || name == ""){
  		        				 alert("名前を入力してください");
  		        				 return false;

  		        			 }else{
  		        				 var stuName = /^[\u3040-\u309F\u30A0-\u30FF\u4e00-\u9fa5A-Za-z]+$/;
  		        				 if (!stuName.test(name)){
  		        					 alert("名前を入力してください");
  		        					 return false;

  		        				 }alert("成功");
  		        				 $("#queryByName").submit();
  		        			     }

  		        		 });


  	})






</script>

<title>Insert title here</title>
</head>
<body>
	<h2>学生の情報条件検索</h2>
	<br>
	<br>
	<hr>
	<br>
	<br>

    <div>
		<table id="studentList" border="1">
			<tr>
				<td>順番</td>
				<td>名前</td>
				<td>生年月日</td>
				<td>年齢</td>
				<td>成績</td>
				<td>クラス</td>
				<td>住所</td>
				<td>先生</td>
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
     </div>
	<form id="queryById" action="getStudentById" method="post">
		<h3>IDで学生の情報を探す</h3>
		<input id="stuId" name="id" type="text" placeholder="IDを入力してください" />
		<input id="idButton" type="submit" value="確認" />
	</form>
	<form id="queryByName" action="getStudentByName" method="post">
		<h3>名前で学生の情報を探す</h3>
		<input id="stuName" name="name" type="text" placeholder="名前を入力してください" />
		<input id="nameButton" type="submit" value="確認" />

	</form>




	<br>
	<hr>
	<a href="welcome.jsp">ホームページへ戻す</a>
</body>
</html>