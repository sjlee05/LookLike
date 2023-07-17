<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.background-image {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/Model1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.content {
	position: relative;
	z-index: 1;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 5px;
	width: 600px;
	height: 400px;
	margin: 0 auto;
	margin-top: 200px;
	text-align: center;
}

.logout {
	display: flex;
	justify-content: center;
	position: absolute;
	right: 20px;
	bottom: 20px;
}

.title {
	text-align: center;
}

.btn {
	display: block;
	background-color: silver;
	color: white;
	border: none;
	text-align: center;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
	margin-top: 10px;
}

.btn:hover {
	background-color: #DEB887;
}

.btn a {
	text-decoration: none;
	font-size: 1.2em;
	font-weight: bolder;
	color: gray;
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var adAuth = ${ad_auth}; // ad_auth 값 가져오기

    if (adAuth == "1") {
        $("#manager").hide(); // ad_auth가 1인  경우 manager 요소 숨기기
    }
});
function logout() {
	alert("로그 아웃 되었습니다.");
	location.href = "admin_logout";
}
</script>
</head>
<body>
	<div class="background-image"></div>
	<div class="content">
		<h1 class="title" style="color: #DEB887;">관리자 페이지</h1>
		<div class="menu">
			<div class="btn" id="manager">
				<a href="admin_managerlist">직원 목록</a>
			</div>
			<div class="btn">
				<a href="admin_memberlist">회원 목록</a>
			</div>
			<div class="btn">
				<a href="prod_list">상품 목록</a>
			</div>
			<div class="btn">
				<a href="qna_list">QnA 관리</a>
			</div>
			<div class="btn">
				<a href="notice_list">공지사항 관리</a>
			</div>
			<div class="btn">
				<a href="review_list">리뷰 관리</a>
			</div>
			<div class="btn">
				<a href="sale_list">결제 내역 관리</a>
			</div>
		</div>
		<div class="logout">
			<button onclick="logout()" style="width: 80px; height: 40px;">로그아웃</button>
		</div>
	</div>
</body>
</html>