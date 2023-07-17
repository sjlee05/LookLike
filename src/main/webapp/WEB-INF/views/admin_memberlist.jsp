<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	width: 1100px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
}

table {
	margin: 0 auto;
}

.div_page {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.div_page ul {
	display: flex;
	list-style: none;
}

.tab {
	border-collapse: collapse;
	width: 1100px;
	/* 	height: 1000px; */
	border-top: none;
	border-right: none;
	/* 	border-bottom: none; */
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
}

.tab td {
	border-top: none;
	border-right: none;
	border-bottom: none;
	border-left: none;
	height: 80px;
}

.tab tr {
	border-top: 2px solid #a9a9a9;
}

.tab tr:first-child {
	border-top: none;
}

a {
	text-decoration: none;
	color: #BC8F8F;
}

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
</style>
</head>
<body>
	<div class="background-image"></div>
	<div class="content">
		<h2 style="color: #BC8F8F;">회원 목록</h2>
		<table border="1" class="tab">
			<tr>
				<td>No</td>
				<td>Name</td>
				<td>ID</td>
				<td>Pwd</td>
				<td>Gender</td>
				<td>Address</td>
				<td>Phone</td>
				<td>Tel</td>
				<td>SingOut</td>
			</tr>
			<c:forEach items="${list}" var="Ldto">
				<tr>
					<td>${Ldto.cust_key}</td>
					<td>${Ldto.cust_name}</td>
					<td>${Ldto.cust_id}</td>
					<td>${Ldto.cust_pwd}</td>
					<td>${Ldto.cust_gender}</td>
					<td>${Ldto.cust_addr}</td>
					<td>${Ldto.cust_phone}</td>
					<td>${Ldto.cust_tel}</td>
					<td>${Ldto.cust_signout}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="11" style="text-align: right;">
					<form action="admin_search">
						<input type="text" name="keyword" placeholder="회원 ID">
						 <input type="submit" value="검색" class="btn" style="padding: 8px 16px;">
					</form>
					<button onclick="location.href='admin_managerpage'" class="btn" style="padding: 8px 16px; margin-top: 5px;">목록</button>
				</td>
			</tr>
		</table>
		<div class="div_page">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button">
						<!-- 					시작페이지 - 1 하면 이전의 10개 페이지 표시 --> <!--ex>11->10(1~10), 21->20(11~20) -->
						<a href="${pageMaker.startPage - 1}"> [Previous] </a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
					<li class="paginate_button">
						<!-- 					클릭한 현재페이지 번호를 링크로 연결 --> <a href="${num}"> [${num}]
					</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button">
						<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 --> <!-- 				ex>10->11(11~20), 20->21(21~30) -->
						<a href="${pageMaker.endPage + 1}"> [Next] </a>
					</li>
				</c:if>
			</ul>
		</div>

		<form method="get" id="actionForm" action="admin_memberlist">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</div>
</body>
</html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
	// 	페이지번호 처리
	$(".paginate_button a").on("click", function(e) {
		// 		기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		// 		console.log("click~!!!");
		console.log("@# href ===>" + $(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	// 	게시글 처리
	$(".move_link").on("click", function(e) {
			e.preventDefault();
			var targetBno = $(this).attr("href");
			
			var bno = actionForm.find("input[name='bid']").val();
			if (bno != ''){
				actionForm.find("input[name='bid']").remove();
			}
			
			// 		content_view?bid=${dto.bid} 에 있는 ?bid 의 bid 와 name 을 매칭
			actionForm.append("<input type='hidden' name ='bid' value='"+targetBno+"'>")
			// 		컨트롤러에 content_view 로 찾아감 
			actionForm.attr("action", "admin_content_view").submit();
		});
</script>