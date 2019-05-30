<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajaxzip3.github.io/ajaxzip3.js"></script>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<!-- 编写jqueyr代码 -->
<script type="text/javascript">
$(function(){
	$("#upButton").click(function(){
		 var id = $("#stuId").val();
		 var name = $("#stuName").val();
		 var birthday = $("#stuBir").val();
		 var age = $("#stuAge").val();
		 var score = $("#stuScore").val();
		 var classid = $("#stuClassId").val();

		 if(id==null || id==""){
			 alert("idを入力してください");
			 return false;
		 }else{

			 var stuid =/^[0-9]+$/;
			 if(!stuid.test(id)){
				 alert("idを確認してください");
				 return false;
			 }else{
				 if(name==null || name =="" ){
					 alert("nameを入力してください");
					 return false;
				 }else{
					 var stuname =/^[\u3040-\u309F\u30A0-\u30FF\u4e00-\u9fa5A-Za-z]+$/;
					 if(!stuname.test(name)){
						 alert("nameを確認してください");
						 return false;
					 }else{
						 if(birthday==null || birthday==""){
							 alert("birを入力してください");
							 return false;
						 }else{
							 var stubir = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
							 if(!stubir.test(birthday)){
								 alert("birを確認してください");
								 return false;
							 }else{
								 if(age==null || age==""){
									 alert("ageを入力してください");
									 return false;
								 }else{
									 var stuage=/^[0-9]+$/;
									 if(!stuage.test(age)){
										 alert("ageを確認してください");
										 return false;
									 }else{

										 if(score==null || score==""){
											 alert("scoreを入力してください");
											 return false;
										 }else{
											 var stuscore = /^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^(([^0][0-9]+|0)$)|^(([1-9]+)\.([0-9]{1,2})$)|^(([1-9]+)$)/;
											 if(!stuscore.test(score)){
												 alert("scoreを確認してください");
												 return false;
											 }else{

												 if(classid==null || classid==""){
													 alert("classidを入力してください");
													 return false;
												 }else{
													 var stuclass =/^[0-9]+$/;
													 if(!stuclass.test(classid)){
														 alert("classidを確認してください");
														 return false;
													 }else{
														 alert("更新完了");
			                                            	("#upstu").submit();

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


			 }




}






	});

});




</script>

<title>Insert title here</title>
</head>
<body>

	<h1>学生情報</h1>
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

    <form id="upstu" action="getUpDateStudent" method="post">
       <h3>学生情報を更新する</h3>
       <input id="stuId" type="text" name="id" placeholder="IDを入力してください"/>
       <br>
       <input id="stuName" type="text" name="name" placeholder="名前を入力してください"/>
       <br>
       <input id="stuBir" type="text" name="birthday" placeholder="生年月日IDを入力してください"/>
       <br>
       <input id="stuAge" type="text" name="age" placeholder="年齢を入力してください"/>
       <br>
       <input id="stuScore" type="text" name="score" placeholder="成績を入力してください"/>
       <br>
       <input id="stuClassId" type="text" name="classid" placeholder="クラスを入力してください"/>
       <br>
      <input id="upButton" type="submit" value="確認"/>
       <br>
    </form>




<div>
       <h3>郵便番号で住所を追加する</h3>
       	<form id="addAddress" action="addStudentAddress" method="post">
       	<label>郵便番号（ハイフンもOK）</label>
       	<br>
        <input id="postid" type="text" name="zip11" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','addr11','addr11');">
       	<br>
       	<label>都道府県と以降の住所</label>
       	<br>
       	<input id="post" type="text" name="addr11" size="60">
       	<br>
       	<span>更新用の学生のIDを入力してください</span>
       　　　　<br>
        <input id="studentID" type="text" name="id" placehoder="IDを入力してください" />
        <br>
        <input id="addButton" type="submit" value="確認" />



       	</form>

</div>
     <br>
     <br>
     <hr>
     <br>
     <a href="welcome.jsp">ホームページへ戻す</a>
     <br>



</body>
</html>