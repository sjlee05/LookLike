<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>

<script>
    var naver_id_login = new naver_id_login("6U_OLLsWLPImryNodbKG", "http://localhost:8181/projectfinal/cust_naverReg");
	// 접근 토큰 값 출력
	alert("token : "+naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	    n_email = naver_id_login.getProfileData('email');
	    document.getElementById('cust_email').value = n_email;
	    n_name = naver_id_login.getProfileData('name');
	    document.getElementById('cust_name').value = n_name;
	    $("#naver_frm").submit();
	}
</script>
</head>
<body>
<form id="naver_frm" action="cust_naverReg1">
	<input type="text" id="cust_name" name="cust_name" value="">
	<input type="text" id="cust_email" name="cust_email" value="">
</form>
</body>
</html>