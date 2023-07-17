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
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
}

.tab {
	border-collapse: collapse;
	width: 900px;
/* 	height: 1000px; */
	border-top:none;
	border-right: none;
/* 	border-bottom: none; */
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	
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
	.btn{
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
		<h2>직원 목록</h2>
		<table border="1" class="tab">
			<tr>
				<td>ad_key</td>
				<td>ad_id</td>
				<td>ad_pwd</td>
				<td>ad_name</td>
				<td>ad_auth</td>
			</tr>
			<c:forEach items="${managerlist}" var="manager">
				<tr>
					<td>${manager.ad_key}</td>
					<td><a href="admin_content_view?ad_id=${manager.ad_id}">${manager.ad_id}</a></td>
					<td>${manager.ad_pwd}</td>
					<td>${manager.ad_name}</td>
					<td>${manager.ad_auth}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" style="text-align: right;">
					<form action="admin_searchmanager">
						<input type="text" name="keyword" placeholder="직원 ID">
						 <input type="submit" value="검색" class="btn" style="padding: 5px 13px;">
					</form>
					<button onclick="location.href='admin_managerpage'" class="btn" style="padding: 5px 13px;margin-top: 5px;">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>