<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.info {
			border: 1px solid;
			width: 100px;
		}
	</style>
</head>
<body>
	<div>
		<div class="infoLabel">아이디</div>
		<div class="info">${member.id}</div>
	</div>
	<div>
		<div class="infoLabel">비밀번호</div>
		<div class="info">${member.pwd}</div>
	</div>
	<div>
		<div class="infoLabel">이름</div>
		<div class="info">${member.name}</div>
	</div>
	<div>
		<div class="infoLabel">이메일</div>
		<div class="info">${member.email}</div>
	</div>
	<div>
		<div class="infoLabel">회원 코드</div>
		<div class="info">${member.type}</div>
	</div>
</body>
</html>