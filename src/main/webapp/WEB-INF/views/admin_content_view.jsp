<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 600px;
	height: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
}
.tab {
	border-collapse: collapse;
	width: 600px;
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
		<table border="1" class="tab">
			<form method="post" action="admin_modify">
				<input type="hidden" name="ad_id" value="${manager.ad_id}">
				<tr>
					<td>ad_key</td>
					<td>${manager.ad_key}</td>
				</tr>
				<tr>
					<td>ad_id</td>
					<td>${manager.ad_id}</td>
				</tr>
				<tr>
					<td>ad_pwd</td>
					<td><input type="text" name="ad_pwd" value="${manager.ad_pwd}" style="height: 20px;"></td>
				</tr>
				<tr>
					<td>ad_name</td>
					<td>${manager.ad_name}</td>
				</tr>
				<tr>
					<td>ad_auth</td>
					<td><input type="text" name="ad_auth"
						value="${manager.ad_auth}" style="height: 20px;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정" class="btn" style="padding: 5px 13px;">&nbsp;&nbsp;
									<a href="admin_managerlist" class="btn" style="padding: 5px 13px;">목록보기</a> &nbsp;&nbsp;
									<a href="admin_delete?ad_id=${manager.ad_id}" class="btn" style="padding: 5px 13px;">삭제</a>
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>














