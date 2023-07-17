<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">

<style>
	.prod_info{
		border: 1px solid red;
		margin: auto;
		margin-top: 200px;
		width: 1000px;
		height: 700px;
	}
	.prod_img{
		box-sizing: border-box;
		border: 1px solid green;
		float: left;
		width: 495px;
		height: 700px;
		display: block;
	}
	.prod_img img{
		padding: 10px;
		width: 100%;
		max-height: 100%;
	}
	.prod_div{
		box-sizing: border-box;
		border: 1px solid purple;
		float: right;
		width: 495px;
		height: 300px;
		padding: 35px 20px;
		display: block;
	}
	.prod_table{
		border: 1px solid orange;
		margin: auto;
		width: 100%;
		height: 100%;
	}
	.prod_order{
		box-sizing: border-box;
		border: 1px solid blue;
		float: right;
		width: 495px;
		height: 400px;
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
		border: 1px solid black;
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
		border: 1px solid goldenrod;
		width: 100%;
		height: 450px;
	}
	
	.prod_detail{
		border: 1px solid red;
	}
	.prod_review{
		border: 1px solid orange;
	}
	.prod_guide{
		border: 1px solid green;
	}
	.prod_faq{
		border: 1px solid blue;
	}
</style>
<script>
	$(function(){
		$(".nav").load("/nav.html");
		$(".footer").load("/footer.html");
		
		var cust_id = "${cust_id}";
		$(".modal-btn").hide();
		
   		if(cust_id==null){
   			$(".login-btn").text("Log In");
   			$(".login-btn").css({"background-color":"lightblue"});
   			
   			$(".login-btn").removeAttr("onclick");
   			$(".login-btn").attr("onclick", "location.href='login';");
   		}else{
   			$(".login-btn").text(cust_id);
   			$(".login-btn").css({"background-color":"gray"});
   			
   			$(".login-btn").removeAttr("onclick");
   			$(".login-btn").attr("onclick", "location.href='myPage';");
   			$(".modal-btn").show();
   		}
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<a class="login-a" href="#"><button class="login-btn">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log out</button></a>
<!------------------------------------- nav 끝 ---------------------------------->
		<div class="prod_info">
			<div class="prod_img">
				<img src="${pageContext.request.contextPath}/resources/images/Model1.jpg">
			</div>

			<div class="prod_div">
				<table class="prod_table">
					<tr>
						<td style="font-size: 25px;"><b>[상품 종류] 상품 이름<br>상품 이름</b></td>
					</tr>
					<tr>
						<td>상품 설명 : Lorem ipsum dolor sit amet consectetur adipisicing elit. Itaque sunt, odio vitae tenetur nisi dignissimos nesciunt atque expedita, earum deserunt eligendi debitis nulla facilis necessitatibus aperiam, maxime iste et doloremque.</td>
					</tr>
				</table>
			</div>
			
			<div class="prod_order">
				<table class="order_table">
					<tr>
						<td style="font-size: 25px; width: 175px;">SIZE</td>
						<td style="font-size: 25px;">S | M | L | XL | XXL</td>
					</tr>
					<tr>
						<td style="font-size: 25px;">COLOR</td>
						<td style="font-size: 25px;">Black, White, Beige</td>
					</tr>
					<tr>
						<td style="font-size: 20px;">적용되는<br>이벤트</td>
						<td style="font-size: 25px;">없음</td>
					</tr>
					<tr>
						<td style="font-size: 25px;">PRICE</td>
						<td style="font-size: 25px;">$ 10,000</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; vertical-align: bottom;">
							<a href="#" class="btn-two green">구매</a>
							<a href="#" class="btn-two gray">장바구니</a>
							<a href="#" class="btn-two purple">찜하기</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="select_content">
				<a id="c_select_detail">Detail</a>|
				<a id="c_select_review">review</a>|
				<a id="c_select_guide">Guide</a>|
				<a id="c_select_faq">FAQ</a>|
			</div>
			<div class="prod_detail"><%@ include file="/WEB-INF/views/include/prod_detail.jsp" %>
			</div>
			<div class="prod_review"><%@ include file="/WEB-INF/views/include/prod_review.jsp" %>
			</div>
			<div class="prod_guide"><%@ include file="/WEB-INF/views/include/prod_guide.jsp" %>
			</div>
			<div class="prod_faq"><%@ include file="/WEB-INF/views/include/prod_faq.jsp" %>
			</div>
		</div>
<!----------------------------------- footer 시작 ------------------------------->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>