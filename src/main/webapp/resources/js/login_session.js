$(function(){
	var session_id = "${session_id}";
	if(session_id){
		$(".login-btn").text(session_id);
		$(".login-btn").removeAttr("onclick");
		$(".login-btn").attr("onclick", "location.href='logout';");
	}else{
		$(".login-btn").text("Log In");
		$(".login-btn").removeAttr("onclick");
		$(".login-btn").attr("onclick", "location.href='login';");
	}
});
