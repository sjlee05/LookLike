<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   background-image: url("${pageContext.request.contextPath}/resources/images/Model1.jpg"); 
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
   .div_page ul{
      display: flex;
      list-style: none;
   }
   .div_page {
      display: flex;
      justify-content: center;
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
<!-- 검색기능 추가 -->
<div align="right">
	<form action="prod_search">
		<input type="text" name="keyword" placeholder="상품명">
		<input type="submit" value="검색">
	</form>
</div>	
	<table border="1" class="tab">
		<tr>
			<td>썸네일</td>
			<td>상품고유번호</td>
			<td>카테고리고유번호</td>
			<td>상품명</td>
			<td>상품설명</td>
			<td>상품가격</td>
			<td>등록일</td>
			<td>재고</td>
			<td>사이즈</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
		   		<td>
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
					<button onclick="location.href='prod_itemWrite'" class="btn" style="padding: 8px 16px;">상품등록하기</button>
					<button onclick="location.href='admin_managerpage'" class="btn" style="padding: 8px 16px;">관리자목록</button>
					<button onclick="location.href='prod_member_list'" class="btn" style="padding: 8px 16px;">회원 상품목록 보기</button>
			</td>
		</tr>
	</table>
<!-- 	페이징 처리하는 부분 -->
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
<!-- 					시작페이지 -1 하면 이전의 10개 페이지 표시 -->
<!-- 					ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						[Previous]
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""}>
<!-- 					클릭한 현재페이지 번호를 링크로 연결 -->
					<a href="${num}">
						[${num}]
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}">
						[next]
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form page="get" id="actionForm" action="prod_list">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
</div>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
	
// 	페이지 번호처리
	$(".paginate_button a").on("click",function(e){
// 		기본 동작 막음:페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
// 	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
		
		var bno = actionForm.find("input[name='bid']").val();
		if (bno != ''){
			actionForm.find("input[name='bid']").remove();
		}
		
// "content_view?bid=${dto.bid}"에 있는 ?bid= 의 bid와 name 을 매칭
		actionForm.append("<input type='hidden' name='bid' value='"+targetBno+"'>")
// 		submit 하면 클릭하면 해당 클릭대상자의 내용으로 간다.
// 		컨트롤러에 prod_content_view로 찾아감
		actionForm.attr("action","prod_content_view").submit();
	});
</script>









