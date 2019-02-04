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
	<form action="${pageContext.request.contextPath}/report/submitReport3" 
	method="post" enctype="multipart/form-data">
		<input type="text" name="studentNumber">
		<input type="file" name="report">
		<input type="submit">
	</form>
</body>
</html>