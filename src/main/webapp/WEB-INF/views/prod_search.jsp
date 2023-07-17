<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .div_page ul{
      display: flex;
      list-style: none;
   }
   .tab {
	border-collapse: collapse;
	width: 1300px;
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
<div align="center">
	<table border="1" class="tab">
		<tr>
			<td width="20%">썸네일</td>
			<td width="5%">상품고유번호</td>
			<td width="5%">카테고리고유번호</td>
			<td width="25%">상품명</td>
			<td width="10%">상품설명</td>
			<td width="10%">상품가격</td>
			<td width="10%">등록일</td>
			<td width="5%">재고</td>
			<td width="5%">사이즈</td>
		</tr>
		<c:forEach items="${search}" var="dto">
			<tr>
   				<td>
<%--    				${dto.prod_thumbnailPath} --%>
    				<img src="${dto.prod_thumbnailPath}">
   				</td>
				<td>${dto.prod_key}</td>
				<td>${dto.cat_key}</td>
				<td>
					<a href="prod_content_view?prod_key=${dto.prod_key}">${dto.prod_name}</a>
				</td>
				<td>${dto.prod_content}</td>
				<td>${dto.prod_price}</td>
				<td>${dto.prod_rdate}</td>
				<td>${dto.prod_cnt}</td>
				<td>${dto.prod_size}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="9" style="text-align: right;">
				<a href="prod_list" class="btn" style="padding: 8px 16px;">목록 보기</a>
			</td>
		</tr>
	</table>
	<a href="prod_itemWrite" class="btn" style="padding: 8px 16px;">상품등록하기</a>
</div>

</body>
</html>









