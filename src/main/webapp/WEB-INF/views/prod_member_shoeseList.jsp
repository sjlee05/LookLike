<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.div_page ul{
		display: flex;
		list-style: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	var actionForm = $("#actionForm");
	
	//	페이지 번호처리
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".search_area button").on("click", function(e){
//         e.preventDefault();
        let keyword = $("input[name='keyword']").val();
        alert("keyword ::"+keyword)
        
//         if(!keyword){
//             alert("키워드를 입력하세요.");
//             return false;
//         }       
        actionForm.find("input[name='keyword']").val(keyword);
        actionForm.find("input[name='pageNum']").val(1);
        actionForm.submit();
    });
 
});
</script>
</head>
<body>
<!-- 	카테고리 부분 -->
<jsp:include page="/WEB-INF/views/include/nav-main.jsp" >
	<jsp:param name="cust_id" value="${cust_id}"/>
</jsp:include>

<!-- <div align="right"> -->
<!-- 	 <form action="prod_member_shoeseList_search"> -->
<!-- 			<input type="text" name="keyword" placeholder="상품명"> -->
<!-- 			<input type="submit" value="검색"> -->
<!-- 	</form>	 -->
<!-- </div> -->
	
<div align="center">
	<table border="1">
		<tr>
		<c:forEach items="${prod_member_shoeseList}" var="dto" varStatus="status">
			<td align="center">
				<a href="prod_member_content_view?prod_key=${dto.prod_key}">
				<img src="${dto.prod_imgPath}">
				</a>
			<br>
				${dto.prod_name}
			<br>
				☆☆☆☆☆
			<br>
				${dto.prod_price}
			</td>
			<c:if test="${status.count%3 == 0}">
				</tr><tr>
			</c:if>
		</c:forEach>
		</tr>
	</table>

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
	
 	<form page="get" id="actionForm" action="prod_member_shoeseList">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
	
	<button onclick="location.href='prod_member_list'">목록</button>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>