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
   .myimage{
      width:300px; 
      height:350px;
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
$(document).ready(function () {
   var actionForm = $("#actionForm");
   
   //   페이지 번호처리
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
   
   $(".tab td").each(function () {
       var rating = parseInt($(this).find(".prod_rating").text());
       var stars = "";

       for (var i = 1; i <= 5; i++) {
           if (i <= rating) {
               stars += "★";
           } else {
               stars += "☆";
           }
       }

       $(this).find(".texthere").text(stars);
   });
 
});
</script>
</head>
<body>
<!--    카테고리 부분 -->
<div style="opacity: 0.7;">
	<jsp:include page="/WEB-INF/views/include/nav-main.jsp" >
	   <jsp:param name="cust_id" value="${cust_id}"/>
	</jsp:include>
</div>  
<div align="center" style="margin-top: 100px;">
		<c:if test="${cat_key == 1}">
		      <h1 style="color: #BC8F8F;">Top</h1>
		   </c:if>
		<c:if test="${cat_key == 11}">
		      <h1 style="color: #BC8F8F;">티셔츠</h1>
		   </c:if>
		<c:if test="${cat_key == 12}">
		      <h1 style="color: #BC8F8F;">맨투맨</h1>
		   </c:if>
		<c:if test="${cat_key == 13}">
		      <h1 style="color: #BC8F8F;">후드</h1>
		   </c:if>
		<c:if test="${cat_key == 2}">
		      <h1 style="color: #BC8F8F;">Bottom</h1>
		   </c:if>
		<c:if test="${cat_key == 21}">
		      <h1 style="color: #BC8F8F;">슬랙스</h1>
		   </c:if>
		<c:if test="${cat_key == 22}">
		      <h1 style="color: #BC8F8F;">청바지</h1>
		   </c:if>
		<c:if test="${cat_key == 23}">
		      <h1 style="color: #BC8F8F;">반바지</h1>
		   </c:if>
		<c:if test="${cat_key == 3}">
		      <h1 style="color: #BC8F8F;">Outer</h1>
		   </c:if>
		<c:if test="${cat_key == 31}">
		      <h1 style="color: #BC8F8F;">가디건</h1>
		   </c:if>
		<c:if test="${cat_key == 32}">
		      <h1 style="color: #BC8F8F;">자켓</h1>
		   </c:if>
   <table border="1" class="tab">
      <tr>
      <c:forEach items="${prod_member_TopList}" var="dto" varStatus="status">
         <td align="center">
            <a href="prod_member_content_view?prod_key=${dto.prod_key}">
               <img src="${dto.prod_imgPath}" class="myimage">
            </a>
         <br>
            <span style="color:black; font-weight: bolder;">${dto.prod_name}</span>
         <br>
         	<div class="texthere"></div>
         <br>
            ${dto.prod_price}원
            <span class="prod_rating" style="display: none;">${dto.prod_rating}</span>
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
<!--                시작페이지 -1 하면 이전의 10개 페이지 표시 -->
<!--                ex>11->10(1~10), 21->20(11~20) -->
               <a href="${pageMaker.startPage - 1}">
                  [Previous]
               </a>
            </li>
         </c:if>
         <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<!--             현재 페이지는 배경색 노란색으로 표시 -->
            <li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""}>
<!--                클릭한 현재페이지 번호를 링크로 연결 -->
               <a href="${num}">
                  [${num}]
               </a>
            </li>
         </c:forEach>
         <c:if test="${pageMaker.next}">
            <li class="paginate_button">
<!--                끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!--             ex>10->11(11~20), 20->21(21~30) -->
               <a href="${pageMaker.endPage + 1}">
                  [next]
               </a>
            </li>
         </c:if>
      </ul>
   </div>
   
    <form page="get" id="actionForm" action="prod_member_TopList">
      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
   </form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>