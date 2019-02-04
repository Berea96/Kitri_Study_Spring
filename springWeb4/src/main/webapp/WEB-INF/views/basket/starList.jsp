<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.myListTopBoss {
			border: 1px solid;
			clear: both;
			width: 520px;
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
			width: 100px;
		}
		.topSeller {
			border: 1px solid;
			float: left;
			width: 50px;
		}
		.myListBoss {
			border: 1px solid;
			clear: both;
			width: 520px;
			background-color: blue;
			margin: 1px;
		}
		.myListBoss div {
			text-align: center;
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
			width: 100px;
			height: 100px;
		}
		.myListSeller {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
		.myListPreview {
			float: left;
			width: 500px;
			height: 300px;
			background-color: red;
		}
	</style>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(() => {
			$(".myListBoss").click((e) => {
				console.log("클릭");
				var boss = $(e.target).parent();
				console.log(boss);
				if($(boss).attr("class") == "myListBoss") {
					var preview = $(boss).children()[$(boss).children().length -1];
					var previewClass = $(preview).attr("class");
					var previewStyle = $(preview).css("display");
					if(previewClass == null && previewStyle == "none") {
						$(preview).removeAttr("style").attr("class", "myListPreview");
					}
					else {
						$(preview).removeAttr("class").css("display", "none");
					}
				}
				else {
				}
			});
		});
	</script>
</head>
<body>
	<div>
		<div class="myListTopBoss">
			<div class="topNum">번호</div>
			<div class="topImg">이미지</div>
			<div class="topTitle">제품명</div>
			<div class="topPrice">가격</div>
			<div class="topQuan">남은수량</div>
			<div class="topSeller">판매자</div>
		</div>
		<c:forEach var="list" items="${starList}">
			<div class="myListBoss">
				<div class="myListNum">${list.num}</div>
				<div class="myListImg"><img src="/prod_img/${list.img1}" width="100px" height="96px"></div>
				<div class="myListTitle">${list.title}</div>
				<div class="myListPrice">${list.price}</div>
				<div class="myListQuan">${list.quantity}</div>
				<div class="myListSeller">${list.seller}</div>
				<div style="display:none;">
					<a href="${pageContext.request.contextPath}/product/detail?num=${list.num}"><img src="/prod_img/${list.img1}" width="200px" height="140px"></a>
				<c:if test="${list.img2 ne ''}">
					<img src="/prod_img/${list.img2}" width="200px" height="140px">
				</c:if>
				<c:if test="${list.img3 ne ''}">
					<img src="/prod_img/${list.img3}" width="200px" height="140px">
				</c:if>
				<c:if test="${list.img4 ne ''}">
					<img src="/prod_img/${list.img4}" width="200px" height="140px">
				</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>