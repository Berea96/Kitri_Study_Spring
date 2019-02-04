<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.allListBoss {
			border: 1px solid;
			clear: both;
			width: 550px;
			margin: 1px;
			background-color: blue;
		}
		.allListBossTop {
			border: 1px solid;
			clear: both;
			width: 550px;
			margin: 1px;
			background-color: blue;
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
		.allListNum {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
		.allListImg {
			border: 1px solid;
			float: left;
		}
		.allListTitle {
			border: 1px solid;
			float: left;
			width: 100px;
			height: 100px;
		}
		.allListPrice {
			border: 1px solid;
			float: left;
			width: 100px;
			height: 100px;
		}
		.allListQuan {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
		.allListSeller {
			border: 1px solid;
			float: left;
			width: 50px;
			height: 100px;
		}
		.allListPreview {
			float: left;
			width: 500px;
			height: 300px;
			background-color: red;
		}
		.allListBtnGroup {
			border: 1px solid;
			float: left;
			width: 80px;
			height: 100px;
		}
		.allListBtnGroup button {
			width: 100%;
		}
	</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var code = 0;
	
	$showSelectBoxTop = function() {
		//<select id="selectBoxTop">
		//<c:forEach var="category" items="${categoryList}">
		//	<option value="${category.code}">${category.text}</option>
		//</c:forEach>
		//</select>
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/category/list",
			data: {},
			success: (data) => {
				console.log(data);
				var result = JSON.parse(data);
				console.log("도착");
				var str = "<select id='selectBoxTop'>";
				$.each(result, (id, it) => {
					str += "<option value='" + it.code + "'>"+ 
							it.text +"</option>";
				});
				str += "</select>";
				$("#top").append(str);
			}
		});
	}
	
	$.showSelectBoxMid = function() {
		var top_code = $("#selectBoxTop option:selected").val();
		$("#addProdCate").val(top_code);
		code = top_code;
		//$("#selectCategory").val($("#selectBoxTop option:selected").html());
		$("#mid").empty();
		$("#bot").empty();
		if(top_code == "0"){
			//$("#selectCategory").val("대분류");
			$("#addProdCate").val(0);
			code = 0;
		}
		else {
			code = top_code;
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/category/list2",
				data: {
					"parent_code": top_code
				},
				success: (data) => {
					console.log(data);
					var result = JSON.parse(data);
					$.showSelectBox(data, "selectBoxTop");
					$("#selectBoxMid").change($.showSelectBoxBot);
				}
			});
		}
	}
	
	$.showSelectBoxBot = function() {
		var mid_code = $("#selectBoxMid option:selected").val();
		$("#addProdCate").val(mid_code);
		code = mid_code;
		$("#selectCategory").val($("#selectBoxMid option:selected").html());
		$("#bot").empty();
		if(mid_code == "0") {
			$("#selectCategory").val($("#selectBoxTop option:selected").html());
			$("#addProdCate").val(top_code);
			code = top_code;
		}
		else {
			code = mid_code;
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/category/list2",
				data: {
					"parent_code": mid_code
				},
				success: (data) => {
					var result = JSON.parse(data);
					$.showSelectBox(data, "selectBoxMid");
				}
			});
		}
	}
	
	$.showSelectBox = function(data, id) {
		var result = JSON.parse(data);
		var selId = "";
		var targetId = "";
		if(id == "selectBoxTop") {
			console.log("대장이다");
			selId = "selectBoxMid";
			targetId = "#mid";
		}
		else {
			console.log("부하...");
			selId = "selectBoxBot";
			targetId = "#bot";
		}
		var str = "<select id='" + selId + "'>";
		str += "<option value='0'>선택</option>";
		$.each(result, (id, it) => {
			str += "<option value='" + it.code + "'>"+ 
					it.text +"</option>";
		});
		str += "</select>";
		$(targetId).append(str);
	}

	$(document).ready(() => {
		$(() => {
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/category/list",
				data: {},
				success: (data) => {
					console.log(data);
					var result = JSON.parse(data);
					console.log("도착");
					var str = "<select id='selectBoxTop'>";
					$.each(result, (id, it) => {
						str += "<option value='" + it.code + "'>"+ 
								it.text +"</option>";
					});
					str += "</select>";
					$("#top").append(str);
					$("#selectBoxTop").change($.showSelectBoxMid);
				}
			});
		});
		$(".allListBoss").click((e) => {
			console.log("클릭");
			var boss = $(e.target).parent();
			console.log(boss);
			if($(boss).attr("class") == "allListBoss") {
				var preview = $(boss).children()[$(boss).children().length -1];
				var previewClass = $(preview).attr("class");
				var previewStyle = $(preview).css("display");
				if(previewClass == null && previewStyle == "none") {
					$(preview).removeAttr("style").attr("class", "allListPreview");
				}
				else {
					$(preview).removeAttr("class").css("display", "none");
				}
			}
			else {
			}
		});
		$(".starPointBtn").click((e) => {
			var boss = $(e.target).parent().parent();
			console.log("star");
			console.log(boss);
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/basket/add",
				data: {
					"prod_num" : $(boss).attr("id"),
					"id" : "${sessionScope.info.id}",
					"basket_code" : 1,
					"quantity" : 0
				},
				success: (data) => {
				}
			});
		});
		
		$(".goBasketBtn").click((e) => {
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/basket/basketList",
				data: {
					"prod_num" : num,
					"id" : "${sessionScope.info.id}",
					"basket_code" : 0
				},
				success: (data) => {
				}
			});
		});
		
		$("#cateSearchBtn").click(() => {
			console.log(code)
			location.href = "${pageContext.request.contextPath}/product/cateList?cate=" + code;
		});
	});
</script>
</head>
<body>
	<div>
		<div class="searchDib">
			<form>
			<div id="top" style="float:left">
			</div>
			
			<div id="mid" style="float:left">
			</div>
			
			<div id="bot" style="float:left">
			</div>
				<input id="addProdCate" type="hidden">
				<input id="cateSearchBtn" type="button" value="검색">
			</form>
		</div>
		<div class="allListBossTop">
			<div class="topNum">번호</div>
			<div class="topImg">이미지</div>
			<div class="topTitle">제품명</div>
			<div class="topPrice">가격</div>
			<div class="topQuan">수량</div>
			<div class="topSeller">판매자</div>
		</div>
		<div class="allLIstBossTop">
		<c:forEach var="list" items="${allList}">
			<div id="${list.num}" class="allListBoss">
				<div class="allListNum">${list.num}</div>
				<div class="allListImg"><img src="/prod_img/${list.img1}" width="100px" height="96px"></div>
				<div class="allListTitle">${list.title}</div>
				<div class="allListPrice">${list.price}</div>
				<div class="allListQuan">${list.quantity}</div>
				<div class="allListSeller">${list.seller}</div>
				<c:if test="${sessionScope.info.type == 2}">
					<div class="allListBtnGroup">
						<button class="starPointBtn">찜하기</button>
						<button class="goBasketBtn">장바구니</button>
					</div>
				</c:if>
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
	</div>
	<div id="basketCheckView"style="display:none;">
		
	</div>
</body>
</html>