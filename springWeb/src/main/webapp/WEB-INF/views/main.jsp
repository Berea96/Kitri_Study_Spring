<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>	
<c:forEach var="popularQuery" items="${popularQueryList}">
${popularQuery}
</c:forEach>

<select name="type">
	<c:forEach var="searchType" items="${searchTypeList}"> 
	<option value="${searchType.code}">${searchType.text}</option>
	</c:forEach>
</select>
</body>
</html>