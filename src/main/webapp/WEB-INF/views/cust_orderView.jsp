<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/login_btn.css">
<link rel="stylesheet" href="resources/css/stylemain.css">
<style>
	body{
		background-color: #FFFAFA;
		font-family: 'Times New Roman', Times, serif;
	}
	::-webkit-scrollbar{
		display: none;
	}
	.list_name{
		margin-top: 200px;
	}
	.list_main{
		margin: 50px auto;
 		height: 1000px;
		padding: 20px 0;
		overflow: auto;
	}
	.order_list{
		width: 90%;
 		height: 200px;
		border: 1px solid black;
		margin: 10px auto;
	}
	.notice_main{
	    margin-top: 10%;
	    text-align: center;
	    font-size: 2em;
	}
	h4{
		font-family: 'Times New Roman', Times, serif;
		font-size: 1.5em;
	}
	hr{
		width: 70%;
		height:3px;
		background-color: silver;
	}
	.notice {
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
		width: 1100px;
		border-top:none;
		border-right: none;
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
	td button {
	    padding: 8px 12px;
	    background-color: #778899;
	    width:101px;
	    height:38px;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    margin-left: 10px;
	    font-size: 100%;
	}

	td button:hover {
	    background-color: #696969;
	}
</style>
<script>
var cust_id;
$(function(){
	   cust_id = "${cust_id}";
	   console.log(cust_id);
	   var login_word = "lalalala";
	   $(".modal-btn").hide();
	   
	      if(cust_id.length>0){
	         $(".modal-btn").show();
	         $(".login-btn").text(cust_id);
	         $(".login-btn").css({"background-color":"gray"});
	      }else{
	         $(".login-btn").text(login_word);
	         $(".login-btn").css({"background-color":"lightblue"});
	      }
		
		var idx = 0;
		for(var n=1; n<=10; n++){
			var selector = "#payCancel_frm_"+n;
			if($(selector).length){
				idx= n;
			}
			console.log("idx : "+idx+", n : "+n)
		}
		for(let i=1; i<=idx; i++){
			let payCancel_btnbtn = "#payCancel_btnbtn_"+i;
			$(payCancel_btnbtn).on("click",function(){
// 				alert("btnbtn : "+payCancel_btnbtn);
			});
		}
		
		for(let i=1; i<=idx; i++){
			let payCancel_btn = "#payCancel_btn_"+i;
			let payCancel_frm = "#payCancel_frm_"+i;
			let ord_status = "#status_"+i;
			let ord_item = $("#ord_item_"+i).val();
			let ord_count = $("#ord_count_"+i).val();
			let ord_merchant = $("#ord_merchant_"+i).val();
			console.log("ord status.val() : "+$(ord_status).val());
			if($(ord_status).val()=='환불완료'||$(ord_status).val()=='환불요청중'){
				$(payCancel_btn).hide();
			}
			$(payCancel_btn).on("click",function(){
				$(payCancel_frm).attr("action","cust_payCancel");

				if($(ord_status).val()=='주문 완료'){
					$.ajax({
						url:"countBack",
						data:{ord_merchant:ord_merchant},
						success:function(){
							alert("환불 처리가 완료되었습니다");
							$(payCancel_frm).submit();
						},
						error: function(jqXHR, textStatus, errorThrown) {
							alert("오류가 발생했습니다");
						    console.log("AJAX 오류 발생");
						    console.log("상태 코드: " + jqXHR.status);
						    console.log("에러 종류: " + textStatus);
						    console.log("에러 내용: " + errorThrown);
						}
					});
				}else if($(ord_status).val()=='환불요청중'){
					$.ajax({
						url:"countBack",
						data:{ord_merchant:ord_merchant},
						success:function(){
							alert("환불 처리가 완료되었습니다");
							$(payCancel_frm).submit();
						},
						error: function(jqXHR, textStatus, errorThrown) {
							alert("오류가 발생했습니다");
						    console.log("AJAX 오류 발생");
						    console.log("상태 코드: " + jqXHR.status);
						    console.log("에러 종류: " + textStatus);
						    console.log("에러 내용: " + errorThrown);
						}
					});
				}else{
					$(payCancel_frm).attr("action","cust_payCancelStatus").submit();
					alert("환불 요청이 완료되었습니다");
					console.log("payCancelfrm-action : payCancelStatus");
				}
			});
		}
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<div class="notice_main">
		<h4 style="color:#BC8F8F;">Order</h4>
	</div><hr><br><br>
	<a class="login-a" href="#"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
	<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
	<div class="table-wrapper">
		<table border="1" class="tab">
			<tr height="50px" bgcolor="#FFFAFA">
				<td width="5%" style="text-align: center;">주문번호</td>
				<td width="12%" style="text-align: center;">상품</td>
				<td width="33%">받는 분</td>
				<td width="18%">총 결제금액</td>
				<td width="13%" style="text-align: center;">주문 날짜</td>
				<td width="10%" style="text-align: center;">주문 상태</td>
				<td width="9%" style="text-align: center;">환불 신청</td>
			</tr>
		</table>
	</div>
	<div class="list_main">
	<c:forEach items="${orderList}" var="order" varStatus="status">
        <c:if test="${status.index == 0 || order.ord_key != orderList[status.index - 1].ord_key}">
		<form method="post" action="cust_payCancel" id="payCancel_frm_${status.count}">
		<div class="table-wrapper">
		<table border="1" class="tab">
			<tr height="50px" bgcolor="#FFFAFA">
				<td width="5%" style="text-align: center;">
					<a href="cust_orderContent?ord_merchant=${order.ord_merchant}">
						${order.ord_key}
					</a>
				</td>
				<td width="12%" style="text-align: center;">${order.ord_item}</td>
				<td width="33%">
					받는 분 성함 = ${order.ord_name}<br>
					받는 분 연락처 = ${order.ord_phone}<br>
					받는 분 주소 = ${order.ord_addr}
				</td>
				<td width="18%">
					<p style="font-size: 35px; margin: 0px auto;">
						${order.ord_totalprice}
					</p>
				</td>
				<td width="13%" style="text-align: center;">${order.ord_date}</td>
				<td width="10%" style="text-align: center;">${order.ord_status}</td>
				<td width="9%" style="text-align: center;">
					<input type="hidden" id="status_${status.count}" value="${order.ord_status}">
					<input type="hidden" name="ord_merchant" id="ord_merchant_${status.count}" value="${order.ord_merchant}">
					<button type="button" id="payCancel_btn_${status.count}">환불신청</button>
				</td>
			</tr>
		</table>
	</div>
	</form>
	 </c:if>
	</c:forEach>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>