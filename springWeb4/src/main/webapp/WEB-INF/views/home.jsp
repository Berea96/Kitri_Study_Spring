<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$.getRecentlyProdList = function() {
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/product/allList",
			data: {},
			success: (data) => {
				console.log("list")
				console.log(data);
			}
		});
	};
	
	$.getStarList = function() {
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/basket/starList",
			data: {"id" : "${sessionScope.info.id}"},
			success: (data) => {
				console.log("star")
				console.log(data);
			}
		});
	};
	$(document).ready(() => {
		$($.getRecentlyProdList());
		$($.getStarList());
	});
</script>
<body>
	<div class="recentlyProdList">
	</div>
	
	<div class="starList">
	</div>
	
	<div class="">
	</div>
</body>
</html>
