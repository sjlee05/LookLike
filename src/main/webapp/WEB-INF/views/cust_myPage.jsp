<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css"> --%>
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
		height: 1100px;
		padding: 20px 0;
	}
	.content{
		width: 1200px;
		height: 1200px;
		margin: auto;
		padding-top: 100px;
	}
	.myPage_tb{
		margin: auto;
		margin-top: 100px;
		margin-bottom: 100px;
		text-align: center;
		padding: 5px;
		border-collapse: collapse;
	}
	.myPage_orderView{
		width: 700px;
		margin: auto;
		text-align: center;
		padding: 5px;
		border-collapse: collapse;
	}
	.myPage_tb td{
 		background-color: #FFFAFA;	
   		border: 10px solid #FFFAFA;
  		width: 200px;
  		height: 200px;
		font-size: 25px;
	}
	.myPage_tb td:hover{
		background-color: #BC8F8F;
	}
	.myPage_orderView td{
		font-size: 25px;
		width: 100px;
	}
	.mp_div{
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
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
</style>
<script>
	$(function(){
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
   			$(".login-btn").attr("onclick", "location.href='cust_login';");
   		}
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<a class="login-a" href="#"><button class="login-btn">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
	<div class="notice_main">
		<h4 style="color:#BC8F8F;">My Page</h4>
	</div><hr><br><br>
	<div class="content">
			<h2>${cust_id} (${cust_name}) 님 반갑습니다</h2>
		<table class="myPage_tb">
			<tr>
				<td><div class="mp_div" onclick="location.href='cust_cart'">장바구니</div></td>
				<td><div class="mp_div" onclick="location.href='cust_wish'">관심내역</div></td>
				<td><div class="mp_div" onclick="location.href='cust_orderView'">주문내역</div></td>
				<td><div class="mp_div" onclick="location.href='cust_qna'">문의내역</div></td>
				<td><div class="mp_div" onclick="location.href='cust_myInfo'">내 정보</div></td>
			</tr>
		</table>
		<table class="myPage_orderView">
			<tr>
				<td colspan="4" style="height:50px;">주문처리 현황</td>
			</tr>
			<tr>
				<td>
					배송중
				</td>
				<td>
					배송완료
				</td>
				<td>
					환불 요청중
				</td>
				<td>
					환불 완료
				</td>
			</tr>
			<tr>
				<td style="height:100px; font-size: 40px;">
					${count[0]}
				</td>
				<td style="font-size: 40px;">
					${count[1]}
				</td>
				<td style="font-size: 40px;">
					${count[2]}
				</td>
				<td style="font-size: 40px;">
					${count[3]}
				</td>
			</tr>
		</table>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>