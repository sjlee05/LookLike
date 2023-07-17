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
	.myimage{
	      width:300px; 
	      height:300px;
	    }
    body{
/*        background-color: #FFFFF0;  */
		 background-color:#FFFAFA; 
        font-size: 20px; 
        font-family: 'Times New Roman', Times, serif;
   }
   .tab {
	border-collapse: collapse;
	width: 1300px;
/* 	height: 1000px; */
	border-top:none;
	border-right: none;
 	border-bottom: none; 
	border-left: none;
	font-size: 1.1em;
		color: #BC8F8F;
/* 	background-color: #FFFFF0;  */
	background-color:#FFFAFA;
	}
	.tab td{
	border-top:none;
	border-right: none;
	border-bottom: none;
	border-left: none;
	height: 80px;
	padding: 20px; /* 간격을 위한 padding 추가 */
	
	}
	.tab tr{
	border-top: 1px solid silver;
	}
	.tab tr:first-child {
	border-top: none;
	}
	.tab
	a{
	text-decoration: none;
	color: #DEB887;
	}
</style>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav-main.jsp" >
	<jsp:param name="cust_id" value="${cust_id}"/>
</jsp:include>
<br>
<br>
<br>
<div align="center">
	<table border="1" class="tab">
		<tr>
			<c:forEach items="${search}" var="dto" varStatus="status">
				<td align="center">
					<a href="prod_member_content_view?prod_key=${dto.prod_key}">
						<img src="${dto.prod_imgPath}" class="myimage">
					</a>
				<br>
				<span style="color:black; font-weight: bolder;">${dto.prod_name}</span>
				<br>
					☆☆☆☆☆
				<br>
					${dto.prod_price}원
				</td>
				<c:if test="${status.count%3 == 0}">
				</tr><tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>










