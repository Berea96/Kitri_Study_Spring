<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//마우스 커서의 위치값 
var cursorX;
var cursorY;

//Session 값이 왜 안되는 지 몰랐을 때 사용했던 id값
var id;

var path = "C:\\data\\workspace\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";

//페이지가 전부 로딩된 후 사용할 javascript부분
$(document).ready(() => {
	$(() => {
		//페이지 로딩 후 바로 session의 아이디값을 받아오는 부분
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/member/info",
			data: {"id":"id"},
			success: (data) => {
				var result = JSON.parse(data);

				id = result.id;
			}
		});
	});
	
	$(() => {
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/member/list",
			data: {},
			success: (data) => {
				var result = JSON.parse(data);
				var str = "";
				$.each(result, (index, it) => {
					if(id != it.id) {
						str += "<div id='" + it.id + "' class='memberDib'>" + it.name + "</div>";
					}
				});
				
				$("#friendList").append(str);
				
				memberDibAction();
			}
		});
	});
	
	function memberDibAction() {
		$(".memberDib").click((e) => {
			$("#infoForm").css("display", "none");
			$("#boardList").css("display", "none");
			$(".detailView").css("display", "none");
			$(".boardWrite").css("display", "none");
			$("#imgBoardList").css("display", "none");
			$(".imgDetailView").css("display", "none");
			$(".imgBoardWrite").css("display", "none");
			$(".imgDownloadList").css("display", "none");
			$("#imgBoardList_1").empty();
			console.log("작동중...")
			var writer = e.target.id;
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/imgBoard/writerList",
				data: {
					"writer": writer
				},
				success: (data) => {
					//console.log(data);
					var result = eval('('+data+')');
					console.log(result);
					if(result.length != 0) {
						$("#imgBoardList_1").append("<div>" + writer + "님의 타임라인</div>");	
						showImgBoardList(result);
						showImgBoardListAction();
					}
					else {
						emptyImgBoard(writer);
					}
				}
			});
		});
	}
	
	function emptyImgBoard(writer) {
		$("#imgBoardList").removeAttr("style").css("width", "400px");
		$("#imgBoardList_1").empty();
		$("#imgBoardList_1").append("<div>" + writer + "님이 등록한 게시물이 없습니다.</div>")	;	
	}
	
	//내정보 보기 버튼을 클릭시 핸들러
	$("#infoBtn").click(() => {
		$("#boardList").css("display", "none");
		$(".detailView").css("display", "none");
		$(".boardWrite").css("display", "none");
		$("#imgBoardList").css("display", "none");
		$(".imgDetailView").css("display", "none");
		$(".imgBoardWrite").css("display", "none");
		$(".imgDownloadList").css("display", "none");
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/member/info",
			data: {
				"id" : "id"
			},
			success: (data) => {
				var result = JSON.parse(data);

				$("#id").val(result.id);
				$("#pwd").val(result.pwd);
				$("#name").val(result.name);
				$("#email").val(result.email);

				$("#infoForm").removeAttr("style");
			}
		});
	});
	
	//로그아웃 버튼 클릭 시 핸들러
	$("#logoutBtn").click(() => {
		location.href = "${pageContext.request.contextPath}/member/logout";
	});
	
	//탈퇴 버튼 클릭 시 핸들러
	$("#delBtn").click(() => {
		location.href = "${pageContext.request.contextPath}/member/delete?id=" + id;
	});
	
	//게시물 보기 버튼 클릭 시 핸들러
	$("#boardListBtn").click(() => {
		$("#infoForm").css("display", "none");
		$(".detailView").css("display", "none");
		$(".boardWrite").css("display", "none");
		$("#imgBoardList").css("display", "none");
		$(".imgBoardWrite").css("display", "none");
		$(".imgDetailView").css("display", "none");
		$(".imgDownloadList").css("display", "none");
		$("#boardList_1").empty();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/board/list",
			data: {},
			success: (data) => {
				var result = JSON.parse(data);
				showBoardList(result);
				showBoardListAction();
			}
		});
	});
	
	$("#imgBoardListBtn").click(() => {
		$("#infoForm").css("display", "none");
		$(".detailView").css("display", "none");
		$("#boardList").css("display", "none");
		$(".boardWrite").css("display", "none");
		$(".imgDetailView").css("display", "none");
		$(".imgBoardWrite").css("display", "none");
		$(".imgDownloadList").css("display", "none");
		$("#imgBoardList_1").empty();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/imgBoard/list",
			data: {},
			success: (data) => {
				var result = eval('(' + data + ')');
				showImgBoardList(result);
				showImgBoardListAction();
			}
		});
	});
	
	$("#imgBoardMeBtn").click(() => {
		console.log("눌렀다~");
		$("#infoForm").css("display", "none");
		$(".detailView").css("display", "none");
		$("#boardList").css("display", "none");
		$(".boardWrite").css("display", "none");
		$(".imgDetailView").css("display", "none");
		$(".imgBoardWrite").css("display", "none");
		$(".imgDownloadList").css("display", "none");
		$("#imgBoardList_1").empty();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/imgBoard/writerList",
			data: {"writer": id},
			success: (data) => {
				var result = eval('(' + data + ')');
				$("#infoForm").css("display", "none");
				$(".detailView").css("display", "none");
				$("#boardList").css("display", "none");
				$(".boardWrite").css("display", "none");
				$(".imgDetailView").css("display", "none");
				$(".imgBoardWrite").css("display", "none");
				$("#imgBoardList_1").empty();
				$("#imgBoardList").removeAttr("style").css("width", "400px");
				$("#imgBoardList_1").append("<button style='width:200px; float:left;' id='writeImgBoard'>작성</button>"); 
				$("#imgBoardList_1").append("<button style='width:200px;' id='closeImgBoard'>닫기</button>"); 
				$.each(result, (id, it) => {
					$("#imgBoardList_1").append("<div id='img_boss'>" + 
							"<a class='aa' href=''><img id='" + it.num + "' src='/img/" + it.img_path + "' width='400' heigth='200'/></a>" +
							"<div align='center' class='img_left'>" + it.num + "</div>" + 
							"<div align='center' class='img_left'>" + 
							"<a id='" + it.num + "' class='a aa' href=''>" + 
							it.title + "</a></div>" + 
							"<div align='center' class='img_left'>" + it.writer + "</div>" + 
					"</div>");
				});
				showImgBoardListAction();
			}
		});
	});
	
	$("#downloadImgBtn").click(() => {
		$("#infoForm").css("display", "none");
		$(".detailView").css("display", "none");
		$("#boardList").css("display", "none");
		$(".boardWrite").css("display", "none");
		$("#imgBoardList").css("display", "none");
		$(".imgDetailView").css("display", "none");
		$(".imgBoardWrite").css("display", "none");
		$(".imgDownloadList").empty().removeAttr("style");
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/imgBoard/list",
			data: {},
			success: (data) => {
				var result = eval('(' + data + ')');
				
				var str = "";
				
				$(".imgDownloadList").append("<h4>클릭시 미리보기가 가능합니다!</h4>");
				
				$.each(result, (id, it) => {
					str += "<div class='downloadBoss'>";
					str += "<div id='" + it.num + "' class='download_left'>" + it.num + "</div>";
					str += "<div id='" + it.num + "' class='download_left'>" + it.title + "</div>";
					str += "<div id='" + it.num + "' class='download_left'>" + it.writer + "</div>";
					str += "<div id='" + it.num + "' class='download_button'>" + 
							   "<button id='" + it.img_path + "' class='downloadFile'>다운로드</button>"+ "</div>" +
						   "<div class='imgViewer' style='display:none'>" +
							   "<img src='/img/" + it.img_path + "' width='390px' height='250px'>" +
						   "</div>";
					str += "</div>";
				});
			
				$(".imgDownloadList").append(str);
				$(".download_left").click((e) => {
					//$(".imgViewer").css("display", "none");
					var idd = e.target;
					
					var boss = $(idd).parent();
					var children = $(boss).children(".imgViewer");
					if($(boss).children(".imgViewer").css("display") != "none") {
						$(boss).children(".imgViewer").css("display", "none");
						console.log("안보이기");
					}
					else {
						$(boss).children(".imgViewer").removeAttr("style");
						console.log("보이기");
					}
				});
				
				$(".downloadFile").click((e) => {
					console.log("하이");
					location.href = "${pageContext.request.contextPath}/download/down?name=" + e.target.id;
				});
			}
		});
	});
	
	$("#downloadEtcBtn").click(() => {
		alert("준비중입니다.");
	});
	
	function showImgBoardList(result) {
		$("#imgBoardList").removeAttr("style").css("width", "400px");
		//$("#imgBoardList_1").append("<button style='width:200px; float:left;' id='writeImgBoard'>작성</button>"); 
		//$("#imgBoardList_1").append("<button style='width:200px;' id='closeImgBoard'>닫기</button>"); 
		$.each(result, (id, it) => {
			$("#imgBoardList_1").append("<div id='img_boss'>" + 
					"<a class='aa' href=''><img id='" + it.num + "' src='/img/" + it.img_path + "' width='400' heigth='200'/></a>" +
					"<div align='center' class='img_left'>" + it.num + "</div>" + 
					"<div align='center' class='img_left'>" + 
					"<a id='" + it.num + "' class='a aa' href=''>" + 
					it.title + "</a></div>" + 
					"<div align='center' class='img_left'>" + it.writer + "</div>" + 
			"</div>");
		});
	}
	
	function showImgBoardListAction() {
		$(".a").hover((e) => {
			var num = e.target.id;
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/imgBoard/viewBox",
				data: {
					"num" : num
				},
				success: (data) => {
					var result = JSON.parse(data);
					ahover(result);
				}
			});
		},
		//게시물 제목에 마우스를 올리고 나왔을 때 핸들러
		() => {
			aout();
		});
		
		$(".aa").click((e) => {
			e.preventDefault();
			var num = e.target.id;
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/imgBoard/detail",
				data: {
					"num" : num
				},
				success: (data) => {
					var result = JSON.parse(data);
					console.log(result);
					$("#imgBoardList").css("display", "none");
					$(".imgDetailView").removeAttr("style");
					if(id == result.writer) {
						$("#editImgBoard").remove();
						$("#delImgBoard").remove();
						$("#imgDetail").attr("src", "/img/" + result.img_path);
						$("#imgDetailNum").val(result.num).css("border", "1px solid black").attr("readonly", "readonly");
						$("#imgDetailWriter").val(result.writer).css("border", "1px solid black").attr("readonly", "readonly");
						$("#imgDetailTitle").val(result.title).css("border", "1px solid black");
						$("#imgDetailContent").val(result.content).css("border", "1px solid black");
						$("#editImgBoardForm").append("<button id='editImgBoard'>수정</button>");
						$("#editImgBoardForm").append("<input type='button' id='delImgBoard' value='삭제'>");
						$("#editImgBoard").click(() => {
							if($("#imgDetailTitle").val() == "" || $("#imgDetailContent").val() == "") {
								$("#alert").css("color", "red").html("빈칸 없이");
							}
							else {
								$("#editImgBoard").remove();
								$("#delImgBoard").remove();
								$("#editImgBoardForm").submit();
							}
						});
						$("#delImgBoard").click(() => {
							$("#editImgBoardForm").attr("action", "${pageContext.request.contextPath}/imgBoard/delete");
							$("#editImgBoardForm").submit();
						});
					}
					else {
						$("#delImgBoard").remove();
						$("#editImgBoard").remove();
						$("#imgDetail").attr("src", "/img/" + result.img_path);
						$("#imgDetailNum").val(result.num).css("border", "1px solid black").attr("readonly", "readonly");
						$("#imgDetailWriter").val(result.writer).css("border", "1px solid black").attr("readonly", "readonly");
						$("#imgDetailTitle").val(result.title).css("border", "1px solid black").attr("readonly", "readonly");
						$("#imgDetailContent").val(result.content).css("border", "1px solid black").attr("readonly", "readonly");
					}
					showImgRepList();
				}
			});
		});
		
		$("#writeImgBoard").click(() => {
			$("#imgBoardList").css("display", "none");
			$(".imgBoardWrite").removeAttr("style");
			var writer = $("#imgWriteWriter").val(id);
			console.log("작성한다");
		});
		$("#closeImgBoard").click(() => {
			$("#imgBoardList").css("display", "none");
		});
	}
	
	function showBoardList(result) {
		$("#boardList").removeAttr("style").css("width", "300px");
		$("#boardList_1").append("<button style='width:300px; clear:both;' id='writeBoard'>작성</button>"); 
		$("#boardList_1").append("<div id='boss'>" + 
				"<div align='center' class='left'>번호</div>" + 
				"<div align='center' class='left'>제목</div>" + 
				"<div align='center' class='left'>작성자</div>" + 
		"</div>");
		$.each(result, (id, it) => {
			$("#boardList_1").append("<div id='boss'>" + 
					"<div align='center' class='left'>" + it.num + "</div>" + 
					"<div align='center' class='left'>" + 
					"<a id=" + it.num + " class='a' href=''>" + 
					it.title + "</a></div>" + 
					"<div align='center' class='left'>" + it.writer + "</div>" + 
			"</div>");
		});
		$("#boardList_1").append("<button style='width:300px; clear:both;' id='closeBoard'>닫기</button>"); 
	}
	
	function showBoardListAction() {
		//게시물 작성 버튼 클릭시 핸들러
		$("#writeBoard").click(() => {
			$("#boardList").css("display", "none");
			$(".boardWrite").removeAttr("style");
			var writer = $("#writeWriter").val(id);
		});
		
		$(".a").hover((e) => {
			var num = e.target.id;
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/board/viewBox",
				data: {
					"num" : num
				},
				success: (data) => {
					var result = JSON.parse(data);
					ahover(result);
				}
			});
		},
		//게시물 제목에 마우스를 올리고 나왔을 때 핸들러
		() => {
			aout();
		});
		
		//게시물 제목 클릭시 핸들러
		$(".a").click((e) => {
			e.preventDefault();
			var num = e.target.id;
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/board/detail",
				data: {
					"num" : num
				},
				success: (data) => {
					var result = JSON.parse(data);

					aclick(result);
					showCommentList();
				}
			});
		});
		//게시물 닫기 버튼 클릭 시 핸들러
		$("#closeBoard").click(() => {
			$("#boardList").css("display", "none");
		});
	}
	
	$("#boardSearchBtn").click(() => {
		var form = $("#boardSearchForm");
		var type = $("#type option:selected").val();
		var data = $("#searchData").val();
		
		if(data == "") {
			alert("빈칸없이");
		}
		else {
			$("#boardList_1").empty();
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/board/search",
				data: {
					"type": type,
					"data": data,
				},
				success: (data) => {
					var result = JSON.parse(data);
					showBoardList(result);
					showBoardListAction();
					$("#searchData").val("");
				}
			});
		}
	});
	
	//내정보 보기 닫기 버튼 클릭 시 핸들러
	$("#close").click(() => {
		$("#infoForm").css("display", "none");
	});
	
	//내 정보 보기 수정 버튼 클릭 시 핸들러
	$("#submit").click(() => {
		var pwd = $("#pwd").val();
		var eamil = $("#eamil").val();

		if(pwd == "" || email == "") {
			$("#alert").css("color", "red").html("빈칸 없이");
		}
		else {
			$("#infoForm").submit();
		}
	});
	
	//마우스 움직일 때마다 커서의 위치 값을 받아오는 핸들러
	$(document).on("mousemove", (e) => {
		cursorX = e.pageX;
		cursorY = e.pageY;
	});
	
	//뒤로가기 버튼 클릭 시 핸들러
	$(".back").click(() => {
		$("#boardList").removeAttr("style").css("width", "300px")
		$(".detailView").css("display", "none");
		$(".boardWrite").css("display", "none");
		$("#imgBoardList").css("display", "none");
		$("#editBoard").remove();
		$("#delBoard").remove();
	});
	
	//게시물 작성 양식에서 작성 버튼 클릭시
	$("#writeBtn").click(() => {
		var writer = $("#writeWriter").val();
		var title = $("#writeTitle").val();
		var content = $("#writeContent").val();

		if(title == "" || content == "") {
			alert("빈칸 없이");
			$("#writeBoardForm").submit((e) => {
				return false;
			});
		}
		else {
			$("#writeBoardForm").submit();
		}
	});
	
	$(".imgBack").click(() => {
		$("#imgBoardList").removeAttr("style").css("width", "400px")
		$(".detailView").css("display", "none");
		$(".imgBoardWrite").css("display", "none");
		$("#boardList").css("display", "none");
		$(".imgDetailView").css("display", "none");
		$("#editBoard").remove();
		$("#delBoard").remove();
	});
	
	$("#imgWriteBtn").click(() => {
		var writer = $("#imgWriteWriter").val();
		var title = $("#imgWriteTitle").val();
		var content = $("#imgWriteContent").val();
		var file = $("#imgWriteFile").val();

		if(title == "" || content == "") {
			alert("빈칸 없이");
			$("#writeBoardForm").submit((e) => {
				return false;
			});
		}
		else {
			$("#writeBoardForm").submit();
		}
	});
	
	function showCommentList() {
		$("#commentList").empty();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/comment/list",
			data: {
				"num": $("#detailNum").val()		
			},
			success: (data) => {
				var result = JSON.parse(data);
				$.each(result, (index, it) => {
					var str = "<div id='commentBoss'>" + 
							  "<div align='center' class='commentWri'>" + it.writer + "</div>" + 
							  "<div align='center' class='commentCon'>" + 
							  it.content + "</div>";
					if(it.writer == id){
						console.log("아이디가 주인장과 일치");
						str += "<div align='center' class='commentCl'>";
						str += "<button id=" + it.comment_num + " class='editCommentBtn'>수정</button>"
						str += "<button id=" + it.comment_num + " class='delCommentBtn'>삭제</button>";
						str += "</div>";
					}
					str += "</div><br>";
					$("#commentList").append(str);
				});
			$(".editCommentBtn").click((e) => {
				var comment_num = e.target.id;
				var commentPa = $("#" + comment_num).parent().parent();
				console.log(commentPa);
				var content = commentPa.children()[1];
				var button = commentPa.children()[2];
				var text = content.innerText;
				$(content).html("");
				$(content).append("<input class='editCommentText' type='text' name='content' size='18' value='" + text + "'>");
				$(button).empty();
				$(button).append("<button id=" + comment_num + " class='saveCommentBtn'>저장</button>" +
								 "<button class='cancleCommentBtn'>취소</button>");
				
				$(".saveCommentBtn").click((e) => {
					var content = $(".editCommentText").val();
					if(content == "") {
						alert("빈칸없이");
					}
					else {
						$.ajax({
							type: "POST",
							url: "${pageContext.request.contextPath}/comment/edit",
							data: {
								"comment_num": e.target.id,
								"content": content
							},
							success: (data) => {
								$("#commentList").empty();
								showCommentList();
							}
						});
					}
				});
				$(".cancleCommentBtn").click(() => {
					showCommentList();
				});
			});
			
			
			$(".delCommentBtn").click((e) => {
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/comment/delete",
					data: {
						"comment_num": e.target.id,
					},
					success: (data) => {
						$("#commentList").empty();
						showCommentList();
					}
				});
			});
			}
		});
	}
	
	$("#commentForm").submit((e) => {
		var content = $("#comment").val();
		var article_num = Number($("#detailNum").val());
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/comment/write",
			data: {
				"comment_num": 0,
				"article_num": article_num,
				"writer": id,
				"content": content
			},
			success: (data) => {
				$("#comment").val("");
				showCommentList();
			}
		});
	})
	
	$("#commentBtn").click(() => {
		var content = $("#comment").val();
		var article_num = Number($("#detailNum").val());
		
		if(content == "") {
			alert("빈칸 없이");
		}
		else {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/comment/write",
				data: {
					"comment_num": 0,
					"article_num": article_num,
					"writer": id,
					"content": content
				},
				success: (data) => {
					$("#comment").val("");
					showCommentList();
				}
			});
		}
	});
	
	function showImgRepList() {
		$("#imgRepList").empty();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/imgRep/list",
			data: {
				"img_num": $("#imgDetailNum").val()		
			},
			success: (data) => {
				var result = JSON.parse(data);
				$.each(result, (index, it) => {
					var str = "<div id='imgRepBoss'>" + 
							  "<div align='center' class='imgRepWri'>" + it.writer + "</div>" + 
							  "<div align='center' class='imgRepCon'>" + 
							  it.content + "</div>";
					if(it.writer == id){
						console.log("아이디가 주인장과 일치");
						str += "<div align='center' class='imgRepCl'>";
						str += "<button id=" + it.num + " class='editimgRepBtn'>수정</button>"
						str += "<button id=" + it.num + " class='delimgRepBtn'>삭제</button>";
						str += "</div>";
					}
					str += "</div><br>";
					$("#imgRepList").append(str);
				});
			$(".editImgRepBtn").click((e) => {
				var num = e.target.id;
				var commentPa = $("#" + num).parent().parent();
				console.log(commentPa);
				var content = commentPa.children()[1];
				var button = commentPa.children()[2];
				var text = content.innerText;
				$(content).html("");
				$(content).append("<input class='editImgRepText' type='text' name='content' size='18' value='" + text + "'>");
				$(button).empty();
				$(button).append("<button id=" + num + " class='saveImgRepBtn'>저장</button>" +
								 "<button class='cancleImgRepBtn'>취소</button>");
				
				$(".saveImgRepBtn").click((e) => {
					var content = $(".editImgRepText").val();
					if(content == "") {
						alert("빈칸없이");
					}
					else {
						$.ajax({
							type: "POST",
							url: "${pageContext.request.contextPath}/imgRep/edit",
							data: {
								"num": e.target.id,
								"content": content
							},
							success: (data) => {
								$("#imgRepList").empty();
								showImgRepList();
							}
						});
					}
				});
				$(".cancleImgRepBtn").click(() => {
					showImgRepList();
				});
			});
			
			$(".delImgRepBtn").click((e) => {
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/imgRep/delete",
					data: {
						"num": e.target.id,
					},
					success: (data) => {
						$("#imgRepList").empty();
						showImgRepList();
					}
				});
			});
			}
		});
	}
	
	$("#imgRepForm").submit((e) => {
		var content = $("#imgRep").val();
		var img_num = Number($("#imgDetailNum").val());
		e.preventDefault();
		if(content == "") {
			alert("빈칸 없이");
		}
		else {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/imgRep/write",
				data: {
					"num": 0,
					"img_num": img_num,
					"writer": id,
					"content": content
				},
				success: (data) => {
					$("#imgRep").val("");
					showImgRepList();
				}
			});
		}
	})
	
	$("#imgRepBtn").click(() => {
		var content = $("#imgRep").val();
		var img_num = Number($("#imgDetailNum").val());
		if(content == "") {
			alert("빈칸 없이");
		}
		else {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/imgRep/write",
				data: {
					"num": 0,
					"img_num": img_num,
					"writer": id,
					"content": content
				},
				success: (data) => {
					$("#imgRep").val("");
					showImgRepList();
				}
			});
		}
	});
	
	//게시물 제목에 마우스를 올렸을 떄 호출되는 함수
	function ahover(result) {
		$(".viewBox").css("position", "absolute").css("top", cursorY - 100)
		.css("left", cursorX + 10).css("width", "200px")
		.css("background-color", "#ecd8ef");
		$("#num").html("글번호 : " + result.num + "").css("border", "1px solid black");
		$("#writer").html("작성자 : " + result.writer).css("border", "1px solid black");
		$("#title").html("제에목 : " + result.title).css("border", "1px solid black");
		if(result.content.length < 10) {
			$("#content").html("내애용 : " + result.content).css("border", "1px solid black");
		}
		else {
			$("#content").html("내애용 : " + result.content.substring(0, 9) + "...").css("border", "1px solid black");						
		}
	}
	
	//게시물 제목에 마우스를 올리고 나왔을 때 호출되는 함수
	function aout() {
		$(".viewBox").removeAttr("style");
		$("#num").html("").removeAttr("style");
		$("#writer").html("").removeAttr("style");
		$("#title").html("").removeAttr("style");
		$("#content").html("").removeAttr("style");
	}
	
	//게시물 제목 클릭 시 호출되는 함수
	function aclick(result) {
		$("#boardList").css("display", "none");
		$(".detailView").removeAttr("style");
		if(id == result.writer) {
			$("#editBoard").remove();
			$("#delBoard").remove();
			$("#detailNum").val(result.num).css("border", "1px solid black").attr("readonly", "readonly");
			$("#detailWriter").val(result.writer).css("border", "1px solid black").attr("readonly", "readonly");
			$("#detailTitle").val(result.title).css("border", "1px solid black");
			$("#detailContent").val(result.content).css("border", "1px solid black");
			$("#editBoardForm").append("<button id='editBoard'>수정</button>");
			$("#editBoardForm").append("<input type='button' id='delBoard' value='삭제'>");
			$("#editBoard").click(() => {
				if($("#detailTitle").val() == "" || $("#detailContent").val() == "") {
					$("#alert").css("color", "red").html("빈칸 없이");
				}
				else {
					$("#editBoard").remove();
					$("#delBoard").remove();
					$("#editBoardForm").submit();
				}
			});
			$("#delBoard").click(() => {
				$("#editBoardForm").attr("action", "${pageContext.request.contextPath}/board/delete");
				$("#editBoardForm").submit();
			});
		}
		else {
			$("#delBoard").remove();
			$("#editBoard").remove();
			$("#detailNum").val(result.num).css("border", "1px solid black").attr("readonly", "readonly");
			$("#detailWriter").val(result.writer).css("border", "1px solid black").attr("readonly", "readonly");
			$("#detailTitle").val(result.title).css("border", "1px solid black").attr("readonly", "readonly");
			$("#detailContent").val(result.content).css("border", "1px solid black").attr("readonly", "readonly");
		}
	}
});
</script>

<body>
	<div id="head_box">
		<h2>${sessionScope.id}메뉴다</h2>
	</div>
	
	<div id="left_box">
		<div>
			<button id="infoBtn">내 정보보기</button><br>
			<button id="logoutBtn">로그아웃</button><br>
			<button id="delBtn">탈퇴</button><br>
			<button id="boardListBtn">게시판보기</button><br>
			<button id="imgBoardListBtn">뉴스피드</button><br>
			<button id="imgBoardMeBtn">타임라인</button><br>
			<button id="downloadImgBtn">이미지 자료실</button><br>
			<button id="downloadEtcBtn">잡다한 자료실</button><br>
		</div>
	</div>
	
	<!-- 밑 부분은 SAP 처리를 위한 양식들임.. -->
	<div id="center_box">
		<!-- 회원 정보에 대한 양식 -->
		<div id="infoForm" style="display:none">
			<form action="${pageContext.request.contextPath}/member/editInfo" method="POST">
				<label>아이디 : </label><input type="text" id="id" name="id" value="" readonly><br>
				<label>비밀번 : </label><input type="password" id="pwd" name="pwd" value="" autocomplete="off"><br>
				<label>이르음 : </label><input type="text" id="name" name="name" value="" readonly><br>
				<label>이메일 : </label><input type="text" id="email" name="email" value="" autocomplete="off"><br>
				<input id="close" type="button" value="닫기">
				<input id="submit" type="submit" value="수정">
				<span id="alert"></span>
			</form>
		</div>
		
		<!-- 게시물을 뿌려줄 영역 -->
		<div id="boardList" style="display:none">
			<div id="boardList_2">
				<form id="boardSearchForm" action="${pageContext.request.contextPath}/board/search" method="POST">
					<select id="type" name="type">
						<option value="1" selected="selected">제목</option>
						<option value="2">작성자</option>
					</select>
					<input id="searchData" type="text" name="data" value="" autocomplete="off">
					<input id="boardSearchBtn" type="button" value="검색">
				</form>
			</div>
			<div id="boardList_1">
			</div>
		</div>
		
		<!-- 게시물을 작성하기 위한 양식 -->
		<div class="boardWrite" style="display:none">
			<form id="writeBoardForm" action="${pageContext.request.contextPath}/board/write" method="POST" accept-charset="UTF-8">
				<input type="hidden" id="writeNum" name="num" value="0"><br>
				<label>작성자</label><input type="text" id="writeWriter" name="writer" value=""><br>
				<label>제에목</label><input type="text" id="writeTitle" name="title" value="" autocomplete="off" maxlength="6"><br>
				<label>내애용</label><input type="text" id="writeContent" name="content" value="" autocomplete="off"><br>
				<input type="button" class="back" value="뒤로가기">
				<button id="writeBtn">작성</button>
			</form>
		</div>
		
		<!-- 게시물을 자세히 보여주고 수정 삭제 기능을 하는 폼 -->
		<div class="detailView" style="display:none">
			<form id="editBoardForm" action="${pageContext.request.contextPath}/board/edit" method="POST">
				<label>버언호</label><input type="text" id="detailNum" name="num" value=""><br>
				<label>작성자</label><input type="text" id="detailWriter" name="writer" value=""><br>
				<label>제에목</label><input type="text" id="detailTitle" name="title" value="" autocomplete="off"><br>
				<label>내애용</label><input type="text" id="detailContent" name="content" value="" autocomplete="off"><br>
				<input type="button" class="back" value="뒤로가기">
			</form>
			<form id="commentForm" action="${pageContext.request.contextPath}/comment/write" method="POST">
				<label>댓글 : </label>
				<input type="text" id="comment" name="content" value="">
				<input type="button" id="commentBtn" value="작성">
			</form>
			<div id="commentList">
			</div>
		</div>
		
		<div id="imgBoardList" style="display:none;">
			<div id="imgBoardList_1">
			</div>
			<%-- <div id="imgBoardList_2">
				<form id="imgBoardSearchForm" action="${pageContext.request.contextPath}/imgBoard/search" method="POST">
					<select id="imgType" name="type">
						<option value="1" selected="selected">제목</option>
						<option value="2">작성자</option>
					</select>
					<input id="imgSearchData" type="text" name="data" value="">
					<input id="imgBoardSearchBtn" type="button" value="검색">
				</form>
			</div> --%>
		</div>
		
		<div class="imgBoardWrite" style="display:none">
			<form id="writeImgBoardForm" action="${pageContext.request.contextPath}/imgBoard/write" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
				<input type="hidden" id="imgWriteNum" name="num" value="0"><br>
				<label>작성자</label><input type="text" id="imgWriteWriter" name="writer" value="" readonly><br>
				<label>제에목</label><input type="text" id="imgWriteTitle" name="title" value="" autocomplete="off" maxlength="15"><br>
				<label>내애용</label><input type="text" id="imgWriteContent" name="content" value="" autocomplete="off"><br>
				<label>이미지</label><input type="file" id="imgWriteFile" name="file" value=""><br>
				<input type="button" class="imgBack" value="뒤로가기">
				<button id="imgWriteBtn">작성</button>
			</form>
		</div>
		
		<!-- 게시물을 자세히 보여주고 수정 삭제 기능을 하는 폼 -->
		<div class="imgDetailView" style="display:none">
			<form id="editImgBoardForm" action="${pageContext.request.contextPath}/imgBoard/edit" method="POST">
				<input type="text" id="imgDetailNum" name="num" value="" size="3">
				<input type="text" id="imgDetailWriter" name="writer" value="">
				<img src="" width="400" height="250" id="imgDetail"><br>
				<label>제목</label><input type="text" id="imgDetailTitle" name="title" value="" autocomplete="off"><br>
				<label>내용</label><input type="text" id="imgDetailContent" name="content" value="" autocomplete="off"><br>
				<input type="button" class="imgBack" value="뒤로가기">
			</form>
			<form id="imgRepForm" action="${pageContext.request.contextPath}/imgRep/write" method="POST">
				<label>댓글 : </label>
				<input type="text" id="imgRep" name="content" value="" autocomplete="off">
				<input type="button" id="imgRepBtn" value="작성">
			</form>
			<div id="imgRepList">
			</div> 
		</div>
		
		<div class="imgDownloadList" style="display:none">
		</div>
	</div>
	
	<!-- 게시물을 미리보기 위한 영역 -->
	<div class="viewBox">
		<div id="num"></div>
		<div id="writer"></div>
		<div id="title"></div>
		<div id="content"></div>
	</div>
	
	<div class="imgViewBox">
		<img id="imgSrc" src="">
	</div>
	
	<div id="right_box">
		<div id="friendList">
		</div>
	</div>
</body>
</html>
