<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	wow~~ this's a test1
</h1>
	<h3>정보 입력</h3>
	<form action="${pageContext.request.contextPath}/test/test1" method="post">
		name : <input type="text" name="name">
		age : <input type="text" name="age">
		<input type="submit" value="등록">
	</form>
</body>
</html>
