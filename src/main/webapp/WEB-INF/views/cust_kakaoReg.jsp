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
		$("#kakao_frm").submit();
	});
</script>
</head>
<body>
<form id="kakao_frm" action="cust_kakaoReg1">
	이름 : <input type="text" id="cust_name" name="cust_name" value="${name}">
	이메일 : <input type="text" id="cust_email" name="cust_email" value="${email}">
</form>
</body>
</html>