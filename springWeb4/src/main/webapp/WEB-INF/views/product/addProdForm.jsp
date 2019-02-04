<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		$("#addProdBtn").click(() => {
			var num = $("#addProdNum").val();
			var title = $("#addProdTitle").val();
			var seller = $("#addProdSeller").val();
			var quan= $("#addProdQuan").val();
			var price = $("#addProdPrice").val();
			var img1 = $("#addProdImg1").val();
			var img2 = $("#addProdImg2").val();
			var img3 = $("#addProdImg3").val();
			var img4 = $("#addProdImg4").val();
			
			console.log(num + " " + title + " " + seller + " " + quan + " " +
						price + " " + img1 + " " + img2 + " " + img3 + " " + img4);
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/product/add",
				data: {"num" : num,
					   "title" : title,
					   "seller" : seller,
					   "cate" : code,
					   "quantity" : quan,
					   "price" : price,
					   "img1" : img1,
					   "img2" : img2,
					   "img3" : img3,
					   "img4" : img4},
				success: (data) => {
					console.log("성공적");
				}
			});
		});
	});
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/product/add" method="post" enctype="multipart/form-data">
		<label>제품명</label><input type="text" id="addProdTitle" name="title"><br>
		<label>판매자</label><input type="text" id="addProdSeller" name="seller" value="${sessionScope.info.id}" readonly><br>
		<label>카테고리</label>
		<div>
			<div id="top" style="float:left">
			</div>
			
			<div id="mid" style="float:left">
			</div>
			
			<div id="bot" style="float:left">
			</div>
		</div>
		<br>
		<input type="hidden" id="addProdCate" name="category">
		<label>수우량</label><input type="number" id="addProdQuan" name="quantity"><br>
		<label>서얼명</label><input type="text" id="addProdContent" name="content"><br>
		<label>가아격</label><input type="number" id="addProdPrice" name="price"><br>
		<label>일미지</label><input type="file" id="addProdFile1" name="file1"><br>
		<label>이미지</label><input type="file" id="addProdFile2" name="file2"><br>
		<label>삼미지</label><input type="file" id="addProdFile3" name="file3"><br>
		<label>사미지</label><input type="file" id="addProdFile4" name="file4"><br>
		<input type="submit" value="등록"><br>
	</form>
</body>
</html>