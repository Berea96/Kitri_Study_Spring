<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#showListBtn, #starPointBtn, #basketBtn {
		width: 100%;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$("#showListBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/product/allList";
		});
		$("#starPointBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/basket/starList?id=${sessionScope.info.id}";
		});
		$("#basketBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/basket/basketListid=${sessionScope.info.id}";
		});
	});
</script>
</head>
<body>
	<div align="center">구매자</div>
	<div><button id="showListBtn">상품보기</button></div>
	<div><button id="starPointBtn">찜한상품</button></div>
	<div><button id="basketBtn">장바구니</button></div>
</body>
</html>