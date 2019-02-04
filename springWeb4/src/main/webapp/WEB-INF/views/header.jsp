<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#head_left {
		float: left;
		width: 45%;
		margin-top: 13px;
		margin-left: 10px;
	}
	#head_center {
		vertical-align: middle;
		float: left;
		font-size: 30px;
		width: 10%;
		height: 50px;
	}
	#head_center a:hover {
		height: 50px;
		color: #d1d1d1;
	}
	a {
		text-decoration: none;
		color: white;
	}
	.myInfo:hover, .logout:hover, 
	.loginBtn:hover, .signIn:hover,
	.backBtn:hover{
		cursor: pointer;
		color: black;
	}
	#loginForm {
	}
	#head_right {
		position: absolute;
		width: 45%;
		right: 10px;
		text-align: right;
		top: 10px;
		float: left;
	}
	#head_right a {
		margin-right: 10px;
	}
	#head_right_memberMenu {
		right: 10px;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$("#logoutBtn").click(() => {
			location.href = "${pageContext.request.contextPath}/prodMem/logout"
		});
		$(".loginBtn").click((e) => {
			var boss = $(e.target).parent().parent().parent();
			var bossChild = $(boss).children();
			var loginForm = $(bossChild)[$(bossChild).length - 1]
			//console.log(boss);
			var display = $(loginForm).css("display");
			//console.log(loginForm)
			if(display == "block") {
				$(".iconA").removeAttr("style");
				$(loginForm).removeAttr("class").css("display", "none");
			}
			else {
				$(".iconA").css("display", "none");
				$(loginForm).removeAttr("style").attr("class", "");
			}
		});
		$(".backBtn").click((e) => {
			var boss = $(e.target).parent().parent().parent().parent();
			var bossChild = $(boss).children();
			var loginForm = $(bossChild)[$(bossChild).length - 1]
			//console.log(boss);
			var display = $(loginForm).css("display");
			//console.log(loginForm)
			$(".iconA").removeAttr("style");
			$(loginForm).removeAttr("class").css("display", "none");
		});
	});
</script>
</head>
<body>
	<div id="head_left">
<%-- 		<a href="${pageContext.request.contextPath}/prodMem/join">회원가입</a> --%>
	</div>
	<div id="head_center">
		<div align="center">
			<a href="${pageContext.request.contextPath}/prodMem/home">Okky</a>
			<c:if test="${empty sessionScope.info.id}">
			</c:if>
			<c:if test="${!empty sessionScope.info.id}">
				<!-- <form action="">
					<input type="text" name="title">
					<input type="button" value="검색">
				</form> -->
			</c:if>
		</div>
	</div>
	<div id="head_right">
		<c:if test="${empty sessionScope.info.id}">
			<div class="emptySession">
				<div class="iconA">
					<a class="loginBtn"><i class="fa fa-sign-in" style="font-size:24px"></i></a>
					<a href="${pageContext.request.contextPath}/prodMem/join" class="signIn"><i class="fa fa-user" style="font-size:24px"></i></a>
				</div>
				<div style="display:none">
					<form id="loginForm" action="${pageContext.request.contextPath}/prodMem/login" method="post">
						<input type="text" name="id" size="10">
						<input type="password" name="pwd" size="10">
						<input type="submit" id="loginBtn" value="로그인">
						<a class="backBtn"><i class="fa fa-reply" style="font-size:24px"></i></a>
					</form>
				</div>
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.info.id}">
			<div id="head_right_memberMenu">
				<a class="myInfo" href="${pageContext.request.contextPath}/prodMem/info?id=${sessionScope.info.id}"><i class="fa fa-address-card" style="font-size: 24px"></i></a>
				<a class="logout" href="${pageContext.request.contextPath}/prodMem/logout"><i class="fa fa-sign-out" style="font-size: 24px"></i></a>
			</div>
		</c:if>
	</div>
</body>
</html>