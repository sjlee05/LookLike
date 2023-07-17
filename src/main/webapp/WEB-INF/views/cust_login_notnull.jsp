<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>
	$(function(){
		alert("이미 등록된 이메일입니다");
		location.href="cust_login";
	});
</script>
</head>
<body>
	이미 등록된 이메일입니다
	<a href="cust_login">로그인</a>
</body>
</html>