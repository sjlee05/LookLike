<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn {
	display: inline-block;
	background-color: #BC8F8F;
	color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
}

.btn:hover {
	background-color: #DEB887;
}

body {
	background-color:#FFFAFA;
	margin-top: 300px;
	 font-family: 'Times New Roman', Times, serif;
}

.footer {
	width: 100%;
	position: fixed;
	left: 0;
	bottom: -180px;
	z-index: 99;
}

.table-wrapper {
	display: flex;
	justify-content: center;
	margin-bottom: 300px;
}

.tab {
	border-collapse: collapse;
	width: 800px;
	border-top:none;
	border-right: none;
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	margin-top: 200px;
	}
	.tab td{
	border-top:none;
	border-right: none;
	border-bottom: none;
	border-left: none;
	height: 80px;
	}
	.tab tr{
	border-top: 2px solid #a9a9a9;
	}
	.tab tr:first-child {
	border-top: none;
	}
	.tab
	a{
	text-decoration: none;
	color: #DEB887;
	}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="resources/css/notice.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="resources/css/nav.css">
<script src="resources/js/nav.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
	var cust_id;
	var ad_id;
	$(function() {
		$(".footer").hover(function() {
			$(this).animate({
				"bottom" : 0
			});
		}, function() {
			$(this).animate({
				"bottom" : "-180px"
			});
		});

		cust_id = "${cust_id}";
		console.log("cust_id:" + cust_id);
		ad_id = "${ad_id}";
		
		var login_word = "Log In";
		$(".modal-btn").hide();

		if (cust_id.length > 0) {
			$(".modal-btn").show();
			$(".login-btn").text(cust_id);
			$(".login-btn").css({
				"background-color" : "#BC8F8F"
			});
		} else if (ad_id.length > 0) {
			$(".modal-btn").show();
			$(".login-btn").text(ad_id);
			$(".login-btn").css({
				"background-color" : "#BC8F8F"
			});
			$(".login-btn").parent().attr("href", "admin_managerpage");
			$(".login-btn").attr("onclick",
					"location.href='admin_loginmanager'");
		} else {
			$(".modal-btn").hide();
			$(".login-btn").text(login_word);
			$(".login-btn").css({
				"background-color" : "lightblue"
			});
		}
	});

	$(document).ready(function() {
		var admin = "${ad_id}";

		if (!admin) {
			$("#manager1").hide();
			$("#manager2").hide();
		}
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav-main.jsp"%>
	<a class="login-a" href="cust_login"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
	<a class="login-a" href="cust_logout"><button class="modal-btn">LogOut</button></a>
	<div class="table-wrapper">
		<table border="1" class="tab">
			<form method="post" action="notice_modify_view">
				<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="not_key" value="${content_view.not_key}">

				<tr>
					<td>번호</td>
					<td>${content_view.not_key}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${content_view.not_hit}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${content_view.ad_id}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${content_view.not_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${content_view.not_content} <br> <c:if
							test="${not empty not_imgpath}">
							<c:forEach var="not_imgpath" items="${not_imgpath}"
								varStatus="status">
								<div>
									<img src="${not_imgpath}" alt="이미지"> <input type="hidden"
										id="imgPath${status.count}" value="${not_imgpath}">
								</div>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" id="manager1" class="btn" style="padding: 8px 16px;">
						 &nbsp;&nbsp;
						<input type="submit" value="목록보기" formaction="notice_list" class="btn" style="padding: 8px 16px;"> 
						 &nbsp;&nbsp;
						<input type="submit" value="삭제" id="manager2" formaction="notice_delete" class="btn" style="padding: 8px 16px;">
					</td>
				</tr>
			</form>
		</table>
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
</body>
</html>