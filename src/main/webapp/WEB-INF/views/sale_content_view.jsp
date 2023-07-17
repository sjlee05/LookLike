<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
BODY{
	background-color: #FFFAFA;
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
    }

    .tab {
        border-collapse: collapse;
        width: 730px;
        border-top: none;
        border-right: none;
        border-left: none;
        color: #BC8F8F;
        font-size: 1.2em;
        margin: 80px auto;
    }

    .tab td {
        border-top: none;
        border-right: none;
        border-bottom: none;
        border-left: none;
        height: 50px;
    }

    .tab tr {
        border-top: 2px solid #a9a9a9;
    }

    .tab tr:first-child {
        border-top: none;
    }
    .tab a {
        text-decoration: none;
        color: blue;
        font-weight: bolder;
    }

    #btn {
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

    #btn:hover {
        background-color: #DEB887;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link href="resources/css/stylelogin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/notice.css"> 
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="resources/css/nav.css">
<script src="resources/js/nav.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
var cust_id;
var ad_id;
$(function(){
	$(".footer").hover(function(){
		$(this).stop().animate({"bottom":0});
	},function(){
		$(this).stop().animate({"bottom":"-180px"});
	});
	
	cust_id = "${cust_id}";
	console.log("cust_id:"+cust_id);
	ad_id = "${ad_id}";
	var login_word = "Log In";
	$(".modal-btn").hide();
	
	if(cust_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(cust_id);
        $(".login-btn").css({"background-color":"gray"});
     }else if(ad_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(ad_id);
        $(".login-btn").css({"background-color":"gray"});
        $(".login-btn").parent().attr("href", "admin_managerpage");
        $(".login-btn").attr("onclick", "location.href='admin_loginmanager'");
     }else{
    	$(".modal-btn").hide();
        $(".login-btn").text(login_word);
        $(".login-btn").css({"background-color":"lightblue"});
     }
	
});
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
<script>

	$(function() {
	    $(".tr1").first().css({ display: "inline" });
	    $(".tr2").first().css({ display: "inline" });
	    $(".tr3").first().css({ display: "inline" });
	    $(".tr4").first().css({ display: "inline" });
	    $(".tr5").first().css({ display: "inline" });
	    $(".tr6").first().css({ display: "inline" });
	    $(".info").first().css({ display: "inline" });

	    $(".all").on("click", function() {
	    	$("#for_frm").submit();
	    });

	    function submitForms(index) {
	        var formId = "#for_frm_" + index;

	        $.ajax({
	            url: $(formId).attr("action"),
	            type: $(formId).attr("method"),
	            data: $(formId).serialize(),
	            success: function() {
	                if (index > 0) {
	                    submitForms(index - 1);
	                } else {
	                    alert("수정되었습니다");
	                }
	            }
	        });
	    }
	    
	    $("#btn_submit").on("click", function(){
	    });
	});
</script>
</head>
<body>
<div class="nav-menu" style="opacity: 0.7;">
<%@ include file="/WEB-INF/views/include/nav-main.jsp" %>
</div>
<a class="login-a" href="cust_login"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
<div class="table-wrapper" align="center">
	<table border="1" class="tab">
<!-- 		<form method="post" action="modify"> -->
			<c:forEach var="content_view" items="${content_view}" varStatus="status" >
			<c:if test="${status.first}">
				<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<tr>
				<td>
				<h2 style="color: black;font-weight: bolder;">판매현황</h2>
				</td>
				<td>
				<h4>주문 날짜 : ${content_view.ord_date}</h4>	
				</td>
				<td width="100px;">
				<h4>주문 번호 :</h4>
				</td> 
				<td>
				<h4>${content_view.ord_key}</h4>
				</td>
			</tr>

			<form id="for_frm" action="sale_modify">
			<tr>
				<input type="hidden" name="ord_key" value="${content_view.ord_key}">
				<input type="hidden" name="ord_item" value="${content_view.ord_item}">
				<td>구매자</td>
				<td><input type="text" name="ord_name" value="${content_view.ord_name}"></td>
				<td>회원번호</td>
				<td>${content_view.cust_id}</td>
			</tr>

			<tr>
				<td>휴대전화</td>
				<td><input type="text" name="ord_phone" value="${content_view.ord_phone}"></td>
				<td>일반전화</td>
				<td><input type="text" name="ord_tel" value="${content_view.ord_tel}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="ord_addr" value="${content_view.ord_addr}"></td>
				<td>상세주소</td>
				<td><input type="text" name="ord_addrdetail" value="${content_view.ord_addrdetail}"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="ord_zipcode" value="${content_view.ord_zipcode}"></td>
				<td>송장번호</td>
				<td><input type="text" name="ord_tnumber" value="${content_view.ord_tnumber}"></td>
			</tr>
			<tr>
				<td >배송요청사항</td>
				<td ><input type="text" name="ord_request" value="${content_view.ord_request}"></td>
			</tr>
		</form>
			</c:if>
			<tr>
				<td>상품명</td>
<%-- 				<td><input type="text" name="ord_item" value="${content_view.ord_item}"></td> --%>
				<td>${content_view.ord_item}</td>
				
				<td>수량</td>
				<td>${content_view.ord_count}</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${content_view.ord_price}</td>
				
				<td>번호</td>
				<td><%= request.getParameter("ord_key") %></td>
			</tr>
			<c:if test="${status.last}">
			<tr>
<!-- 					<input type="hidden" id="selected_ord_status" name="ord_status" value="$('#selected_ord_status option:eq(0)').prop('selected', true)" > -->
				<td colspan="4">	
					<input type="submit" class="all" id="btn btn_submit" style="padding: 8px 16px;" value="수정">
					<input type="submit" value="목록보기" formaction="sale_list" id="btn"  style="padding: 8px 16px;">
					<input type="submit" value="삭제" formaction="sale_delete" id="btn"  style="padding: 8px 16px;">
				</td>
			</tr>
			</c:if>
			</c:forEach>
	</table>
</div>
<div class="footer">
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>	
</body>
</html>