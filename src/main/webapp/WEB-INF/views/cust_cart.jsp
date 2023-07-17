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
<script
  type="text/javascript"
  src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
></script>
<style>
	body{
		background-color: #FFFAFA;
		font-family: 'Times New Roman', Times, serif;
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
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	.list_name{
		margin-top: 100px;
	}
	.list_main{
		margin: 0 auto;
		margin-bottom: 100px;
		width: 1000px;
		overflow: hidden;
		text-align: center;
	}
	.list_content{
		width: 90%;
		height: 800px;
		margin: 30px auto;
 		overflow: auto;
	}
	.cart_list{
		height: 200px;
		margin: 50px auto;
	}
	.cart_list img{
		height: 100%;
		margin: auto;
	}
	hr:last-child{
		display: none;
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
	#pay_btn_div button {
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
	#pay_btn_div button:hover {
	    background-color: #696969;
	}
</style>
<script>
	var total_price = 0;
	var last_pname = "";
	var max_idx = 0;
	
	function cartDelete(cust_key, prod_key){
		if(confirm("장바구니에서 삭제하시겠습니까?")){
			location.href='cust_cartDelete?cust_key='+cust_key+'&prod_key='+prod_key;
		}else{
// 			alert(''+key);			
		}
	}
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
		var totalprice = 0;
		var prod_name;
		
		for(var n=1; n<=10; n++){
			var selector = "#cart_list_"+n;
			if($(selector).length){
				idx= n;
			}
			console.log("idx : "+idx+", n : "+n)
		}
		$(function(){
				$("#cart_none").hide();
			if(idx<1){
				$("#cart_none").show();
				$("#cart_none").text("현재 장바구니에 상품이 없어요..");
				$("#pay_btn_div").hide();
			}else{
				$("#cart_none").hide();
			}
		});
		$(function(){	// 총 금액 초기값
			for(var i=0; i<=idx; i++){
				totalprice += parseInt($("#prod_price_"+i).val());
				prod_name = $("input[name=prod_name]").val();
			}
			$("input[name=totalprice]").val(totalprice);
			$("input[name=prod]").val(""+prod_name+" 외 "+idx+"개");
			$("input[name=idx]").val(idx);
		});
		
		
		$('select').change(function(){ // 개수 바꿀 때 마다 총 금액 반환
			totalprice=0;
			for(var i=0; i<=idx; i++){
				var selector = "#sel_"+i;
				var totalSelector = "#total_"+i;
				var priceSelector = "#price_hidden_"+i;
				var count = $(selector).val();
				var total = $(priceSelector).val()*count;
				$(totalSelector).text(total);
				totalprice += total;
			}//for 끝
			
			$('input[name=totalprice]').val(totalprice);

		}); //change func 끝
		
		for (var i = 1; i <= idx; i++) {
			let cart_plus_btn = $("#cart_plus_btn_"+i);
			let cart_minus_btn = $("#cart_minus_btn_"+i);
			let cart_count = $("#cart_count_"+i);
			let prod_key = $("#prod_key_"+i);
			
			cart_plus_btn.on("click", function(){
				if (cart_count.val()<99){
					cart_count.val(parseInt(cart_count.val())+1);
				}
				cartCountUpdate(cart_count.val(), prod_key.val());
			});				
		    cart_minus_btn.on("click", function() {
				if (cart_count.val() > 1) {
			      cart_count.val(parseInt(cart_count.val()) - 1);
				}
				cartCountUpdate(cart_count.val(), prod_key.val());
		    });
		}
		function cartCountUpdate(cart_count, prod_key){
			$.ajax({
				 url:"cust_cartCountUpdate",
				 type: "post",
				 data:{cart_count : cart_count,
					 	  prod_key : prod_key},
				 success:function(){
				 }
			 }); // ajax 끝
		}
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<a class="login-a" href="#"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
	<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
	<div class="notice_main">
		<h4 style="color:#BC8F8F;">Cart List</h4>
	</div><hr><br><br>
	<div class="list_main">
		<div class="list_content">
		<div id="cart_none" style="text-align: center; font-size: 25px;">상품X</div>
		<c:forEach items="${cartList}" var="cart" varStatus="status">
			<form method="post" id="pay_frm_${status.count}" action="cust_totalOrder">
					<div class="cart_list" id="cart_list_${status.count}">
					<div style="height:100%; width:200px; background-color: darkgray; float: left; overflow: hidden;">
	<%-- 					이미지 = ${cart.prod_imgpath} --%>
						<img src="/img/${cart.prod_imgpath}">
					</div>
					<div style="height:100%; width:100px; left: 0; float: right; margin-left: 20px;">
<%-- 						<input type="button" onclick="cartDelete(${cart.cust_key},${cart.prod_key})" value="삭제"> --%>
					<input type="button"  value="삭제"  class="btn" onclick="cartDelete(${cart.cust_key},${cart.prod_key})" style="padding: 8px 16px;">

					</div>
					<div style="height:100%; width:550px; left: 0; float: right; text-align: left; padding-left: 20px; font-size: 25px;">
						<p style="font-size: 30px; margin: 0.5em 0;'"><b>${cart.prod_name}</b><p>
						<input type="hidden" name="prod_name" value="${cart.prod_name}">
						가격 = ${cart.prod_price}<input type="hidden" name="prod_price" id="prod_price_${status.count}" value="${cart.prod_price}"><br>
						<input type="hidden" id="price_hidden_${status.count}" value="${cart.prod_price}">
						사이즈 = ${cart.prod_size}<br>
						개수 = 
						<input type="number"  name="cart_count" id="cart_count_${status.count}" value="${cart.cart_count}" style="width:50px; height: 35px; font-size: 25px;">
						<input type="button" id="cart_plus_btn_${status.count}" value="+" class="btn" style="padding: 8px 16px; margin: 5px;">
						<input type="button" id="cart_minus_btn_${status.count}" value="-" class="btn" style="padding: 8px 18px; margin: 5px;">
					</div>
		 		<input type="hidden" id="hid_name" value="${cart.prod_name}">
				<input type="hidden" name="cust_key" value="${customer.cust_key}">
		 		<input type="hidden" id="prod_key_${status.count}" value="${cart.prod_key}">
				<input type="hidden" name="cust_id" value="${customer.cust_id}">
				<input type="hidden" name="cust_name" value="${customer.cust_name}">
				<input type="hidden" name="cust_addr" value="${customer.cust_addr}">
				<input type="hidden" name="cust_phone" value="${customer.cust_phone}">
				<input type="hidden" name="idx" value="">
				</div>
				<hr style="width: 90%;">
		</form>
		</c:forEach>
		</div>
		<div id="pay_btn_div"style="margin: auto; width: 177px; height: 72px;"><button id="pay_btn">주문하러 가기</button></div>
	</div>
<script>
$(function(){
	$("#pay_btn").on("click", function(){
		location.href='cust_cartPay';
	});
	
	var ord_name = "${customer.cust_name}";
	var ord_phone = "${customer.cust_phone}";
	var ord_addr = "${customer.cust_addr}";
	var cust_id = "${customer.cust_id}";
	
	var IMP = window.IMP; 
	IMP.init('imp84417256');
	
	
	$("button[name=kakao_btn1]").on("click", function(){
		var statusCount = $('form').length;
//         alert(statusCount-1);
	});
	function submitForms(index){
		var formId = "#pay_frm_"+index;
		$.ajax({
			 url:$(formId).attr("action"),
			 type:$(formId).attr("method"),
			 data:$(formId).serialize(),
			 success:function(data){
				 if(index>0){
					 console.log("index : "+index)
					 submitForms(index-1);
				 }else{
					 alert("성공");
					 location.href="cust_orderView";
				 }
			 }
		 }); // ajax 끝
	}
	$("button[name=kakao_btn]").on("click", function(){
		if(confirm("총 "+$("input[name=totalprice]").val()+"원 입니다. 결제하시겠습니까?")){
			$(function(){ 
				IMP.request_pay({
			    	pg : "kakaopay", 
			        pay_method : 'card',
			        merchant_uid : 'merchant_' + new Date().getTime(),
			        name : $("input[name=prod]").val(),
			        amount : $("input[name=totalprice]").val(),
			        buyer_email : '구매자 이메일',
			        buyer_name : ord_name,
			        buyer_tel : ord_phone,
			        buyer_addr : ord_addr,
			        buyer_postcode : '구매자 주소',
			    }, function(rsp) {
			        if ( rsp.success ) {
			            alert('결제가 완료되었습니다');
			            var statusCount = $('form').length;
			          	submitForms(statusCount);
			        } else {
			            alert('결제에 실패했습니다');
			            rsp.error_msg;
			        }
			    });
			});
		}else{
			alert("결제가 취소되었습니다");
		}
	});
	
	
	$("button[name=kicc_btn]").on("click", function(){
		if(confirm("총 "+$("input[name=totalprice]").val()+"원 입니다. 결제하시겠습니까?")){
			$(function(){ 
				IMP.request_pay({
			    	pg : "kicc", 
			        pay_method : 'card',
			        merchant_uid : 'merchant_' + new Date().getTime(),
			        name : $("input[name=prod]").val(),
			        amount : $("input[name=totalprice]").val(),
			        buyer_email : '구매자 이메일',
			        buyer_name : ord_name,
			        buyer_tel : ord_phone,
			        buyer_addr : ord_addr,
			        buyer_postcode : '구매자 주소',
			    }, function(rsp) {
			        if ( rsp.success ) {
			            var msg = '결제가 완료되었습니다.';
			            var statusCount = $('form').length;
			          	submitForms(statusCount);
			        } else {
			            var msg = '결제에 실패하였습니다.';
			            rsp.error_msg;
			        }
			    });
			});
		}else{
			alert("결제가 취소되었습니다");
		}
	});
});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>