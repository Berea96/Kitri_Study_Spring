<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		
		$("#checkIdBtn").click(() => {
			var id = $("#id").val();
			
			if(id != "") {
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/member/checkId",
					data: {
						"id": id
					},
					success: (data) => {
						var result = JSON.parse(data);
						console.log(result.result);
						if(result.result != "true") {
							$("#checkIdResult").css("color", "red").html("중복 된 아이디");
							$("#checkPoint").val("0");
						}
						else {
							$("#checkIdResult").css("color", "green").html("사용가능한 아이디");
							$("#checkPoint").val("1");
						}
					}
				});
			}
			else {
				$("#checkIdResult").css("color", "red").html("아이디를 입력하세요.");
				$("#checkPoint").val("0");
			}
		});
		$("#login").click(() => {
			location.href = "${pageContext.request.contextPath}/member/login";
		});
	});
</script>
<body>
	<h1>가입하기</h1>
	<form action="${pageContext.request.contextPath}/member/join" method="post">
		<label>아이디 : </label><input type="text" id="id" name="id" value="">
		<input type="hidden" id="checkPoint" value="0">
		<input id="checkIdBtn" type="button" value="중복확인">
		<span id="checkIdResult"></span><br>
		<label>비밀번 : </label><input type="password" name="pwd"><br>
		<label>이르음 : </label><input type="text" name="name"><br>
		<label>이메일 : </label><input type="text" name="email"><br>
		<input id="login" type="button" value="로그인"/>
		<input id="submit" type="submit" value="가입"/>
	</form>
</body>
</html>
