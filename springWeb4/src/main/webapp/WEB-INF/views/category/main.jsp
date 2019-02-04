<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
	#top, #mid {
		float: left;
	}
	#addCategory {
		clear: both;
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
				var result = JSON.parse(data);
				var str = "<select id='selectBoxTop'>";
				$.each(result, (id, it) => {
					str += "<option value='" + it.code + "'>"+ 
							it.text +"</option>";
				});
				str += "</select>";
				$("#Top").append(str);
			}
		});
	}

	$.showSelectBoxMid = function() {
		var top_code = $("#selectBoxTop option:selected").val();
		$("#selectCategory").val($("#selectBoxTop option:selected").html());
		$("#mid").empty();
		$("#bot").empty();
		if(top_code == "0"){
			$("#selectCategory").val("대분류");
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
					var result = JSON.parse(data);
					$.showSelectBox(data, "selectBoxTop");
					$("#selectBoxMid").change($.showSelectBoxBot);
				}
			});
		}
	}
	
	$.showSelectBoxBot = function() {
		var mid_code = $("#selectBoxMid option:selected").val();
		$("#selectCategory").val($("#selectBoxMid option:selected").html());
		$("#bot").empty();
		if(mid_code == "0") {
			$("#selectCategory").val($("#selectBoxTop option:selected").html());
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
		$.showSelectBoxTop;
		$("#selectBoxTop").change($.showSelectBoxMid);
		$("#categoryAddBtn").click($.categoryAddAction);
	});
</script>
</head>
<body>

	<div id="top">
	</div>
	
	<div id="mid">
	</div>
	
	<div id="bot">
	</div>
	
	<div id="addCategory">
		<span>마지막으로 선택한 부분에 카테고리를 추가함</span>
		<form id="categoryAddForm">
			<input id="selectCategory" type="text" size="7" readonly value="대분류">
			<input id="categoryAddText" type="text" name="text" size="7" value="">
			<input id="categoryAddBtn" type="button" value="추가">
		</form>
	</div>
	
</body>
</html>