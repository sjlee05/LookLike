<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">
<style>
  body{
/*  		background-color: #FFFFF0;  */
 		background-color: white; 
  		font-size: 20px; 
	}
	table, tr, td{
		 border:none;
	}
	.img_slider {
		
	}
	.img_slider li {
		text-align: center;
	}
    .img_slider li img{
   		display: inline-block;
        margin: 0 auto;
        width: 500px;
        height: 570px;
        padding: 50px;
    }
    .header-div {
		width: 1500px;
		height: 80%;
		margin: 100px auto;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
/* 		display: flex; */
		align-items: center;
		justify-content: center;
		z-index: -1;
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
/* 	background-color: white;  */
/*  	background-color: #FFFFF0;   */
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script>
$(document).ready(function () {
	var actionForm = $("#actionForm");
	
	//	페이지 번호처리
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
 
});

// cust_main 에서 받아온 부분=========================================================
	
	var naver_id_login = new naver_id_login("6U_OLLsWLPImryNodbKG", "http://localhost:8181/projectfinal/main");
	// 접근 토큰 값 출력
// 	alert("token : "+naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	    alert("email : "+naver_id_login.getProfileData('email'));
	    alert("nickname : "+naver_id_login.getProfileData('nickname'));
// 	    alert("age" + naver_id_login.getProfileData('age'));
	    alert("id : "+naver_id_login.getProfileData('id'));
// 	    alert(naver_id_login.getProfileData('birthday'));
// 	    alert(naver_id_login.getProfileData('gender'));
	    alert("mobile : "+naver_id_login.getProfileData('mobile'));
	    alert("name : "+naver_id_login.getProfileData('name'));
	}
	var cust_id;
	var ad_id;
	
	
	
	
	$(function(){
		var win_width = $(window).width();
		var win_height = $(window).height();
		$("section").css({"margin-top":win_height*0.7});
		
			$(".img_slider").bxSlider({
				auto:true,
				pager:false,
				minSlides: 3,
				maxSlides: 3,
				slideWidth: 700,
				moveSlides: 1,
				speed: 1000,
				pause: 4000,
				slideMargin: 10
			});

// 		var sec_height = $(".section-div").height();
// 		$("section").css({height:sec_height});
		
		cust_id = "${cust_id}";
		console.log("cust_id:"+cust_id);
		ad_id = "${ad_id}";
		var login_word = "Log In";
		$(".modal-btn").hide();
		
		if(cust_id.length>0){
	        $(".modal-btn").show();
	        $(".login-btn").text(cust_id);
	        $(".login-btn").css({"background-color":"#BC8F8F"});
	        $(".login-btn").attr("onclick", "location.href='cust_myPage'");
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
	        $(".login-btn").attr("onclick", "location.href='cust_login'");
	     }
		
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
<!-- 	카테고리 부분 -->
<div class="nav-menu" style="opacity: 0.7;">
<jsp:include page="/WEB-INF/views/include/nav-main.jsp" >
	<jsp:param name="cust_id" value="${cust_id}"/>
</jsp:include>
</div>
<a class="login-a" href="#"><button class="login-btn" >Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>

<!-- <button class="modal-btn"> modal</button> -->
		<!-- <header> -->
        <div class="header">
            <div class="header-div" >
                <!-- <img class="header-img" src="Model1.jpg"><br> -->
                <ul class="img_slider">
<%--                     <li><img src="${prod_imgPath}"></li> --%>
         <li><img src="${pageContext.request.contextPath}/resources/images/테스트6.gif">
            
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/테스트.gif"></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/테스트2.gif"></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/테스트3.gif"></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/테스트4.gif"></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/테스트5.gif"></li>
                </ul>
            </div>
        </div>
	<!-- </header> -->
<!-- 	<section> -->
	<section style="height: auto;">
<!-- 	상품조회 부분 -->
			
	<br>
	
<div align="center" style="background-color:#FFFAFA;  font-family: 'Times New Roman', Times, serif;">
<!-- 	상품목록 보는 부분 -->
<h2 style="color: #BC8F8F;">NEW ARRIVAL</h2>
	<table border="1" class="tab">
		<tr>
		<c:forEach items="${prod_member_list}" var="dto" varStatus="status">
			<td class="line" align="center">
				<a href="prod_member_content_view?prod_key=${dto.prod_key}">
<%-- 					<img src="${dto.prod_thumbnailPath}"> --%>
					<img src="${dto.prod_imgPath}" style="width: 350px; height: 400px;">
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
 
</div>	

<!----------------------------------- footer 시작 ------------------------------->
<!--  <div class="footer">  -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<!-- </div>  -->
</section>		
</body>
</html>