<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <link href="resources/css/stylelogin.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="resources/css/button.css">
    <link rel="stylesheet" href="resources/css/nav.css">
    <script src="resources/js/nav.js"></script>
    <link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
$(function(){
	 function copyToClipboard(text) {
	      var $tempInput = $('<input>');  // 임시 input 요소 생성
	      $('body').append($tempInput);  // body에 추가
	      $tempInput.val(text).select();  // 텍스트 설정하고 선택
	      document.execCommand('copy');  // 클립보드에 복사
	      $tempInput.remove();  // 임시 input 요소 제거
	 }
	 $(".footer").hover(function(){
	   $(this).animate({"bottom":0});
	 },function(){
	   $(this).animate({"bottom":"-180px"});
	 });
	 $("#pwFind_btn").on("click", function(){
		 mail_Check();
	 });
	 $("#showCode").on("click", function(){
		 var codeTxt = $("#code").text();
		 copyToClipboard(codeTxt);
		 alert("코드가 복사되었습니다");
	 });
	 $("#codeCheck_btn").hide();
	 $("#code_input").hide();
	 $("#showCode").hide();
	 $("#codeCheck_btn").on("click", function(){
		if ($("#code_input").val()==code){
			$.ajax({
  	          type: "post",
  	          url: "changePassword",
  	          data: {email: cust_email},
  	          success: function(data) {
  	        	  $("#code").text(data);
  	        	  $("#hiddenCode").val(data);
  	        	  alert("임시 비밀번호가 발급되었습니다");
  	          },
  	          error: function() {
  	            alert("오류가 발생했습니다");
  	          }
  	        });
		}
	 });
	function mail_Check(){
	   //form 요소 자체
		cust_id = $("input[name=cust_id]").val(); 
		cust_email = $("input[name=cust_email]").val();
		$("#code_input").attr("disabled",true);
	     $.ajax({
	          type: "POST",
	          url: "cust_pwFind",
	          data: {cust_id : cust_id,
	        	 	    cust_email : cust_email},
	          success: function(data) {
	            if (data==1) {
	              alert(""+cust_email+" 로 메일 발송 준비중입니다<br>확인을 누르면 발송이 완료됩니다");
	              $.ajax({
	    	          type: "post",
	    	          url: "sendEmail",
	    	          data: {email: cust_email},
	    	          success: function(data) {
	    	              $("#code_input").attr("disabled",false);
	    	              code = data;
	    	        	  alert("인증번호 발송 ,  data : "+data);
						  $("#codeCheck_btn").show();
						  $("#code_input").show();
						  $("#showCode").show();
	    	          },
	    	          error: function() {
	    	            alert("오류가 발생했습니다");
	    	          }
	    	        });
	            } else {
	              alert("입력한 정보와 일치하는 아이디가 없습니다.");
	            }
	          },
	          error: function() {
  	            alert("오류가 발생했습니다");
	          }
	        });
	   }
});
</script>
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
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="form-structor">
   <form id="frm" method="post" action="#">
        <div class="signup">
          <h2 class="form-title" id="signup">비밀번호 찾기</h2>
          <div class="form-holder">
            <input type="text" class="input" placeholder="id" name="cust_id"/>
            <input type="email" class="input" placeholder="email" name="cust_email"/>
          </div>
          	<button type="button" class="submit-btn" id="pwFind_btn">인증번호 전송</button>
          <div class="form-holder">
          	<input type="text" class="input" id="code_input" placeholder="인증번호">
          </div>
          	<button type="button" class="submit-btn" id="codeCheck_btn">인증번호 확인</button>
          	<button type="button" class="submit-btn" id="showCode" style="cursor:default;">
				인증번호 (클릭 시 복사)<br><span id="code" style="font-size:30px;">인증번호</span>
				<input type="hidden" id="hiddenCode">
			</button>
        </div>
      </form> 
 </div>
<div class="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>
</body>
</html>