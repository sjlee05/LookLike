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
</style>
</head>
<body>
<div align="center">
	<table border="1">
		<tr>
			<c:forEach items="${search}" var="dto" varStatus="status">
				<td>
					<a href="prod_member_content_view?prod_key=${dto.prod_key}">
						<img src="${dto.prod_thumbnailPath}">
					</a>
					<br>
						${dto.prod_name}
					<br>
						${dto.prod_price}
				</td>
			<c:if test="${status.count%3 == 0}">
				</tr><tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>
		<button>
			<a href="prod_member_BottomsList">하의 상품목록</a>
		</button>
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
// 		console.log("click~!!!");
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
// 	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
// 		console.log("무브 클릭~!!!ㅎㅎ");
// 		console.log("@# href ===>"+$(this).attr("href"));
// "content_view?bid=${dto.bid}"에 있는 ?bid= 의 bid와 name 을 매칭
		actionForm.append("<input type='hidden' name='bid' value='"+targetBno+"'>")
// 		actionForm.attr("action","content_view");//오류
// 		submit 하면 클릭하면 해당 클릭대상자의 내용으로 간다.
// 컨트롤러에 content_view로 찾아감
		actionForm.attr("action","prod_member_content_view").submit();
	});
</script>









