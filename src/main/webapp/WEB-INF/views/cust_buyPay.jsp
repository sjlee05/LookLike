<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
 		background-color: #FFFAFA;
 		font-family: 'Times New Roman', Times, serif;
	}
	.list_name{
		margin-top: 100px;
	}
	.userTable{
/* 		border: 1px solid black; */
		width: 90%;
		margin: auto;
		font-size: 20px;
	}
	.userTable td{
		height: 200px;
	}
	.userTable:nth-child(1) td{
		height: 50px;
	}
	.list_main{
/* 		background-color: #fffff0; */
		margin: 0 auto;
		width: 1000px;
/* 		height: 1000px; */
		padding: 20px 0;
		/* display: flex-start; */
	}
	.pp{
		text-align: center;
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
	button {
	    padding: 8px 12px;
	    background-color: #778899;
	    width:220px;
	    height:76px;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    margin-left: 10px;
	    font-size: 200%;
	}
	button:hover {
	    background-color: #696969;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="resources/css/button.css">
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	$(function(){
		
		var addr = $("input[name=addr]").val();
		$("input[name=cust_addr]").val(addr);
		$("#addr_checkbox").change(function(){
			if($("#addr_checkbox").is(":checked")){
				$("input[name=show_cust_addr]").val($("input[name=cust_addr]").val());
				$("input[name=show_cust_addr]").attr("disabled", true);
				$("input[name=addr]").attr("disabled", true);
			}else{
				$("input[name=show_cust_addr]").val("");
				$("input[name=show_cust_addr]").attr("disabled", false);
				$("input[name=addr]").attr("disabled", false);
			}
		});
		$("input[name=addr]").change(function(){
			var addr_var = $("input[name=addr]").val()
			$("input[name=cust_addr]").val(addr_var);
		});
		$("input[name=phone]").change(function(){
			var phone_var = $("input[name=phone]").val()
			$("input[name=cust_phone]").val(phone_var);
		});
		
		$(".pp").hide();
		$(".pp").last().show();
		
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<div class="notice_main">
		<h4 style="color:#BC8F8F;">Pay</h4>
	</div><hr><br><br>
	<div class="list_main">
<!-- 	<form action=""> -->
		<table class="userTable">
			<tr>
				<td>
					주문자명 :
				</td>
				<td>
					${customer.cust_name}
<%-- 					<input type="hidden" value="${customer.cust_name}"> --%>
				</td>
			</tr>
			<tr>
				<td>
					이메일 :
				</td>
				<td>
					${customer.cust_email}
					<input type="hidden" value="${customer.cust_email}">
				</td>
			</tr>
			<tr>
				<td>
					연락처 : 
				</td>
				<td>
					<input type="text" name="phone" value="${customer.cust_phone}">
					<input type="checkbox" id="tel_update_cb"> 기본 연락처로 저장
				</td>
			</tr>
			<tr>
				<td>
					주소 : 
				</td>
				<td>
					<input type="text" name="addr" value="${customer.cust_addr}">
					<input type="checkbox" id="addr_update_cb"> 기본 주소로 저장
				</td>
			</tr>
			<tr><td colspan="2"><input type="checkbox" id="addr_checkbox">
				<label for="addr_checkbox">주소와 동일</label>
			</td></tr>
			<tr>
				<td>
					배송지 : 
				</td>
				<td>
					<input type="text" name="show_cust_addr">
				</td>
			</tr>
		</table>
			<hr style="width: 80%; margin-top: 50px;">
		<table class="userTable">
			<tr><td>
			<form method="post" id="pay_frm" action="cust_totalOrder">
				<div class="cart_list" id="cart_list">
				<div style="height:200px; width:200px; background-color: darkgray; float: left; overflow: hidden; margin: 50px 0 51.5px 0;">
						<img src="${prod_imgpath}" style="width: 100%;height: 100%">
<!-- 					이미지 -->
				</div>
				<div style="height:200px; width:100px; left: 0; float: right; margin-left: 20px; text-align: center; margin: 50px 0 51.5px 0;">
					<input type="button"  value="삭제"  class="btn" onclick="cartDelete(${cart.cust_key},${cart.prod_key})" style="padding: 8px 16px;">
				</div>
				<div style="float: right; height: 200px; width: 550px; margin: 50px 0 51.5px 0;">
					상품 명 = ${prod_name}
					<input type="hidden" name="prod_name" value="${prod_name}"><br>
					개수 = 
					<input type="number"  name="ord_count" id="ord_count" value="${ord_count}">
					<input type="button" id="cart_plus_btn" value="+">
					<input type="button" id="cart_minus_btn" value="-">
					<br>
					가격 = ${prod_price}<br>
					<input type="hidden" name="ord_price" id="ord_price" value="${prod_price}">
					<input type="hidden" id="price_hidden" value="${prod_price}">
		<%-- 			개수 = ${cart.prod_count}<br> --%>
					사이즈 = ${prod_size}<br>
					총 가격 = <span id="total">${prod_price}</span><br>
					</div>
				</div>
		 		<input type="hidden" id="hid_name" value="${prod_name}">
				<input type="hidden" name="cust_key" value="${customer.cust_key}">
				<input type="hidden" name="cust_id" value="${customer.cust_id}">
				<input type="hidden" name="cust_name" value="${customer.cust_name}">
				<input type="hidden" name="cust_addr" value="${customer.cust_addr}">
				<input type="hidden" name="cust_email" value="${customer.cust_email}">
				<input type="hidden" name="cust_phone" id="cust_phone" value="${customer.cust_phone}">
<%-- 				<input type="hidden" name="cust_addr" value="${customer.cust_addr}"> --%>
<%-- 				<input type="hidden" name="cust_phone" value="${customer.cust_phone}"> --%>
				<input type="hidden" name="idx" value="">
				<input type="hidden" name="ord_merchant"  value="">
		</td></tr>
		<tr><td>
					<div class="pp">
						주문 시 요청사항 : <br>
						<textarea rows="5" cols="50" name="ord_request"></textarea><br>
						<input type="hidden" name="ord_totalprice" value="${prod_price}">
						<p class="prod_show" style="font-size: 30px; display: inline;"></p> : &nbsp;&nbsp;&nbsp;
						<p class="totalprice_show" style="font-size: 50px; display: inline;"></p>원
					</div>
		</td></tr>
			</table>
		</form>
		<label for="radio_kakao">
		<div style="border: 1px solid black; display: block; width:60%;height:50px; border-radius: 3px; margin: auto; padding-left: 20px;">
		<input type="radio" name="pay" id="radio_kakao">&nbsp;&nbsp;&nbsp;카카오페이
		</div>
		</label>
		<label for="radio_kicc">
		<div style="border: 1px solid black; display: block; width:60%;height:50px; border-radius: 3px; margin: auto; padding-left: 20px;">
		<input type="radio" name="pay" id="radio_kicc">&nbsp;&nbsp;&nbsp;KICC
		</div>
		</label><br>
		<div id="pay_btn_div"style="text-align: center;"><button id="pay_btn">결제하기</button></div>
<script>
$(function(){
	var IMP = window.IMP; 
	IMP.init('imp84417256');
	
// 	$("#pay_btn11").on("click", function(){
// 		var statusCount = $('form').length;
// //         submitForms(statusCount);
//         alert(statusCount-1);
// 	});
	function submitForms(){
		var formId = "#pay_frm";
		$.ajax({
			 url:$(formId).attr("action"),
			 type:$(formId).attr("method"),
			 data:$(formId).serialize(),
			 success:function(data){
				alert("결제가 완료되었습니다");
			 	location.href="cust_orderView";
			 }
		 }); // ajax 끝
	}
	function phoneUpdate(){
		console.log("@@@@@ phoneUpdate");
		var cust_key = $("input[name=cust_key]").val();
		var cust_phone = $("input[name=cust_phone]").val();
		alert("cust_phone : "+cust_phone);
		$.ajax({
			url:"phoneUpdate",
			type:"post",
			data:{cust_key:cust_key
				 ,cust_phone:cust_phone},
			success:function(){
// 				alert("연락처 업데이트 성공");
			},
			error:function(){
// 				alert("연락처 저장에 실패");
			}
		});
	}
	function addrUpdate(){
		console.log("@@@@@ addrUpdate");
		var cust_key = $("input[name=cust_key]").val();
		var cust_addr = $("input[name=cust_addr]").val();
		
		alert("cust_addr : "+cust_addr);
		$.ajax({
			url:"addrUpdate",
			type:"post",
			data:{cust_key:cust_key
				 ,cust_addr:cust_addr},
			success:function(){
// 				alert("주소 업데이트 성공");
			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("주소 업데이트 실패");
			    console.log("AJAX 오류 발생");
			    console.log("상태 코드: " + jqXHR.status);
			    console.log("에러 종류: " + textStatus);
			    console.log("에러 내용: " + errorThrown);
			}
		});
	}
	$("#testbtn").on("click",function(){
		var ord_name = "${customer.cust_name}";
		var ord_phone = $("input[name=cust_phone]").val();
		var ord_addr = $("input[name=cust_addr]").val();
		var cust_id = "${customer.cust_id}";

		alert("name, phone. addr, id : "+ord_name+ord_phone+ord_addr+cust_id);
	});
	$("#pay_btn").on("click", function(){
		var ord_name = "${customer.cust_name}";
		var ord_phone = $("input[name=cust_phone]").val();
		var ord_addr = $("input[name=cust_addr]").val();
		var cust_id = "${customer.cust_id}";

		var addr_check = false;
		var phone_check = false;
		var cust_addr_check = false;
		
		if($("input[name=show_cust_addr]").val().length==0){
			alert("배송지를 입력해주세요");
			cust_addr_check = false;
		}else{
			cust_addr_check = true;
		}
		if($("input[name=phone]").val().length==0){
			alert("연락처를 입력해주세요");
			phone_check = false;
		}else{
			phone_check = true;
		}
		if($("input[name=addr]").val().length==0){
			alert("주소를 입력해주세요");
			addr_check = false;
		}else{
			addr_check = true;
		}
		if(addr_check&&phone_check&&cust_addr_check){
			if($("#radio_kakao").is(":checked")){
				if(confirm("총 "+$("input[name=ord_totalprice]").val()+"원 입니다. 결제하시겠습니까?")){
					$(function(){ 
						var cust_email = $("input[name=cust_email]").val();
						merchant_uid = 'merchant_' + new Date().getTime();
						IMP.request_pay({
					    	pg : "kakaopay", 
					        pay_method : 'card',
					        merchant_uid : merchant_uid,
					        name : $("input[name=prod_name]").val(),
					        amount : $("input[name=ord_totalprice]").val(),
					        buyer_email : cust_email,
					        buyer_name : ord_name,
					        buyer_tel : ord_phone,
					        buyer_addr : ord_addr,
					        buyer_postcode : '구매자 주소',
					    }, function(rsp) {
					        if ( rsp.success ) {
					            alert('결제가 완료되었습니다');
// 					            alert('merchant_uid : '+merchant_uid);
					            $("input[name=ord_merchant]").val(merchant_uid);
					            var statusCount = $('form').length;
					            submitForms();
					          	if($("#addr_update_cb").is(":checked")){
					          		addrUpdate();
// 					          		alert("주소 변경");
					          	}
					          	if($("#tel_update_cb").is(":checked")){
					          		phoneUpdate();
// 					          		alert("연락처 변경");
					          	}
					        } else {
					            alert('결제에 실패했습니다');
					            rsp.error_msg;
					        }
					    });
					});
				}else{
					alert("결제가 취소되었습니다");
				}
			}else if($("#radio_kicc").is(":checked")){
				if(confirm("총 "+$("input[name=ord_totalprice]").val()+"원 입니다. 결제하시겠습니까?")){
					$(function(){
						var cust_email = $("input[name=cust_email]").val();
						merchant_uid = 'merchant_' + new Date().getTime();
						IMP.request_pay({
					    	pg : "kicc", 
					        pay_method : 'card',
					        merchant_uid : merchant_uid,
					        name : $("input[name=prod_name]").val(),
					        amount : $("input[name=ord_totalprice]").val(),
					        buyer_email : cust_email,
					        buyer_name : ord_name,
					        buyer_tel : ord_phone,
					        buyer_addr : ord_addr,
					        buyer_postcode : '구매자 주소',
						}, function(rsp) {
					        if ( rsp.success ) {
					            alert('결제가 완료되었습니다');
// 					            alert('merchant_uid : '+merchant_uid);
					            $("input[name=ord_merchant]").val(merchant_uid);
					            var statusCount = $('form').length;
					            submitForms();
					          	if($("#addr_update_cb").is(":checked")){
					          		addrUpdate();
// 					          		alert("주소 변경");
					          	}
					          	if($("#tel_update_cb").is(":checked")){
					          		phoneUpdate();
// 					          		alert("연락처 변경");
					          	}
					        } else {
					            alert('결제에 실패했습니다');
					            rsp.error_msg;
					        }
					    });
					});
				}else{
					alert("결제가 취소되었습니다");
				}
			}else{
				alert("결제방법을 체크해주세요")
			}
		}
	});
	
	$(".pp").hide();
	$(".pp").last().show();
	
	var cart_plus_btn = $("#cart_plus_btn");
	var cart_minus_btn = $("#cart_minus_btn");
	let ord_count = $("#ord_count");
	let ord_price = $("#ord_price");
	let total = $("#total");

	prod_name = $("input[name=prod_name]").first().val();
	$(".prod_show").text(prod_name);
	
	total.text(ord_price.val()*ord_count.val());
	$(".totalprice_show").text(total.text());
	total.text(ord_price.val()*ord_count.val());
	$('input[name=ord_totalprice]').val(total.text());

	cart_plus_btn.on("click", function(){
		if (ord_count.val()<99){
			ord_count.val(parseInt(ord_count.val())+1);
		}
		total.text(ord_price.val()*ord_count.val());
		
		$('input[name=ord_totalprice]').val(total.text());
		$(".totalprice_show").text(total.text());
	});				
    cart_minus_btn.on("click", function() {
		if (ord_count.val() > 1) {
			ord_count.val(parseInt(ord_count.val()) - 1);
		}
		total.text(ord_price.val()*ord_count.val());

		$('input[name=ord_totalprice]').val(total.text());
		$(".totalprice_show").text(total.text());
    });
});
</script>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>