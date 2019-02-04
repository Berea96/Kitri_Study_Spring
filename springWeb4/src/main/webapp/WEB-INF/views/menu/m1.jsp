<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#addProductBtn, #myProductListBtn,
		#allProductListBtn {
			width: 100%;
		}
	</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$("#addProductBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/product/add";
		});
		$("#myProductListBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/product/myList?id=${sessionScope.info.id}";
		});
		$("#allProductListBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/product/allList";
		});
	});
</script>	
</head>
<body>
	<div align="center">판매자</div>
	<div><button id="addProductBtn">상품등록</button></div>
	<div><button id="myProductListBtn">내상품보기</button></div>
	<div><button id="allProductListBtn">전체상품보기</button></div>
</body>
</html>