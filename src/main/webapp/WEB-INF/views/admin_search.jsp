<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div_page {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 20px;
	}
.div_page ul{
		display: flex;
		list-style: none;
	}
html, body {
		height: 100%;
		margin: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: gray;
		color: white;
	}
	</style>
</head>
<body>
<div align="center">
<h2>검색 결과</h2>
<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>Name</td>
			<td>ID</td>
			<td>Pwd</td>
			<td>Gender</td>
			<td>Address</td>
			<td>Phone</td>
			<td>Tel</td>
			<td>SingOut</td>
			<td>BirthDay</td>
			<td>Grade</td>
		</tr>
		<c:forEach items="${search}" var="Ldto">
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
				<td>${Ldto.cust_birthday}</td>
				<td>${Ldto.cust_grade}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11" style="text-align: right;">
				<button><a href="admin_memberlist">목록 보기</a></button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>