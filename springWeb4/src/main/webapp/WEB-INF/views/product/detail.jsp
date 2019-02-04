<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#top_img {
			position: absolute;
			top: 20px;
			left: 30px;
		}
		#img2, #img3, #img4 {
			float: left;
		}
		#top_title {
			clear: both;
			position: absolute;
			top: 0px;
			left: 300px;
		}
		#botBoss {
			position: absolute;
			top: 250px;
			left: 30px;
		}
	</style>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(() => {
			$("#detailQuan").change(() => {
				console.log("바꼈당");
				var quan = $("#detailQuan").val();
				$("#detailPrice").val(quan * ${product.price});
				var totalQuan = Number(${product.quantity});
				var lostQuan = totalQuan - quan;
				$("#lostQuan").html(lostQuan);
			});
			$("#top_img div").click((e) => {
				var boss = e.target;
				console.log(boss.src);
				var top_img = $(boss).parent().parent().children()[0];
				console.log(top_img.children);
				var boss_img = $(boss).attr("src");
				var e_img = $(top_img.children).attr("src");
				$(boss).attr("src", e_img);
				$(top_img.children).attr("src", boss_img);
			});
		});
	</script>
</head>
<body>
	<div id="topBoss">
		<div id="top_img">
			<div id="boss_img"><img src="/prod_img/${product.img1}" width="210" height="135"></div>
			<div id="img2"><img src="/prod_img/${product.img2}" width="70" height="40"></div>
			<div id="img3"><img src="/prod_img/${product.img3}" width="70" height="40"></div>
			<div id="img4"><img src="/prod_img/${product.img4}" width="70" height="40"></div>
		</div>
		<div id="top_title">
			<h3>${product.title}</h3>
			<form action="" method="get">
				<label>개수</label>
				<input type="number" id="detailQuan" name="quantity" value="1" min="0" max="${product.quantity}" autocomplete="off">
				<label>남은 수량 : </label><span id="lostQuan">${product.quantity - 1}</span><br>
				<label>가격</label>
				<input type="number" id="detailPrice" name="price" value="${product.price}" readonly><br>
				<h3>총가격</h3>
				<span id="totalPrice"></span>
				<input type="button" value="장바구니">
				<input type="button" value="바로구매">
			</form>
		</div>
	</div>
	<div id="botBoss">
		<div>${product.content}</div>
		<div><img src="/prod_img/${product.img1}" width="500px"></div>
		<div><img src="/prod_img/${product.img2}" width="500px"></div>
		<div><img src="/prod_img/${product.img3}" width="500px"></div>
		<div><img src="/prod_img/${product.img4}" width="500px"></div>
	</div>
</body>
</html>