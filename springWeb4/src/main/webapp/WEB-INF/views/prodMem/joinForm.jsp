<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$("#checkIdBtn").click(() => {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/prodMem/checkId",
				data: {"id": $("#id").val()},
				success: (data) => {
					var result = JSON.parse(data);
					if(result.result = "true") {
						$("#checkText").html("중복된 아이디");
					}
					else {
						$("#checkText").html("사용가능한 아이디");
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="joinForm">
		<form action="${pageContext.request.contextPath}/prodMem/join" method="POST">
			<input id="id" type="text" name="id" autocomplete="off">
			<input id="checkIdBtn" type="button" value="중복확인"><br>
			<input type="password" name="pwd" autocomplete="off"><br>
			<input type="text" name="name" autocomplete="off"><br>
			<input type="text" name="email" autocomplete="off"><br>
			<input type="radio" name="type" value="2" checked="checked">구매자
			<input type="radio" name="type" value="1">판매자
			<br>
			<input type="submit" value="가입">
			<span id="checkText"></span>
		</form>
	</div>
</body>
</html>
