<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
		height: 100%;
		margin: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: gray;
		color: white;
}
a{
	text-decoration: none;
	color: blue;
}
	</style>
</head>
<body>
<div align="center">
<h2>검색 결과</h2>
<table width="500" border="1">
		<tr>
			<td>ad_key</td>
			<td>ad_id</td>
			<td>ad_pwd</td>
			<td>ad_name</td>
			<td>ad_auth</td>
		</tr>
		<c:forEach items="${searchmanager}" var="manager">
			<tr>
				<td>${manager.ad_key}</td>
				<td>
					<a href="admin_content_view?ad_id=${manager.ad_id}">${manager.ad_id}</a>
				</td>
				<td>${manager.ad_pwd}</td>
				<td>${manager.ad_name}</td>
				<td>${manager.ad_auth}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" style="text-align: right;">
				<button><a href="admin_managerlist">목록 보기</a></button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>