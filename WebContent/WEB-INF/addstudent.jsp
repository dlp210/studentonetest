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
<script type="text/javascript" >
$(function(){
			$("#addButton").click(function(){
		        			 var name = $("#stuName").val();
		        			 var birthday = $("#stuBir").val();
		        			 var age = $("#stuAge").val();
		        			 var scroe = $("#stuScore").val();
		        			 var classid = $("#stuClassid").val();

		        			 if(name == null || name == ""){
		        				 alert("お名前を入力してください");
		        				 return false;

		        			 }else{
		        				 var inputname = /^[\u3040-\u309F\u30A0-\u30FF\u4e00-\u9fa5A-Za-z]+$/;
		        				 if (!inputname.test(name)){
		        					 alert("お名前を確認してください");
		        					 return false;

		        				 }else {
		        					 if (birthday == null || birthday == ""){
		        						 alert("生年月日を入力してください");
		        						 return false;
		        					 }else {
											var inputbirthday = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
											if (!inputbirthday.test(birthday)){
												alert("生年月日を確認してください");
												return false;
											}else {
												if (age == null || age ==""){
													alert("年齢を入力してください");
													return false;
												}else {
													var inputage = /^[0-9]+$/;
													if (!inputage.test(age)){
														alert("年齢を確認してください");
														return false;
													}else {
														if (score == null || score == ""){
															alert("成績を入力してください");
															return false;
														}else {
															var inputscore = /^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^(([^0][0-9]+|0)$)|^(([1-9]+)\.([0-9]{1,2})$)|^(([1-9]+)$)/;
                                                            if (!inputscore.test(score)){
                                                            	alert("成績を確認してください");
                                                            	return false;
                                                            } else {
                                                            	if (classid == null || classid == ""){
                                                            		alert("クラス番号を入力してください");
                                                            		return false;
                                                            	}else {
    																var inputclassid = /^[0-9]+$/;
                                                                    if (!inputclassid.test(clssid)){
                                                                    	alert("クラス番号を確認してください");
                                                                    	return false;
                                                                    }else {
                                                                    	alert("追加完了");
                                                                    	("#addstu").submit();
                                                                    }
                                                            	}
                                                            }
														}
													}
												}
											}
		        					 }
		        				 }
		        			     }

		        		 });
		});

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
	<form id="add" action="goToAddStudent" method="post">
		<h3>学生を追加する</h3>
		<input id="stuName" name="name" placeholder="名前を入力してください" type="text" />
		<br> <input id="stuBir" name="birthday"
			placeholder="生年月日を入力してください" type="text" /> <br> <input
			id="stuAge" name="age" placeholder="年齢を入力してください" type="text" /> <br>
		<input id="stuScore" name="score" placeholder="成績を入力してください"
			type="text" /> <br> <input id="stuClassid" name="classid"
			placeholder="クラスを入力してください" type="text" /> <br> <input
			id="addButton" type="submit" value="確認" />
	</form>








	<br>
	<br>
	<hr>
	<br>
	<a href="welcome.jsp">ホームページへ戻す</a>






</body>
</html>