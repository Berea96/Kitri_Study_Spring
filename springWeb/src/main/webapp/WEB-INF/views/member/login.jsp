<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
	#head_box {
		position: fixed;
		top: 0px;
		left: 0px;
		width: 100%;
		height: 50px;	
		background-color: red;
	}
	#home {
		position: absolute;
		top: 13px;
		left: 10px;
	}
	#loginForm {
		position: absolute;
		top: 11px;
		right: 10px;
	}
	#body_box {
		position: absolute;
		width: 400px;
		height: 400px;
		background-color: #e4e4e4;
		top: 100px;
		right: 20px;
	}
	#body_box h1 {
		text-align: center;
	}
	#joinForm {
		margin-left: 50px;
	}
	#joinForm input {
		margin-bottom: 30px;
	}
	#submit {
		margin-left: 62px;
		margin-bottom: 0px !important;
		width: 165px;
	}
	#checkIdResult {
		text-align: center;
	}
</style>

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
		$("#submit").click((e) => {
			e.preventDefault();
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			var name = $("input[name=name]").val();
			var email = $("input[name=email]").val();
			
			var checkPoint = $("#checkPoint").val();
			
			if(checkPoint == "0") {
				$("#checkIdResult").css("color", "red").html("중복확인이 필요합니다");
			}
			else {
				if(id == "" || pwd == "" || name == "" || email == "") {
					$("#checkIdResult").css("color", "red").html("빈칸 없이 입력하세요.");
				}
				else {
					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/member/join",
						data: {
							"id": id,
							"pwd": pwd,
							"name": name,
							"email": email
						},
						success: (data) => {
							alert("가입성공 로그인 해주세요.");
							$("#id").val("");
							$("#pwd").val("");
							$("input[name=name]").val("");
							$("input[name=email]").val("");
						}
					});
				}
			}
		});
	});
</script>
<body>
	<div id="head_box">
		<div id="home">로그인하자</div>
		<form id="loginForm" action="${pageContext.request.contextPath}/member/menu" method="post">
			<input type="text" name="id" autocomplete="off">
			<input type="password" name="pwd" autocomplete="off">
			<input type="submit" value="로그인">
		</form>
	</div>	
	
	<div id="body_box">
		<h1>가입하기</h1>
		<form id="joinForm" action="${pageContext.request.contextPath}/member/join" method="post">
			<label>아이디 : </label><input type="text" id="id" name="id" autocomplete="off">
			<input type="hidden" id="checkPoint" value="0">
			<input id="checkIdBtn" type="button" value="중복확인"><br>
			<label>비밀번 : </label><input type="password" id="pwd" name="pwd" autocomplete="off"><br>
			<label>이르음 : </label><input type="text" name="name" autocomplete="off"><br>
			<label>이메일 : </label><input type="text" name="email" autocomplete="off"><br>
			<button id="submit">가입</button><br>
		</form>
		<div id="checkIdResult"></div>
	</div>
</body>
</html>
