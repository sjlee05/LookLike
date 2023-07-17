<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">
<style>
.prod_info{
	margin: auto;
	margin-top: 200px;
	width: 1000px;
	height: 700px;
}
.prod_img{
	box-sizing: border-box;
	float: left;
	width: 495px;
	height: 700px;
	display: block;
}
.prod_img img{
	padding: 10px;
	width: 495px;
	height: 590px;
}
.prod_div{
	box-sizing: border-box;
	float: right;
	width: 495px;
	height: 300px;
	padding: 35px 20px;
	display: block;
}
.prod_table{
	margin: auto;
	width: 100%;
	height: 100%;
}
.prod_order{
	box-sizing: border-box;
	float: right;
	width: 495px;
	height: 550px;
	padding: 20px;
	display: block;
}
.order_table{
	width: 100%;
	height: 100%;
}
.order_table tr td{
	border-bottom: 1px solid lightgray;
}
.order_table tr:last-child td{
	border-bottom: none;
}
.content{
	width: 1000px;
	height: 500px;
}
.select_content{
	width: 100%;
	height: 30px;
	text-align: center;
}
.select_content a{
	display: inline-block;
	padding: 0 20px;
}
.detail_content{
	width: 100%;
	height: 450px;
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
.div_page ul {
	display: flex;
	list-style: none;
	padding: 0;
	margin: 0;
}
.div_page ul li {
	margin-right: 10px;
}
.div_page ul li:last-child {
	margin-right: 0;
}
.div_page ul li a {
	text-decoration: none;
	color: #000;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
.div_page ul li a:hover {
	background-color: #f1f1f1;
}
.div_page ul li.active a {
	background-color: #ddd;
}
.div_page ul li.disabled a {
	pointer-events: none;
	color: #999;
}
.div_page ul li span {
	padding: 5px;
}
.search_wrap {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}
.search_area {
	display: flex;
	align-items: center;
}
.search_area select,
.search_area input[type="text"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.search_area select {
	margin-right: 10px;
}
.search_area button {
	padding: 8px 12px;
	background-color: #778899;
	width: 110px;
	height: 38px;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
}
.search_area button:hover {
	background-color: #696969;
}
#actionForm {
	display: none;
}
h2{
	font-family: 'Times New Roman', Times, serif;

}
hr{
	width: 70%;
	height:3px;
	background-color: silver;
}
.qna {
	display: flex;
	flex-direction: column; 
	align-items: center;  
	margin-bottom: 300px;
}
.footer{
	width: 100%;
	position: fixed;
	left: 0;
	bottom: -180px;
	z-index: 99;
}
.table-wrapper {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}
.tab {
	border-collapse: collapse;
	width: 950px;
	border-top:none;
	border-right: none;
	border-bottom: none;
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	font-family: 'Times New Roman', Times, serif;
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
.tab a{
	text-decoration: none;
	color: #DEB887;
}
body{
	text-align: center;
	font-family: 'Times New Roman', Times, serif;
	background-color: #FFFAFA; 
	color: #BC8F8F;
}
.ccc{
	border-collapse: collapse;
	border-top:none;
	border-right: none;
	border-bottom: none;
	border-left: none;
}
.ccc td{
	margin-top: 20px;
	margin-bottom: 20px;
}
.ccc img{
	width: 600px;
	height: 700px; 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(function(){
// 	상품목록에서 넘어온 가격
	var price = ${prod_member_content_view.prod_price};
	
    amount = $("input[name=amount]");
    $("input[name=cart_count]").val($("input[name=amount]").val());
    $("input[name=add]").on("click",function(){
       if(parseInt(amount.val())<99){
          amount.val(parseInt(amount.val())+1);
          $("input[name=prod_price]").val(amount.val()*price);
    	  $("input[name=cart_count]").val($("input[name=amount]").val());
       }
    });
    $("input[name=minus]").on("click",function(){
       if(parseInt(amount.val())>1){
          amount.val(parseInt(amount.val())-1);
          $("input[name=prod_price]").val(amount.val()*price);
    	  $("input[name=cart_count]").val($("input[name=amount]").val());
       }
    });
    amount.blur(function(){   // 포커스 벗어날 때
       $("input[name=prod_price]").val(amount.val()*price);
    });
    amount.change(function(){   // 값이 바뀔 때 (Enter 등)
       $("input[name=prod_price]").val(amount.val()*price);
    });
    $("#cust_cart_btn").on("click", function(event) {
        if (!"${cust_id}" && !"${ad_id}") {
            if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
                location.href = "cust_login";
            } else {
                event.preventDefault();
            }
        } else {
            $("#prod_frm").attr("action", "cust_addCart").submit();
        }
    });

    $("#cust_wish_btn").on("click", function(event) {
        if (!"${cust_id}" && !"${ad_id}") {
            if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
                location.href = "cust_login";
            } else {
                event.preventDefault();
            }
        } else {
            $("#prod_frm").attr("action", "cust_addWish").submit();
        }
    });

    $("#cust_buy_btn").on("click", function(event) {
        if (!"${cust_id}" && !"${ad_id}") {
            if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
                location.href = "cust_login";
            } else {
                event.preventDefault();
            }
        } else {
            var ord_count = $("input[name=cart_count]").val();
            $("#prod_frm").attr("action", "cust_buyPay").submit();
        }
    });
 });
 
var cust_id;
var ad_id;

$(function(){
	$(".nav").load("/nav.html");
	$(".footer").load("/footer.html");
	
	
	
	cust_id = "${cust_id}";
	console.log("cust_id:"+cust_id);
	ad_id = "${ad_id}";
	var login_word = "Log In";
	$(".modal-btn").hide();
	
	if(cust_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(cust_id);
        $(".login-btn").css({"background-color":"#BC8F8F"});
     }else if(ad_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(ad_id);
        $(".login-btn").css({"background-color":"#BC8F8F"});
        $(".login-btn").parent().attr("href", "admin_managerpage");
        $(".login-btn").attr("onclick", "location.href='admin_loginmanager'");
     }else{
    	$(".modal-btn").hide();
        $(".login-btn").text(login_word);
        $(".login-btn").css({"background-color":"lightblue"});
     }
});
</script>
</head>
<body>
<div class="nav-menu" style="opacity: 0.7;">
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
</div>
<a class="login-a" href="#"><button class="login-btn">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log out</button></a>
<!------------------------------------- nav 끝 ---------------------------------->
	<div class="prod_info">
      <div class="prod_img">
	<form method="post" id="prod_frm">
      <input type="hidden" name="cust_id" value="${cust_id}">
      <input type="hidden" name="prod_key" value="${prod_member_content_view.prod_key}">
      <input type="hidden" name="cart_count" value="">
<c:set var="loop_flag" value="false"/>
<c:forEach var="imgs" items="${imgs}" varStatus="status">
                    <c:if test="${not loop_flag}">
                    <img alt="이미지" src="${imgs}">
                    <input type="hidden" name="prod_imgpath" value="${imgs}">
                    <c:set var="loop_flag" value="true"/>
                    </c:if>
                </c:forEach>
   </div>
   
<div align="center">
   <h1>${prod_member_content_view.prod_name}</h1>
   <input type="hidden" name="prod_name" value="${prod_member_content_view.prod_name}"> 
   <input type="hidden" name="keyword" value="${cri.keyword}"> 
   
            <div class="prod_order">
            <table class="order_table">
               <tr>
                  <td style="font-size: 25px; width: 175px;">SIZE</td>
                  <td style="font-size: 25px;">
                     <select name="prod_size"> 
                         <option value="M">M[80-90]</option> 
                         <option value="L">L[90-100]</option> 
                         <option value="XL">XL[100-110]</option> 
                      </select>
                  </td>
               </tr>
               <tr>
                  <td style="font-size: 20px;">적용되는<br>이벤트</td>
                  <td style="font-size: 25px;">없음</td>
               </tr>
               <tr>
                  <td style="font-size: 20px;">수량</td>
                  <td>
                     <input type="hidden" name="prod_quantity" value="${prod_member_content_view.prod_price}">
                     <input type="text" name="amount" value="1" size="2" max="">
                     <input type="button" value=" + " name="add" class="btn" style="padding: 5px 13px;">
                     <input type="button" value=" - " name="minus" class="btn" style="padding: 5px 13px;">
                     <br>
                  </td>
               </tr>
               <tr>
                  <td style="font-size: 20px;">가 격</td>
                  <td>
                     <input type="text" name="prod_price" size="11" readonly value="${prod_member_content_view.prod_price}">원
                  </td>
<!--                   <td style="font-size: 25px;">PRICE</td> -->
<!--                   <td style="font-size: 25px;">$ 10,000</td> -->
               </tr>
               <tr>
                  <td width="100">상품설명</td>
                  <td>
                     ${prod_member_content_view.prod_content}
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="text-align: center; vertical-align: bottom;">
                     <a href="prod_member_list" class="btn" style="padding: 5px 13px;">상품목록</a>
                     <a href="#" id="cust_buy_btn" class="btn" style="padding: 5px 13px;">구매</a>
                     <a href="#" id="cust_cart_btn" class="btn" style="padding: 5px 13px;">장바구니</a>
                     <a href="#" id="cust_wish_btn" class="btn" style="padding: 5px 13px;">관심내역</a>
                  </td>
               </tr>
            </table>
         </div>
</form>

<!--    <form action="#" id="cust_add_frm"> -->
<%--       <input type="hidden" name="cust_id" value="${cust_id}"> --%>
<%--       <input type="hidden" name="prod_key" value="${prod_member_content_view.prod_key}"> --%>
<!--       <input type="hidden" name="cart_count" value=""> -->
<!--    </form> -->

</div>
</div>
    <div align="center">
   <table border="1" class="ccc">
                        <c:set var="loop_flag" value="false"/>
               <c:forEach var="imgs" items="${imgs}" varStatus="status">
      <tr>
         <td>
                      <img alt="이미지" src="${imgs}" class="myimage">
         </td>
                      <c:set var="loop_flag" value="true"/>
      </tr>
               </c:forEach>
   </table>
   </div>
<!-- QnA 목록 -->
<div class="qna">
	<div class="notice_main">
		
		<h2 style="color:#BC8F8F;font-size: 3em;">QnA</h2>
	</div><hr><br><br>
<div class="table-wrapper">
	<table border="1" class="tab">
		<tr height="50px">
			<td width="5%"  style="text-align: center;">번호</td>
			<td width="14%"  style="text-align: center;">작성자</td>
			<td width="60%">제목</td>
			<td width="15%" style="text-align: center;">날짜</td>
			<td width="6%" style="text-align: center;">조회수</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr height="30px" onmouseout="this.style.backgroundColor='#FFFAFA'"
					onmouseover="this.style.backgroundColor='#eeeeef'">
				<td style="text-align: center;">${dto.qna_key}</td>
				<td style="text-align: center;">
					<c:choose>
						<c:when test="${dto.cust_id != null}">
							${dto.cust_id}
						</c:when>
						<c:when test="${dto.ad_id != null}">
							${dto.ad_id}
						</c:when>
						<c:otherwise>
							Unknown
						</c:otherwise>
					</c:choose>
				</td>
				<td>
		            <c:if test="${dto.qna_level > 0}">
		                <c:forEach begin="1" end="${dto.qna_level}">
		                    &nbsp;&nbsp;&nbsp;&nbsp;
		                </c:forEach>
		                [답변]
		            </c:if>
					<a class="move_link" href="${dto.qna_key}">${dto.qna_title}</a>
				</td>
				<td style="text-align: center;">${dto.qna_date}</td>
				<td style="text-align: center;">${dto.qna_hit}</td>
			</tr>
		</c:forEach>
		<tr height="50px">
			<td colspan="5">
			<input type="button"  value="글작성"  class="btn" onclick="location.href='qna_write_view?prod_name=${prod_member_content_view.prod_name}&prod_key=${prod_member_content_view.prod_key}'" style="padding: 8px 16px;margin-right:900px;">
			</td>
		</tr>
	</table>
</div>
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
<!-- 					시작페이지 -1 하면 이전의 10개 페이지 표시 -->
<!-- 					ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						이전
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<%-- 				<li>${num}</li> --%>
<%-- 				<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""}> --%>
<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
				<li class="paginate_button">
<!-- 					클릭한 현재페이지 번호를 링크로 연결 -->
					<a href="${num}">
						${num}
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}">
						다음
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="search_wrap">
        <div class="search_area">
        <select name="type">
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
            </select>    
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>Search</button>
        </div>
    </div>    

	<form page="get" id="actionForm" action="qna_list">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script>
var actionForm = $("#actionForm");

//페이지 번호처리
$(".paginate_button a").on("click",function(e){
e.preventDefault();
console.log("@# href ===>"+$(this).attr("href"));
actionForm.find("input[name='pageNum']").val($(this).attr("href"));
actionForm.submit();
});

//게시글 처리
$(".move_link").on("click",function(e){
e.preventDefault();
var targetBno = $(this).attr("href");

actionForm.append("<input type='hidden' name='qna_key' value='"+targetBno+"'>")
actionForm.append("<input type='hidden' name='prod_key' value='${prod_member_content_view.prod_key}'>")
actionForm.attr("action","qna_content_view").submit();
});

$(".search_area button").on("click", function(e){
e.preventDefault();
let type = $(".search_area select[name='type']").val();
let keyword = $(".search_area input[name='keyword']").val();

if(!type){
    alert("검색 종류를 선택하세요.");
    return false;
}

if(!keyword){
    alert("키워드를 입력하세요.");
    return false;
}       
actionForm.find("input[name='type']").val(type);
actionForm.find("input[name='keyword']").val(keyword);
// actionForm.find("input[name='pageNum']").val(1);
actionForm.submit();
});
</script>