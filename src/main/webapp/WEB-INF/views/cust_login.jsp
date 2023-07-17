<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/stylelogin.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
    <script src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
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
  background-image: url("${pageContext.request.contextPath}/resources/images/login.gif");
}
font{
      position: absolute;
      top: 50%;
      left: 200px;
      transform: translateY(-50%);
      font-size: 10px;
      color: rgba(0, 0, 0, 0.4);
    }
.forget-id-pw:not(:nth-child(1)):hover {
	color: red;
}
</style>
<script>
	
	//공백 체크
	function checkSpace(str) {
		if(str.search(/\s/) != -1) return true;
		else return false;
	}
	// 특수 문자 체크
	function checkSpecial(str) {
		var special_pattern = /[`\-~!@#$%^&*|\\\'\";:\/?]/gi;
		
		if(special_pattern.test(str) == true) return true;
		else return false;
	}
	// 이메일 체크
	function checkEmail(str){
		if(str.includes('@')) return true;
		else return false;
	}
	// ajax 동작
	function processResponse(){
		location.href="cust_loginOk?cust_id="+$("#login_id").val();
	}
  $(function(){
	  var idConfirm = false;
	  var pwConfirm = false;
	  var nameConfirm = false;
	  var emailConfirm = false;
	  var phoneConfirm = false;
	  var addrConfirm = false;
	  
	  $('#idCheck').blur(function(){
		   if(checkSpace($('#idCheck').val())){
		    $('font[name=id_check]').html("공백없이<br>입력해주세요").css({color:"red"});
			  idConfirm = false;
		   }else if(checkSpecial($('#idCheck').val())){
		    $('font[name=id_check]').html("특수문자가<br>포함되어있습니다").css({color:"red"});
			  idConfirm = false;
		   }else if($('#idCheck').val().length==0){
		    $('font[name=id_check]').html("아이디를 입력해주세요").css({color:"red"});
			  idConfirm = false;
		   }else{
				var cust_id = $("#idCheck").val();
				 $.ajax({
					 url:"cust_idCheck",
					 data:{cust_id:cust_id},
					 success:function(data){
						 if(data==1){
// 							 alert("중복");
							 $('font[name=id_check]').html("사용중인<br>아이디입니다").css({color:"red"});
							  idConfirm = false;
						 } else{
// 							 alert("중복아님");
							 $('font[name=id_check]').html("사용가능한<br>아이디입니다").css({color:"green"});
							  idConfirm = true;
						 }
					 },
					 error:function(request, error){
// 						 alert(""+cust_id);
						 alert(""+request.status+"\n"+error);
					 }
				 }); // ajax 끝
			   }	 // if-else 끝
			 });	 // blur() 끝
	  
    $(".footer").hover(function(){
      $(this).stop().animate({"bottom":0});
    },function(){
      $(this).stop().animate({"bottom":"-180px"});
    });

    //     비밀번호 유효성 체크
    $('#passwordCheck1').keyup(function(){
    	if($('#passwordCheck1').val().length!=0 && $('#passwordCheck2').val().length!=0){
    		if($('#passwordCheck1').val()!=$('#passwordCheck2').val()){
    			$('font[name=pw_check]').html("암호 불일치").css({color:"red"});
    			  pwConfirm = false;
    		}else{
    			$('font[name=pw_check]').text('');
    			$('font[name=pw_check]').html("암호 일치").css({color:"green"});
    			pwConfirm = true;
    	   }
       }
	}); //#chpass.keyup
    $('#passwordCheck2').keyup(function(){
    	if($('#passwordCheck2').val().length!=0 && $('#passwordCheck1').val().length!=0){
    		if($('#passwordCheck2').val()!=$('#passwordCheck1').val()){
    			$('font[name=pw_check]').html("암호틀림").css({color:"red"});
    			pwConfirm = false;
    		}else{
    			$('font[name=pw_check]').text('');
    			$('font[name=pw_check]').html("암호맞음").css({color:"green"});
    			pwConfirm = true;
    	   }
       }
      }); //#chpass.keyup
    $('#passwordCheck2').blur(function(){
    	if($('#passwordCheck2').val().length==0 || $('#passwordCheck1').val().length==0){
    			$('font[name=pw_check]').html("암호를 입력해주세요").css({color:"red"});
    			pwConfirm = false;
       }
      }); //#chpass.keyup
//     	이름 체크
      $('#nameCheck').blur(function(){
    		if($('#nameCheck').val().length==0){
    			$('font[name=name_check]').html("이름을 입력해주세요").css({color:"red"});
    			  nameConfirm = false;
    		}else{
    			$('font[name=name_check]').html("").css({color:"green"});
    			  nameConfirm = true;
       		}
      }); //#chpass.keyup
//     	이메일 체크
      $('#emailCheck').blur(function(){
    	  var cust_email =  $("#emailCheck").val();
    		if($('#emailCheck').val().length==0){
    			$('font[name=email_check]').html("이메일을 입력해주세요").css({color:"red"});
    			emailConfirm = false;
    		}else if(checkEmail($('#emailCheck').val())==false){
    			$('font[name=email_check]').html("올바른 이메일 형식이 아닙니다").css({color:"red"});
    	   }else{
			$.ajax({
				 url:"emailCheck",
				 type:"post",
				 data:{cust_email:cust_email},
				 success:function(data){
					 if(data==1){
						 $('font[name=email_check]').html("사용중인<br>이메일입니다").css({color:"red"});
						  emailConfirm = false;
					 } else{
						 $('font[name=email_check]').html("사용가능한<br>이메일입니다").css({color:"green"});
						  emailConfirm = true;
					 }
				 },
				 error:function(request, error){
					 alert(""+request.status+"\n"+error);
				 }
			 }); // ajax 끝
      		}
      }); //#chpass.keyup
//     	번호 체크
      $('#telCheck').blur(function(){
    		if($('#telCheck').val().length==0){
    			$('font[name=tel_check]').html("전화번호를 입력해주세요").css({color:"red"});
    			phoneConfirm = false;
    		}else if(checkSpecial($('#telCheck').val())){
    			$('font[name=tel_check]').html("특수문자없이<br>입력해주세요").css({color:"red"});
    			phoneConfirm = false;
    		}else if($('#telCheck').val().length!=10&&$('#telCheck').val().length!=11){
    			$('font[name=tel_check]').html("올바른 형식이 아닙니다").css({color:"red"});
    			phoneConfirm = false;
    		}else{
    			$('font[name=tel_check]').html("").css({color:"green"});
    			phoneConfirm = true;
    		}
      }); //#chpass.keyup
//     	주소 체크
      $('#address_kakao').blur(function(){
    		if($('#address_kakao').val().length==0){
    			$('font[name=addr_check]').text('');
    			$('font[name=addr_check]').html("주소를 입력해주세요").css({color:"red"});
    			addrConfirm = false;
    		}else{
    			$('font[name=addr_check]').html("").css({color:"green"});
    			addrConfirm = true;
       		}
      }); //#chpass.keyup
		$('#register-btn').on("click", function(){
			if (idConfirm&&pwConfirm&&nameConfirm&&emailConfirm&&phoneConfirm&&addrConfirm){
// 				email 합치기
				var addr = $('#address_kakao').val()+$('#address_detail').val();
				$('#cust_addr').val(addr);

				alert("회원가입이 완료되었습니다");
				$('#register_frm').submit()
			}else{
				alert(""+idConfirm+pwConfirm+nameConfirm+emailConfirm+phoneConfirm+addrConfirm);
			}
		}); // register-btn function
		$('#login-btn').on("click", function(){
			var cust_id = $('#login_id').val();
			var cust_pwd = $('#login_pw').val();
			
			$.ajax({
				 url:"cust_login_yn",
				 data:{cust_id:cust_id,
				 	  	cust_pwd:cust_pwd},
				 success:function(data){
					 if(data==1){
						 alert("로그인되었습니다");
						 processResponse();
					 } else{
						 alert("로그인에 실패했습니다")
					 }
				 },
				 error:function(request, error){
					 alert(""+request.status+"\n"+error);
				 }
			 });
		});
	});
</script>
<body>
<!-- 	<div class="nav"></div> -->
<%@ include file="/WEB-INF/views/include/nav-main.jsp" %>
<!------------------------------------- nav 끝 ---------------------------------->
    <div class="form-structor">
  		<form method="post" id="register_frm"action="cust_registerOk">
        <div class="signup">
          <h1 class="form-title" id="signup"><span>or</span>Sign up</h1>
          <div class="form-holder">
          	<div class="input-container">
            <input type="id" id="idCheck" name="cust_id" class="input" placeholder="id"/>
            <font name="id_check" size="2"></font>
            </div>
            <input type="password" id="passwordCheck1" name="cust_pwd" class="input" placeholder="Password" />
          	<div class="input-container">
            <input type="password" id="passwordCheck2" class="input" placeholder="PasswordCheck" />
            <font name="pw_check" size="2"></font>
            </div>
          	<div class="input-container">
            <input type="text" class="input" id="nameCheck" placeholder="Name" name="cust_name" />
            <font name="name_check" size="2"></font>
          	</div>
          	<div class="input-container">
            <input type="email" class="input" id="emailCheck" placeholder="Email" name="cust_email" />
            <font name="email_check" size="2"></font>
          	</div>
          	<div class="input-container">
            <input type="tel" class="input" id="telCheck" placeholder="Phone" name="cust_phone" />
            <font name="tel_check" size="2"></font>
            </div>
          	<div class="input-container">
            <input type="text" class="input" id="address_kakao" placeholder="address(Click) " />
            <input type="text" class="input" id="address_detail" placeholder="address_detail" />
            <input type="hidden" name="cust_addr" id="cust_addr" value="">
            <font name="addr_check" size="2"></font>
            </div>
          </div>
          <input type="button" class="submit-btn"  id="register-btn" value="Sign up">

        </div>
        </form>
        <div class="login slide-up">
          <div class="center">
            <h1 class="form-title" id="login"><span>or</span>Log in</h1>
          <form method="post" name="login_frm" action="cust_loginOk" >
            <div class="form-holder">
              <input type="id" class="input"  id="login_id" name="cust_id" placeholder="id" />
              <input type="password" class="input" id="login_pw" name="cust_pwd" placeholder="Password" />
            </div>
            <input type="button" class="submit-btn" id="login-btn" value="Log in">
            <!-- 네이버 로그인 -->
          <div id="naver_id_login" style="display: inline-block;"></div>
          <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		    <script type="text/javascript">
			    var naver_id_login = new naver_id_login("6U_OLLsWLPImryNodbKG", "http://localhost:8181/projectfinal/cust_naverReg");
			    var state = naver_id_login.getUniqState();
			    naver_id_login.setButton("white", 3,30);
			    naver_id_login.setDomain("http://localhost:8181/projectfinal/cust_login");
			    naver_id_login.setState(state);
// 			    naver_id_login.setPopup();
			    naver_id_login.init_naver_id_login();
			</script>
            <!-- 카카오 로그인 -->
			<div onclick="kakaoLogin()" style="cursor: pointer; width: 139px; display: inline-block;">
				<img src="${pageContext.request.contextPath}/resources/images/kakao_login_narrow.png" style="width:138px; height:30px; display: inline-block;">
			</div>
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				Kakao.init('b847e29c615395558a4cfab1ad3665db'); //발급받은 키 중 javascript키를 사용해준다.
				console.log(Kakao.isInitialized()); // sdk초기화여부판단
				//카카오로그인
				function kakaoLogin() {
				    Kakao.Auth.login({
				      success: function (response) {
				        Kakao.API.request({
				          url: '/v2/user/me',
				          success: function (response) {
				        	  console.log(response.kakao_account.email);
				        	  var email = response.kakao_account.email;
				        	  console.log(response.properties.nickname);
				        	  var name = response.properties.nickname;
				        	  location.href="cust_kakaoReg?email="+email+"&name="+encodeURI(name);
				          },
				          fail: function (error) {
				            console.log(error)
				          },
				        })
				      },
				      fail: function (error) {
				        console.log(error)
				      },
				    })
				  }
          </script>
            <br><br><a href="find_id_form" class="forget-id-pw">Forget ID</a><a class="forget-id-pw">or</a><a href="cust_pw_form" class="forget-id-pw">Password</a>
          </form>
          </div>
        </div>
      </div>
      <!-- <img src="image/btnD_icon_square.png" style="width: 6%;" height="6%"> -->
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script>
      console.clear();

      window.onload = function() {
        const loginBtn = document.getElementById("login");
        const signupBtn = document.getElementById("signup");

        loginBtn.addEventListener("click", function(e) {
          let parent = e.target.parentNode.parentNode;
          Array.from(e.target.parentNode.parentNode.classList).find(function(element) {
            if (element !== "slide-up") {
              parent.classList.add("slide-up");
            } else {
              signupBtn.parentNode.classList.add("slide-up");
              parent.classList.remove("slide-up");
            }
          });
        });

        signupBtn.addEventListener("click", function(e) {
          let parent = e.target.parentNode;
          Array.from(e.target.parentNode.classList).find(function(element) {
            if (element !== "slide-up") {
              parent.classList.add("slide-up");
            } else {
              loginBtn.parentNode.parentNode.classList.add("slide-up");
              parent.classList.remove("slide-up");
            }
          });
        });

        document.getElementById("login").click();

        document.getElementById("address_kakao").addEventListener("click", function() {
          const onComplete = function(data) {
            document.getElementById("address_kakao").value = data.address;
          };

          new daum.Postcode({
            oncomplete: onComplete,
            autoClose: true
          }).open();
        });
      };
</script>
	<!----------------------------------- footer 시작 ------------------------------->
<div class="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>
<!-- 	<div class="footer"></div> -->
</body>
</html>