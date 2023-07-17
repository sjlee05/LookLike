<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<style>
	body{
		background-color: #FFFAFA;
		font-family: 'Times New Roman', Times, serif;
	}
	.list_name{
		margin-top: 100px;
	}
	.list_main{
		margin: 0 auto;
		width: 1000px;
		height: 900px;
		padding: 20px 0;
	}
	.content{
		width: 900px;
		height: 1000px;
		margin: auto;
		padding-top: 100px;
	}
	.myInfo_tb{
		border: 1px solid black;
		width: 90%;
		height: 500px;
		margin: auto;
	}
	.info_delete_tb{
		border: 1px solid black;
		width: 90%;
		height: 175px;
		margin: auto;
		margin-top: 50px;
	}
	.myInfo_tb td{
		padding-left: 80px;
	}
	.info_delete_tb td{
		padding-left: 80px;
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
	.info_delete_tb button,
	#pay_btn_div button{
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
	.info_delete_tb button:hover,
	#pay_btn_div button:hover {
	    background-color: #696969;
	}
</style>
<script>
	$(function(){
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
		var pwConfirm = false;
		var nameConfirm = false;
		if($('input[name=cust_name]').val().length>0){
			nameConfirm = true;
		}
		var emailConfirm = false;
		if($('input[name=cust_email]').val().length>0){
			emailConfirm = true;
		}
		var phoneConfirm = false;
		if($('input[name=cust_phone]').val().length>0){
			phoneConfirm = true;
		}
		var addrConfirm = false;
		if($('input[name=cust_addr]').val().length>0){
			addrConfirm = true;
		}
		
		var cust_id = "${cust_id}";
		$(".modal-btn").hide();
		
   		if(cust_id){
   			$(".login-btn").text(cust_id);
   			$(".login-btn").css({"background-color":"gray"});
   			
   			$(".login-btn").removeAttr("onclick");
   			$(".login-btn").attr("onclick", "location.href='cust_myPage';");
   			$(".modal-btn").show();
   		}else{
   			$(".login-btn").text("Log In");
   			$(".login-btn").css({"background-color":"lightblue"});
   			
   			$(".login-btn").removeAttr("onclick");
   			$(".login-btn").attr("onclick", "location.href='login';");
   		}
   		
   		$('input[name=cust_pwd]').keyup(function(){
   	    	if($('input[name=cust_pwd]').val().length!=0 && $('input[name=cust_pwd_c]').val().length!=0){
   	    		if($('input[name=cust_pwd]').val()!=$('input[name=cust_pwd_c]').val()){
   	    			$('font[name=pw_check]').html("암호 불일치").css({color:"red"});
   	    			  pwConfirm = false;
   	    		}else{
   	    			$('font[name=pw_check]').text('');
   	    			$('font[name=pw_check]').html("암호 일치").css({color:"green"});
   	    			pwConfirm = true;
   	    	   }
   	       }
   		}); //#chpass.keyup
   		$('input[name=cust_pwd_c]').keyup(function(){
   	    	if($('input[name=cust_pwd_c]').val().length!=0 && $('input[name=cust_pwd]').val().length!=0){
   	    		if($('input[name=cust_pwd_c]').val()!=$('input[name=cust_pwd]').val()){
   	    			$('font[name=pw_check]').html("암호틀림").css({color:"red"});
   	    			pwConfirm = false;
   	    		}else{
   	    			$('font[name=pw_check]').text('');
   	    			$('font[name=pw_check]').html("암호맞음").css({color:"green"});
   	    			pwConfirm = true;
   	    	   }
   	       }
   	      }); //#chpass.keyup
//       	이름 체크
   	      $('input[name=cust_name]').blur(function(){
   	    		if($('input[name=cust_name]').val().length==0){
   	    			$('font[name=name_check]').html("이름을 입력해주세요").css({color:"red"});
   	    			  nameConfirm = false;
   	    		}else{
   	    			$('font[name=name_check]').html("").css({color:"green"});
   	    			  nameConfirm = true;
   	       		}
   	      }); //#chpass.keyup
//   	     	이메일 체크
   	      $('input[name=cust_email]').blur(function(){
   	    		if($('input[name=cust_email]').val().length==0){
   	    			$('font[name=email_check]').html("이메일을 입력해주세요").css({color:"red"});
   	    			emailConfirm = false;
   	    		}else if(checkEmail($('input[name=cust_email]').val())==false){
   	    			$('font[name=email_check]').html("올바른 이메일 형식이 아닙니다").css({color:"red"});
   	    	   }else{
   	   			$('font[name=email_check]').html("").css({color:"green"});
   	   			emailConfirm = true;
   	      		}
   	      }); //#chpass.keyup
//   	     	번호 체크
   	      $('input[name=cust_phone]').blur(function(){
   	    		if($('input[name=cust_phone]').val().length==0){
   	    			$('font[name=phone_check]').html("전화번호를 입력해주세요").css({color:"red"});
   	    			phoneConfirm = false;
   	    		}else if(checkSpecial($('input[name=cust_phone]').val())){
   	    			$('font[name=phone_check]').html("특수문자없이<br>입력해주세요").css({color:"red"});
   	    			phoneConfirm = false;
   	    		}else if($('input[name=cust_phone]').val().length!=10&&$('input[name=cust_phone]').val().length!=11){
   	    			$('font[name=phone_check]').html("올바른 형식이 아닙니다").css({color:"red"});
   	    			phoneConfirm = false;
   	    		}else{
   	    			$('font[name=phone_check]').html("").css({color:"green"});
   	    			phoneConfirm = true;
   	    		}
   	      }); //#chpass.keyup
//   	     	주소 체크
   	      $('input[name=cust_addr]').blur(function(){
   	    		if($('input[name=cust_addr]').val().length==0){
   	    			$('font[name=addr_check]').text('');
   	    			$('font[name=addr_check]').html("주소를 입력해주세요").css({color:"red"});
   	    			addrConfirm = false;
   	    		}else{
   	    			$('font[name=addr_check]').html("").css({color:"green"});
   	    			addrConfirm = true;
   	       		}
   	      }); //#chpass.keyup
   	   $('#info_update_btn').on("click", function(){
			if (pwConfirm&&nameConfirm&&emailConfirm&&phoneConfirm&&addrConfirm){
				var info_data = $("#info_frm").serialize();
				$.ajax({
				    url:"cust_userUpdate",
					type:"post",
					data:info_data,
					success:function(){
			   		   alert("회원정보가 수정되었습니다");
			   		   location.href="cust_myPage";
					},
					error:function(request, error){
					   alert(""+request.status+"\n"+error);
					}
				}); // ajax 끝
			}else{
				alert("형식에 맞지 않는 입력입니다<br>입력을 다시 확인해주세요");
			}
   	   });
   	   $(".info_delete_tb").hide();
   	   $('#info_delete_btn').on("click", function(){
   	   	   var pwdCheck = "${pwdCheck}";
	   	   $(".info_delete_tb").show();
	   	   
	   	   if (pwdCheck=='naver_pwd'||pwdCheck=='kakao_pwd'){
	   	    	$(".info_delete_tb tr").first().hide();
	   	    	$("#info_delete_btn2").text("소셜 회원 탈퇴");
	   	   }
   	   });
   	   $('#info_delete_btn2').on("click", function(){
   	   	   var pwdCheck = "${pwdCheck}";
   		   var delete_pwd = $("#delete_pwd").val();
   		   var delete_btn_name = $("#info_delete_btn2").text();
   		   if (delete_btn_name == "소셜 회원 탈퇴" || delete_pwd==pwdCheck){
	   			if(confirm("정말 회원정보를 삭제하시겠습니까?")){
		   			$.ajax({
					    url:"cust_userDelete",
						type:"post",
						data:{cust_id : cust_id},
						success:function(){
				   		   alert("회원정보가 삭제되었습니다");
				   		   location.href="cust_main";
						},
						error:function(request, error){
						   alert(""+request.status+"\n"+error);
						}
					}); // ajax 끝
	   			}else{
	   				alert("삭제가 취소되었습니다");			
	   			}
   		   }else{
   			   alert("비밀번호가 일치하지 않습니다");
   		   }
   	   });
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<a class="login-a" href="#"><button class="login-btn">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
	<div class="notice_main">
		<h4 style="color:#BC8F8F;">My Info</h4>
	</div><hr><br><br>
	<div class="content">
		<form id="info_frm">
		<table class="myInfo_tb">
			<tr>
				<td>아이디</td>
				<td style="width:600px;">${dto.cust_id}
				<input type="hidden" name="cust_id" value="${dto.cust_id}">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="cust_name" value="${dto.cust_name}"><font name="name_check" size="2"></font>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="cust_pwd" value=""></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="cust_pwd_c" value=""><font name="pw_check"></font>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="cust_email" value="${dto.cust_email}"><font name="email_check"></font>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="cust_phone" value="${dto.cust_phone}"><font name="phone_check" ></font>
				</td>
			</tr>
			<tr>
				<td>집전화(선택)</td>
				<td><input type="text" name="cust_tel" value="${dto.cust_tel}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="cust_addr" value="${dto.cust_addr}"><font name="addr_check" ></font>
				</td>
			</tr>
			<tr><td colspan="2" style="padding:0; text-align: center;">
				<div id="pay_btn_div"style="text-align: center;">
 					<button type="button" id="info_update_btn">개인정보 수정</button>
 					<button type="button" id="info_delete_btn">회원 탈퇴</button>
				</div>
				
			</td></tr>
		</table>
		</form>
		<form method="post" id="info_delete_form">
			<table class="info_delete_tb">
				<tr>
					<td>비밀번호</td>
					<td style="width:600px;">
						<input type="hidden" name="cust_id" value="${dto.cust_id}">
						<input type="password" name="cust_pwd" id="delete_pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 0; text-align: center;">
		 				<button type="button" id="info_delete_btn2">회원 탈퇴</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>