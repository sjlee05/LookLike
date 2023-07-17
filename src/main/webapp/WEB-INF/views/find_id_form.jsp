<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link href="resources/css/stylelogin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/nav.css">
<script src="resources/js/nav.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
	$(document).ready(function() {
		var message = "${msg}";
		if (message) {
// 			alert(message);
		}
	});
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
	});

	function fn_submit() {
		//form 요소 자체
		var formData = $("#frm").serialize();

		$.ajax({
			type : "POST",
			data : formData,
			success : function(data) {
				alert("잠시만 기다려주세요");
			},
			error : function() {
				alert("오류가 발생했습니다");
			}
		});

	};
</script>
<style>
body {
	background-color: rgba(0, 0, 0, 0);
}

.footer {
	width: 100%;
	position: fixed;
	left: 0;
	bottom: -180px;
	z-index: 99;
}

.form-structor::after {
	background-image: url("resources/images/login.gif");
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="form-structor">
		<form id="frm" method="post" action="cust_idFind">
			<div class="signup">
				<h2 class="form-title" id="signup">ID 찾기</h2>
				<div class="form-holder">
					<input type="text" class="input" placeholder="name"
						name="cust_name" /> <input type="email" class="input"
						placeholder="email" name="cust_email" />
				</div>
				<button class="submit-btn" onclick="fn_submit()">아이디 찾기</button>
			</div>
		</form>
	</div>
	<div class="footer"><%@ include file="/WEB-INF/views/include/footer.jsp"%></div>
</body>
</html>