<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
<tiles:insertAttribute name="title" ignore="true"/>
</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	#head_box{
		position: fixed;
		width: 100%;
		top: 0px;
		left: 0px;
		height: 50px;
		background-color: #364b96;
		border-top: 1px solid;
		border-bottom: 1px solid;
	}
	@media screen and (max-width: 753px) {
		#left_box{
			display: none;
			position: absolute;
			float: left;
			width: 150px;
			top: 50px;
			left: 0px;
			height: 80%;
			background-color: #364b96;
			border: 1px solid;
			z-index: 2;
		}
		#left_boxBtn {
			position: fixed;
			top: 13px;
			left: 13px;
		}
		#right_box{
			position: absolute;
			float: left;
			width: 99%;
			top: 50px;
			left: 0px;
			height: 80%;
			overflow: scroll;
			border: 1px solid;
			z-index: 1;
			align-content: center;
		}
	}
	@media screen and (min-width: 753px) {
		#left_boxBtn {
			display: none;
			position: fixed;
			top: 13px;
			left: 13px;
		}
		#left_box{
			display: block !important;
			position: absolute;
			float: left;
			width: 150px;
			top: 50px;
			left: 0px;
			height: 80%;
			background-color: #364b96;
			border: 1px solid;
		}
		#right_box{
			position: absolute;
			float: left;
			width: 80%;
			top: 50px;
			left: 150px;
			height: 80%;
			overflow: scroll;
			border: 1px solid;
		}
	}
	#footer_box{
		position: absolute;
		clear: both;
		width: 100%;
		bottom: 0px;
		left: 0px;
		height: 50px;
		background-color: #cfcfcf;
		border-top: 1px solid;
		border-bottom: 1px solid;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$("#left_boxBtn").click(() => {
			console.log("클릭크");
			var left_box_display = $("#left_box").css("display");
			console.log(left_box_display);
			if(left_box_display == "none") {
				$("#left_box").css("display", "block").css("position", "fixed");
				console.log("생겼다~");
			}
			else {
				$("#left_box").css("display", "none");
				console.log("숨김");
			}
		});
	});
</script>
</head>
<body>
	<div id="head_box">
		<tiles:insertAttribute name="head"/>
	</div>
	
	<div id="left_box" style="display: none">
		<tiles:insertAttribute name="left"/>
	</div>
	
	<div id="left_boxBtn">
		<button><i class="fa fa-reorder"></i></button>
	</div>
	
	<div id="right_box">
		<tiles:insertAttribute name="right"/>
	</div>
	
	<div id="footer_box">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>