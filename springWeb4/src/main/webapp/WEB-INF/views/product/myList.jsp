<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.myListBoss {
			border: 1px solid;
			clear: both;
			width: 500px;
			background-color: blue;
			margin: 1px;
		}
		.topNum {
			border: 1px solid;
			float: left;
			width: 50px;
		}
		.topImg {
			border: 1px solid;
			float: left;
			width: 100px;
		}
		.topTitle {
			border: 1px solid;
			float: left;
			width: 100px;
		}
		.topPrice {
			border: 1px solid;
			float: left;
			width: 100px
		}
		.topQuan {
			border: 1px solid;
			float: left;
			width: 50px;
		}
		.topSeller {
			border: 1px solid;
			float: left;
			width: 50px;
		}
		.myListNum {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
		.myListImg {
			border: 1px solid;
			float: left;
		}
		.myListTitle {
			border: 1px solid;
			float: left;
			width: 100px;
			height: 100px;
		}
		.myListPrice {
			border: 1px solid;
			float: left;
			width: 100px;
			height: 100px;
		}
		.myListQuan {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
		.myListSeller {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
	</style>
</head>
<body>
	<div>
		<div class="myListBoss">
			<div class="topNum">번호</div>
			<div class="topImg">이미지</div>
			<div class="topTitle">제품명</div>
			<div class="topPrice">가격</div>
			<div class="topQuan">수량</div>
			<div class="topSeller">판매자</div>
		</div>
		<c:forEach var="list" items="${myList}">
			<div class="myListBoss">
				<div class="myListNum">${list.num}</div>
				<div class="myListImg"><img src="/prod_img/${list.img1}" width="100px" height="96px"></div>
				<div class="myListTitle">${list.title}</div>
				<div class="myListPrice">${list.price}</div>
				<div class="myListQuan">${list.quantity}</div>
				<div class="myListSeller">${list.seller}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>