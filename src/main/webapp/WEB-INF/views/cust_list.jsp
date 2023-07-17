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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/login_session.js">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css">

<style>

</style>
<script>
	$(function(){
		$(".hot_slider").bxSlider({
        minSlides: 3,      // 한 번에 최소 3개의 슬라이드를 보여줌
        maxSlides: 3,      // 한 번에 최대 3개의 슬라이드를 보여줌
        moveSlides: 1,     // 한 번에 한 개의 슬라이드씩 넘어감
        slideWidth: 300,   // 슬라이드 요소의 너비를 지정
        slideMargin: 20,   // 슬라이드 사이의 간격
        auto: true,        // 자동으로 슬라이드 넘김
        pause: 3000,        // 슬라이드 간격 설정 (3초)
		pager: false,
		responsive: false
      });
		var cust_id = "${cust_id}";
		var ad_id = "${ad_id}";
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
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<a class="login-a" href="#"><button class="login-btn">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log out</button></a>
<!------------------------------------- nav 끝 ---------------------------------->
	<div class="hot_prod">
		<hr width="100px">
		<h1>Hot Order</h1>
		<h2>인기 상품</h2>
		<hr width="100px">
		<div class="slider_div">
			<div class="hot_slider">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Model1.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Model2.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Model3.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Model1.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Model2.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Model3.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
			</div>
		</div>
	</div>
	<div class="list_main">
		<div class="list_prod">
			<h1>티셔츠</h1>
			<div class="list_prod_list">
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model1.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model1.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model1.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
			</div>
		</div>
		<div class="list_prod">
			<h1>맨투맨</h1>
			<div class="list_prod_list">
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model2.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model2.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model2.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
			</div>
		</div>
		<div class="list_prod">
			<h1>후드</h1>
			<div class="list_prod_list">
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model3.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model3.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
				<div class="list_prod_list_prod">
					<img src="${pageContext.request.contextPath}/resources/images/Model3.jpg">
					<p>상품 이름</p>
					<p>상품 가격</p>
				</div>
			</div>
		</div>
	</div>
	<!----------------------------------- footer 시작 ------------------------------->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<!-- 	<div class="footer"></div> -->
</body>
</html>