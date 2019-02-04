<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty sessionScope.info}">
		<c:if test="${sessionScope.info.type == 1}">
			<%@ include file="m1.jsp" %>
		</c:if> 
		<c:if test="${sessionScope.info.type == 2}">
			<%@ include file="m2.jsp" %>
		</c:if>
	</c:if>
	<c:if test="${empty sessionScope.info}">
		<div align="center">로그인이 필요합니다.</div>
	</c:if>
</body>
</html>