<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <link href="resources/css/stylelogin.css" rel="stylesheet" type="text/css">
    <!-- <link rel="stylesheet" href="css/stylemain.css"> -->
    <link rel="stylesheet" href="resources/css/button.css">
    <link rel="stylesheet" href="resources/css/nav.css">
    <script src="resources/js/nav.js"></script>
    <link rel="stylesheet" href="resources/css/footer.css">
</head>
<style>
  body{
    background-color: rgba(0, 0, 0, 0);
  }
  .footer{
    width: 100%;
    position: fixed;
    left: 0;
    bottom: -180px;
    z-index: 99;
  }
 .form-structor::after {
  background-image: url("resources/images/login.gif");
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script>
  $(function(){
    
    $(".footer").hover(function(){
      $(this).animate({"bottom":0});
    },function(){
      $(this).animate({"bottom":"-180px"});
    });
  });
</script>
<body>
<!-- 	<div class="nav"></div> -->
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!------------------------------------- nav 끝 ---------------------------------->
<div class="form-structor">
	<form id="frm" method="post" action="admin_registerOk">
        <div class="signup">
          <h2 class="form-title" id="signup"><span>or</span>Manager Sign up</h2>
          <div class="form-holder">
            <input type="id" class="input" placeholder="id" name="cust_id"/>
            <input type="password" class="input" placeholder="Password" name="ad_pwd"/>
            <input type="text" class="input" placeholder="Name" name="ad_name"/>
          </div>
          <button class="submit-btn" onclick="fn_submit()">Manager Sign up</button>
          <img src="resources/images/naver.png" style="width: 45%; height:45%; margin: 2%;">
          <img src="resources/images/google.png" style="width: 45%; height:45%; margin: 2%;">
        </div>
      </form>
        <div class="login slide-up">
          <div class="center">
            <h2 class="form-title" id="login"><span>or</span>Manager Log in</h2>
            <form method="post" name="login_frm" action="admin_loginOk">
            <div class="form-holder">
              <input type="id" class="input" id="login_id" name="ad_id" placeholder="id" />
              <!-- <input type="email" class="input" placeholder="Email" /> -->
              <input type="password" class="input" id="login_pw" name="ad_pwd" placeholder="Password" />
            </div>
            <input type="button" class="submit-btn" id="login-btn"  value="Manager Log in">
            <a href="#" class="forget-id-pw">Forget ID or Password</a>
            </form>
          </div>
        </div>
      </div>
      <!-- <img src="image/btnD_icon_square.png" style="width: 6%;" height="6%"> -->
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script>
console.clear();

  window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ 
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("address_kakao").value = data.address; 
                document.querySelector("input[name=address_detail]").focus();
            }
        }).open();
    });
}


const loginBtn = document.getElementById("login");
const signupBtn = document.getElementById("signup");

loginBtn.addEventListener("click", (e) => {
let parent = e.target.parentNode.parentNode;
Array.from(e.target.parentNode.parentNode.classList).find((element) => {
if (element !== "slide-up") {
  parent.classList.add("slide-up");
} else {
  signupBtn.parentNode.classList.add("slide-up");
  parent.classList.remove("slide-up");
}
});
});

signupBtn.addEventListener("click", (e) => {
let parent = e.target.parentNode;
Array.from(e.target.parentNode.classList).find((element) => {
if (element !== "slide-up") {
  parent.classList.add("slide-up");
} else {
  loginBtn.parentNode.parentNode.classList.add("slide-up");
  parent.classList.remove("slide-up");
}
});
});


function fn_submit(){
//form 요소 자체
var formData = $("#frm").serialize();

$.ajax({
	type:"post"
   ,data:formData
//    ,url:"registerOk"
   ,success: function(data) {
		alert("회원가입완료");
// 		location.href="loginmanager"
	}//end of success
   ,erro: function() {
		alert("오류발생");
	}//end of erro
});//end of ajax

};


$(function(){
	$('#login-btn').on("click", function(){

		var ad_id = $('#login_id').val();
		var ad_pwd = $('#login_pw').val();
		
		$.ajax({
			 type:"post",
			 url:"admin_login_yn",
			 data:{ad_id:ad_id,ad_pwd:ad_pwd},
			 success:function(data){
// 				 alert(data);
				 if(data==1){
					 alert("로그인되었습니다");
					 processResponse();
// 					 location.href="loginOk";
				 } else{
					 alert("로그인에 실패했습니다")
				 }
			 },
			 error:function(request, error){
				 alert(""+request.status+"\n"+error);
			 }
		 });
	});
function processResponse(){
	location.href="admin_loginOk?ad_id="+$("#login_id").val();
}
});

</script>
	<!----------------------------------- footer 시작 ------------------------------->
<div class="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>
<!-- 	<div class="footer"></div> -->
</body>
</html>